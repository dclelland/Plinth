//
//  Images.swift
//  Images
//
//  Created by Daniel Clelland on 3/06/23.
//

import Foundation
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
        fatalError("UIImage to Matrix conversion not implemented yet")
    }

    public var uiImage: UIImage {
        fatalError("Matrix to UIImage conversion not implemented yet")
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
        let elements = CGContext(
            data: nil,
            width: cgImage.width,
            height: cgImage.height,
            bitsPerComponent: 8,
            bytesPerRow: cgImage.width,
            space: CGColorSpaceCreateDeviceGray(),
            bitmapInfo: CGImageAlphaInfo.none.rawValue
        ).flatMap { context in
            context.draw(cgImage, in: CGRect(x: 0, y: 0, width: cgImage.width, height: cgImage.height))
            return context.data.flatMap { data in
                return Array<UInt8>(
                    UnsafeBufferPointer(
                        start: data.bindMemory(to: UInt8.self, capacity: cgImage.width * cgImage.height),
                        count: cgImage.width * cgImage.height
                    )
                )
            }
        }
        guard let elements = elements else {
            return nil
        }
        self.init(shape: .init(rows: cgImage.height, columns: cgImage.width), elements: elements)
    }
    
    public var cgImage: CGImage {
        var elements = elements
        return CGContext(
            data: &elements,
            width: shape.columns,
            height: shape.rows,
            bitsPerComponent: 8,
            bytesPerRow: shape.columns,
            space: CGColorSpaceCreateDeviceGray(),
            bitmapInfo: CGImageAlphaInfo.none.rawValue
        ).flatMap { context in
            return context.makeImage()
        }!
    }
    
}
