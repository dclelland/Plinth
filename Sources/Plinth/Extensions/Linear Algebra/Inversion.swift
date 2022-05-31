//
//  Inversion.swift
//  Plinth
//
//  Created by Daniel Clelland on 4/05/22.
//

import Foundation
import Accelerate
import Numerics

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

public enum ComplexInversionError<Scalar>: LocalizedError where Scalar: Real {
    
    case illegalValue(matrix: ComplexMatrix<Scalar>, code: Int32)
    case computationFailed(matrix: ComplexMatrix<Scalar>, code: Int32)
    
    public var errorDescription: String? {
        switch self {
        case .illegalValue(_, let code):
            return "Complex matrix inversion error: Illegal value (\(code))"
        case .computationFailed(_, let code):
            return "Complex matrix inversion error: Computation failed (\(code))"
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
        precondition(shape.isSquare)
        
        var input = zip(real, imaginary).map { __CLPK_complex(r: $0, i: $1) }
        var length = __CLPK_integer(shape.length)
        var pivots = [__CLPK_integer](repeating: .zero, count: shape.length)
        var workspace = [__CLPK_complex](repeating: __CLPK_complex(), count: shape.length)
        var error: __CLPK_integer = 0
        
        withUnsafeMutablePointer(to: &length) { length in
            cgetrf_(length, length, &input, length, &pivots, &error)
            cgetri_(length, &input, length, &pivots, &workspace, length, &error)
        }
        
        if error < 0 {
            throw ComplexInversionError.illegalValue(matrix: self, code: error)
        }
        
        if error > 0 {
            throw ComplexInversionError.computationFailed(matrix: self, code: error)
        }
        
        return ComplexMatrix(real: .init(shape: shape, elements: input.map(\.r)), imaginary: .init(shape: shape, elements: input.map(\.i)))
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
        precondition(shape.isSquare)
        
        var input = zip(real, imaginary).map { __CLPK_doublecomplex(r: $0, i: $1) }
        var length = __CLPK_integer(shape.length)
        var pivots = [__CLPK_integer](repeating: .zero, count: shape.length)
        var workspace = [__CLPK_doublecomplex](repeating: __CLPK_doublecomplex(), count: shape.length)
        var error: __CLPK_integer = 0
        
        withUnsafeMutablePointer(to: &length) { length in
            zgetrf_(length, length, &input, length, &pivots, &error)
            zgetri_(length, &input, length, &pivots, &workspace, length, &error)
        }
        
        if error < 0 {
            throw ComplexInversionError.illegalValue(matrix: self, code: error)
        }
        
        if error > 0 {
            throw ComplexInversionError.computationFailed(matrix: self, code: error)
        }
        
        return ComplexMatrix(real: .init(shape: shape, elements: input.map(\.r)), imaginary: .init(shape: shape, elements: input.map(\.i)))
    }
    
}
