//
//  Matrix+Arithmetic.swift
//  Plinth
//
//  Created by Daniel Clelland on 20/04/22.
//

import Foundation
import Accelerate

public protocol MatrixArithmetic {
    
    associatedtype Scalar
    
    static prefix func + (matrix: Self) -> Self
    static prefix func - (matrix: Self) -> Self
    
    static func + (left: Self, right: Scalar) -> Self
    static func + (left: Scalar, right: Self) -> Self
    static func + (left: Self, right: Self) -> Self
    
    static func - (left: Self, right: Scalar) -> Self
    static func - (left: Scalar, right: Self) -> Self
    static func - (left: Self, right: Self) -> Self
    
    static func * (left: Self, right: Scalar) -> Self
    static func * (left: Scalar, right: Self) -> Self
    static func * (left: Self, right: Self) -> Self
    
    static func / (left: Self, right: Scalar) -> Self
    static func / (left: Scalar, right: Self) -> Self
    static func / (left: Self, right: Self) -> Self
    
}

extension MatrixArithmetic {
    
    public static func += (left: inout Self, right: Scalar) {
        left = left + right
    }
    
    public static func += (left: inout Self, right: Self) {
        left = left + right
    }
    
    public static func -= (left: inout Self, right: Scalar) {
        left = left - right
    }
    
    public static func -= (left: inout Self, right: Self) {
        left = left - right
    }
    
    public static func *= (left: inout Self, right: Scalar) {
        left = left * right
    }
    
    public static func *= (left: inout Self, right: Self) {
        left = left * right
    }
    
    public static func /= (left: inout Self, right: Scalar) {
        left = left / right
    }
    
    public static func /= (left: inout Self, right: Self) {
        left = left / right
    }
    
}

extension Matrix: MatrixArithmetic where Scalar == Double {
    
    public static prefix func + (matrix: Matrix) -> Matrix {
        return matrix
    }
    
    public static prefix func - (matrix: Matrix) -> Matrix {
        return Matrix(size: matrix.size, elements: vDSP.negative(matrix))
    }
    
    public static func + (left: Matrix, right: Scalar) -> Matrix {
        return Matrix(size: left.size, elements: vDSP.add(right, left))
    }
    
    public static func + (left: Scalar, right: Matrix) -> Matrix {
        return Matrix(size: right.size, elements: vDSP.add(left, right))
    }
    
    public static func + (left: Matrix, right: Matrix) -> Matrix {
        return Matrix(size: left.size, elements: vDSP.add(left, right))
    }
    
    public static func - (left: Matrix, right: Scalar) -> Matrix {
        return Matrix(size: left.size, elements: vDSP.add(-right, left))
    }
    
    public static func - (left: Scalar, right: Matrix) -> Matrix {
        return Matrix(size: right.size, elements: vDSP.add(-left, right))
    }
    
    public static func - (left: Matrix, right: Matrix) -> Matrix {
        return Matrix(size: left.size, elements: vDSP.subtract(left, right))
    }
    
    public static func * (left: Matrix, right: Scalar) -> Matrix {
        return Matrix(size: left.size, elements: vDSP.multiply(right, left))
    }
    
    public static func * (left: Scalar, right: Matrix) -> Matrix {
        return Matrix(size: right.size, elements: vDSP.multiply(left, right))
    }
    
    public static func * (left: Matrix, right: Matrix) -> Matrix {
        return Matrix(size: left.size, elements: vDSP.multiply(left, right))
    }
    
    public static func / (left: Matrix, right: Scalar) -> Matrix {
        return Matrix(size: left.size, elements: vDSP.divide(left, right))
    }
    
    public static func / (left: Scalar, right: Matrix) -> Matrix {
        return Matrix(size: right.size, elements: vDSP.divide(left, right))
    }
    
    public static func / (left: Matrix, right: Matrix) -> Matrix {
        return Matrix(size: left.size, elements: vDSP.divide(left, right))
    }
    
}
