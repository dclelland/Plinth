//
//  CGImage.swift
//  Plinth
//
//  Created by Daniel Clelland on 5/06/22.
//

import Foundation
import Accelerate

extension Matrix {
    
    public init(cgImage: CGImage) throws {
        let format = vImage_CGImageFormat(
            bitsPerComponent: MemoryLayout<Scalar>.size * 8,
            bitsPerPixel: MemoryLayout<Scalar>.size * 8,
            colorSpace: CGColorSpaceCreateDeviceGray(),
            bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.noneSkipFirst.rawValue)
        )!
        let buffer = try vImage_Buffer(cgImage: cgImage, format: format)
        self.init(buffer: buffer)
    }
    
    public func cgImage() throws -> CGImage {
        var image = self
        return try image.withImageBuffer { buffer in
            let format = vImage_CGImageFormat(
                bitsPerComponent: MemoryLayout<Scalar>.size * 8,
                bitsPerPixel: MemoryLayout<Scalar>.size * 8,
                colorSpace: CGColorSpaceCreateDeviceGray(),
                bitmapInfo: CGBitmapInfo()
            )!
            return try buffer.createCGImage(format: format)
        }
    }
    
}

extension Matrix {
    
    public init(buffer: vImage_Buffer) {
        let shape = Shape(rows: Int(buffer.height), columns: Int(buffer.width))
        let elements = Array(UnsafeBufferPointer(start: buffer.data.bindMemory(to: Scalar.self, capacity: shape.count), count: shape.count))
        self.init(shape: shape, elements: elements)
    }
    
}
