//
//  Inversion.swift
//  Plinth
//
//  Created by Daniel Clelland on 4/05/22.
//

import Foundation
import Accelerate

public enum InversionError<Scalar>: LocalizedError {
    
    case illegalValue(matrix: Matrix<Scalar>, code: Int32)
    case computationFailed(matrix: Matrix<Scalar>, code: Int32)
    
    public var errorDescription: String? {
        switch self {
        case .illegalValue(_, let code):
            return "Matrix inversion error: Illegal value (\(code))"
        case .computationFailed(_, let code):
            return "Matrix inversion error: Computation failed (\(code))"
        }
    }
    
}

extension Matrix where Scalar == Float {
    
    public func inverted() throws -> Matrix {
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
        
        if error < 0 {
            throw InversionError.illegalValue(matrix: self, code: error)
        }
        
        if error > 0 {
            throw InversionError.computationFailed(matrix: self, code: error)
        }
        
        return input
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func inverted() throws -> ComplexMatrix {
        #warning("Implement ComplexMatrix<Float>.inverted()")
        fatalError()
    }
    
}

extension Matrix where Scalar == Double {
    
    public func inverted() throws -> Matrix {
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
        
        if error < 0 {
            throw InversionError.illegalValue(matrix: self, code: error)
        }
        
        if error > 0 {
            throw InversionError.computationFailed(matrix: self, code: error)
        }
        
        return input
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func inverted() throws -> ComplexMatrix {
        #warning("Implement ComplexMatrix<Double>.inverted()")
        fatalError()
    }
    
}
