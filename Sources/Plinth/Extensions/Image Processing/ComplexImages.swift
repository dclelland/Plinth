//
//  ComplexImages.swift
//  Plinth
//
//  Created by Daniel Clelland on 07/04/2025.
//

import Foundation
import Accelerate
import CoreImage

#if os(macOS)

import AppKit

extension ComplexMatrix where Scalar == Float {

    public var nsImage: NSImage {
        return NSImage(cgImage: cgImage, size: NSSize(width: shape.columns, height: shape.rows))
    }
    
}

#elseif os(iOS)

import UIKit

extension ComplexMatrix where Scalar == Float {

    public var uiImage: UIImage {
        return UIImage(cgImage: cgImage)
    }
    
}

#endif

extension ComplexMatrix where Scalar == Float {
    
    public var ciImage: CIImage {
        return CIImage(cgImage: cgImage)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public var cgImage: CGImage {
        return pixelBuffer.makeCGImage(cgImageFormat: Self.cgImageFormat)!
    }
    
    private static let cgImageFormat = vImage_CGImageFormat(
        bitsPerComponent: vImage.InterleavedFx3.bitCountPerComponent,
        bitsPerPixel: vImage.InterleavedFx3.bitCountPerPixel,
        colorSpace: CGColorSpaceCreateDeviceRGB(),
        bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue | CGBitmapInfo.floatComponents.rawValue | CGBitmapInfo.byteOrder32Little.rawValue)
    )!
    
}

extension ComplexMatrix where Scalar == Float {
    
    public var pixelBuffer: vImage.PixelBuffer<vImage.InterleavedFx3> {
        let (red, green, blue) = rgbColormap()
        return vImage.PixelBuffer<vImage.InterleavedFx3>(planarBuffers: [red.pixelBuffer, green.pixelBuffer, blue.pixelBuffer])
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func rgbColormap() -> (red: Matrix, green: Matrix, blue: Matrix) {
        let (hue, saturation, brightness) = hsbColormap()
        let chroma = saturation * brightness
        let intermediary = chroma * (hue * 6.0).remainder(.init(shape: shape, repeating: 2.0)).absolute()
        let masks = (0..<6).map { index -> Matrix in
            return (hue * 6.0).floor() == Scalar(index)
        }
        let match = brightness - chroma
        return (
            red: chroma * masks[0] + intermediary * masks[1] + intermediary * masks[4] + chroma * masks[5] + match,
            green: intermediary * masks[0] + chroma * masks[1] + chroma * masks[2] + intermediary * masks[3] + match,
            blue: intermediary * masks[2] + chroma * masks[3] + chroma * masks[4] + intermediary * masks[5] + match
        )
    }
    
    public func hsbColormap() -> (hue: Matrix, saturation: Matrix, brightness: Matrix) {
        return (
            hue: (phase() + (2.0 * .pi))
                .truncatingRemainder(.init(shape: shape, repeating: 2.0 * .pi))
                .normalized(from: 0.0...(2.0 * .pi)),
            saturation: 1.0 / absolute()
                .threshold(to: 1.0, with: .clampToThreshold),
            brightness: absolute()
                .clip(to: 0.0...1.0)
        )
    }
    
}
