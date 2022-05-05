//
//  Inversion.swift
//  Plinth
//
//  Created by Daniel Clelland on 4/05/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public func inverted() -> Matrix {
        precondition(shape.isSquare)
        
        var input = self
        var length = __CLPK_integer(shape.length)
        var pivots = [__CLPK_integer](repeating: .zero, count: shape.length)
        var workspace = [Scalar](repeating: .zero, count: shape.length)
        var error: __CLPK_integer = 0
        
        withUnsafeMutablePointer(to: &length) { length in
            sgetrf_(length, length, &input.elements, length, &pivots, &error)
            sgetri_(length, &input.elements, length, &pivots, &workspace, length, &error)
        }
        
        precondition(error == 0)
        
        return input
    }
    
}

extension Matrix where Scalar == Double {
    
    public func inverted() -> Matrix {
        precondition(shape.isSquare)
        
        var input = self
        var length = __CLPK_integer(shape.length)
        var pivots = [__CLPK_integer](repeating: .zero, count: shape.length)
        var workspace = [Scalar](repeating: .zero, count: shape.length)
        var error: __CLPK_integer = 0
        
        withUnsafeMutablePointer(to: &length) { length in
            dgetrf_(length, length, &input.elements, length, &pivots, &error)
            dgetri_(length, &input.elements, length, &pivots, &workspace, length, &error)
        }
        
        precondition(error == 0)
        
        return input
    }
    
}
