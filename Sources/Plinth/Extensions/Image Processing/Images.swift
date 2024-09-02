//
//  Images.swift
//  Images
//
//  Created by Daniel Clelland on 3/06/23.
//

import Foundation
import Accelerate
import CoreImage

#if os(macOS)

import AppKit

extension Matrix where Scalar == UInt8 {
    
    public init?(nsImage: NSImage) {
        var rect = CGRect(x: 0, y: 0, width: nsImage.size.width, height: nsImage.size.height)
        guard let cgImage = nsImage.cgImage(forProposedRect: &rect, context: nil, hints: nil) else {
            return nil
        }
        self.init(cgImage: cgImage)
    }

    public var nsImage: NSImage {
        return NSImage(cgImage: cgImage, size: NSSize(width: shape.columns, height: shape.rows))
    }
    
}

#elseif os(iOS)

import UIKit

extension Matrix where Scalar == UInt8 {
    
    public init?(uiImage: UIImage) {
        guard let cgImage = uiImage.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }

    public var uiImage: UIImage {
        return UIImage(cgImage: cgImage)
    }
    
}

#endif

extension Matrix where Scalar == UInt8 {
    
    public init?(ciImage: CIImage) {
        guard let cgImage = CIContext().createCGImage(ciImage, from: ciImage.extent) else {
            return nil
        }
        self.init(cgImage: cgImage)
    }
    
    public var ciImage: CIImage {
        return CIImage(cgImage: cgImage)
    }
    
}

extension Matrix where Scalar == UInt8 {
    
    public init?(cgImage: CGImage) {
        var cgImageFormat = Self.cgImageFormat
        try? self.init(pixelBuffer: vImage.PixelBuffer<vImage.Planar8>(cgImage: cgImage, cgImageFormat: &cgImageFormat))
    }
    
    public var cgImage: CGImage {
        return pixelBuffer.makeCGImage(cgImageFormat: Self.cgImageFormat)!
    }
    
    private static let cgImageFormat = vImage_CGImageFormat(
        bitsPerComponent: vImage.Planar8.bitCountPerComponent,
        bitsPerPixel: vImage.Planar8.bitCountPerPixel,
        colorSpace: CGColorSpaceCreateDeviceGray(),
        bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
    )!
    
}

extension Matrix where Scalar == UInt8 {
    
    public init(pixelBuffer: vImage.PixelBuffer<vImage.Planar8>) {
        self.init(shape: .init(rows: pixelBuffer.height, columns: pixelBuffer.width), elements: pixelBuffer.array)
    }
    
    public var pixelBuffer: vImage.PixelBuffer<vImage.Planar8> {
        return vImage.PixelBuffer<vImage.Planar8>(pixelValues: elements, size: vImage.Size(width: shape.columns, height: shape.rows))
    }
    
}

#if os(macOS)

import AppKit

extension Matrix where Scalar == Float {
    
    public init?(nsImage: NSImage) {
        var rect = CGRect(x: 0, y: 0, width: nsImage.size.width, height: nsImage.size.height)
        guard let cgImage = nsImage.cgImage(forProposedRect: &rect, context: nil, hints: nil) else {
            return nil
        }
        self.init(cgImage: cgImage)
    }

    public var nsImage: NSImage {
        return NSImage(cgImage: cgImage, size: NSSize(width: shape.columns, height: shape.rows))
    }
    
}

#elseif os(iOS)

import UIKit

extension Matrix where Scalar == Float {
    
    public init?(uiImage: UIImage) {
        guard let cgImage = uiImage.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }

    public var uiImage: UIImage {
        return UIImage(cgImage: cgImage)
    }
    
}

#endif

extension Matrix where Scalar == Float {
    
    public init?(ciImage: CIImage) {
        guard let cgImage = CIContext().createCGImage(ciImage, from: ciImage.extent) else {
            return nil
        }
        self.init(cgImage: cgImage)
    }
    
    public var ciImage: CIImage {
        return CIImage(cgImage: cgImage)
    }
    
}

extension Matrix where Scalar == Float {
    
    public init?(cgImage: CGImage) {
        var cgImageFormat = Self.cgImageFormat
        try? self.init(pixelBuffer: vImage.PixelBuffer<vImage.PlanarF>(cgImage: cgImage, cgImageFormat: &cgImageFormat))
    }
    
    public var cgImage: CGImage {
        return pixelBuffer.makeCGImage(cgImageFormat: Self.cgImageFormat)!
    }
    
    private static let cgImageFormat = vImage_CGImageFormat(
        bitsPerComponent: vImage.PlanarF.bitCountPerComponent,
        bitsPerPixel: vImage.PlanarF.bitCountPerPixel,
        colorSpace: CGColorSpaceCreateDeviceGray(),
        bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue | CGBitmapInfo.floatComponents.rawValue | CGBitmapInfo.byteOrder32Little.rawValue)
    )!
    
}

extension Matrix where Scalar == Float {
    
    public init(pixelBuffer: vImage.PixelBuffer<vImage.PlanarF>) {
        self.init(shape: .init(rows: pixelBuffer.height, columns: pixelBuffer.width), elements: pixelBuffer.array)
    }
    
    public var pixelBuffer: vImage.PixelBuffer<vImage.PlanarF> {
        return vImage.PixelBuffer<vImage.PlanarF>(pixelValues: elements, size: vImage.Size(width: shape.columns, height: shape.rows))
    }
    
}
