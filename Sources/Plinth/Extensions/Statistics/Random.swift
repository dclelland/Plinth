//
//  Random.swift
//  Plinth
//
//  Created by Daniel Clelland on 3/05/22.
//

import Foundation

extension Matrix where Scalar == Float {
    
    public static func random(shape: Shape, in range: Range<Scalar>) -> Matrix {
        return Matrix(shape: shape, Scalar.random(in: range))
    }
    
    public static func random<T>(shape: Shape, in range: Range<Scalar>, using generator: inout T) -> Matrix where T : RandomNumberGenerator {
        return Matrix(shape: shape, Scalar.random(in: range, using: &generator))
    }
    
    public static func random(shape: Shape, in range: ClosedRange<Scalar>) -> Matrix {
        return Matrix(shape: shape, Scalar.random(in: range))
    }
    
    public static func random<T>(shape: Shape, in range: ClosedRange<Scalar>, using generator: inout T) -> Matrix where T : RandomNumberGenerator {
        return Matrix(shape: shape, Scalar.random(in: range, using: &generator))
    }
    
}

extension Matrix where Scalar == Double {
    
    public static func random(shape: Shape, in range: Range<Scalar>) -> Matrix {
        return Matrix(shape: shape, Scalar.random(in: range))
    }
    
    public static func random<T>(shape: Shape, in range: Range<Scalar>, using generator: inout T) -> Matrix where T : RandomNumberGenerator {
        return Matrix(shape: shape, Scalar.random(in: range, using: &generator))
    }
    
    public static func random(shape: Shape, in range: ClosedRange<Scalar>) -> Matrix {
        return Matrix(shape: shape, Scalar.random(in: range))
    }
    
    public static func random<T>(shape: Shape, in range: ClosedRange<Scalar>, using generator: inout T) -> Matrix where T : RandomNumberGenerator {
        return Matrix(shape: shape, Scalar.random(in: range, using: &generator))
    }
    
}
