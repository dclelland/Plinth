//
//  ComplexMatrix+Accelerate.swift
//  Plinth
//
//  Created by Daniel Clelland on 20/04/22.
//

import Foundation
import Accelerate

extension ComplexMatrix where Scalar == Float {
    
    @inlinable public mutating func withUnsafeMutableSplitComplexVector<Result>(_ body: (inout DSPSplitComplex) throws -> Result) rethrows -> Result {
        return try real.withUnsafeMutableBufferPointer { realPointer in
            return try imaginary.withUnsafeMutableBufferPointer { imaginaryPointer in
                var split = DSPSplitComplex(realp: realPointer.baseAddress!, imagp: imaginaryPointer.baseAddress!)
                return try body(&split)
            }
        }
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public mutating func withUnsafeMutableSplitComplexVector<Result>(_ body: (inout DSPDoubleSplitComplex) throws -> Result) rethrows -> Result {
        return try real.withUnsafeMutableBufferPointer { realPointer in
            return try imaginary.withUnsafeMutableBufferPointer { imaginaryPointer in
                var split = DSPDoubleSplitComplex(realp: realPointer.baseAddress!, imagp: imaginaryPointer.baseAddress!)
                return try body(&split)
            }
        }
    }
    
}
