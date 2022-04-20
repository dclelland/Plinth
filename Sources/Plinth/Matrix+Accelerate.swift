//
//  Matrix+Accelerate.swift
//  Plinth
//
//  Created by Daniel Clelland on 20/04/22.
//

import Foundation
import Accelerate

extension Matrix: AccelerateBuffer {
    
    @inlinable public func withUnsafeBufferPointer<Result>(_ body: (UnsafeBufferPointer<Scalar>) throws -> Result) rethrows -> Result {
        return try elements.withUnsafeBufferPointer(body)
    }
    
}

extension Matrix: AccelerateMutableBuffer {
    
    @inlinable public mutating func withUnsafeMutableBufferPointer<Result>(_ body: (inout UnsafeMutableBufferPointer<Scalar>) throws -> Result) rethrows -> Result {
        return try elements.withUnsafeMutableBufferPointer(body)
    }
    
}
