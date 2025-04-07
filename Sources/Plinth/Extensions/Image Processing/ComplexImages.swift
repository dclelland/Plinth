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
        
        let sextant = hue * 6.0
        let chroma = brightness * saturation
        let match = brightness - chroma
        
        let sector = sextant.floor()
        let sectors = (0..<6).map { sector == Scalar($0) }
        let ramp = sextant.remainder(.init(shape: shape, repeating: 2.0)).absolute()
        let ramps = (0..<6).map { sectors[$0] * ramp }
        
        return (
            red: (ramps[4] + sectors[5] + sectors[0] + ramps[1]) * chroma + match,
            green: (ramps[0] + sectors[1] + sectors[2] + ramps[3]) * chroma + match,
            blue: (ramps[2] + sectors[3] + sectors[4] + ramps[5]) * chroma + match
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
