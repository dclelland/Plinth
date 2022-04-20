//
//  Matrix+Arithmetic.swift
//  Plinth
//
//  Created by Daniel Clelland on 20/04/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public static prefix func + (right: Matrix) -> Matrix {
        return right
    }
    
    public static prefix func - (right: Matrix) -> Matrix {
        return Matrix(size: right.size, elements: vDSP.negative(right))
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
        return -right + left
    }
    
    public static func - (left: Scalar, right: Matrix) -> Matrix {
        return -right + left
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
    
    public static func += (left: inout Matrix, right: Scalar) {
        left = left + right
    }
    
    public static func += (left: inout Matrix, right: Matrix) {
        left = left + right
    }
    
    public static func -= (left: inout Matrix, right: Scalar) {
        left = left - right
    }
    
    public static func -= (left: inout Matrix, right: Matrix) {
        left = left - right
    }
    
    public static func *= (left: inout Matrix, right: Scalar) {
        left = left * right
    }
    
    public static func *= (left: inout Matrix, right: Matrix) {
        left = left * right
    }
    
    public static func /= (left: inout Matrix, right: Scalar) {
        left = left / right
    }
    
    public static func /= (left: inout Matrix, right: Matrix) {
        left = left / right
    }
    
}

extension Matrix where Scalar == Double {
    
    public static prefix func + (right: Matrix) -> Matrix {
        return right
    }
    
    public static prefix func - (right: Matrix) -> Matrix {
        return Matrix(size: right.size, elements: vDSP.negative(right))
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
        return -right + left
    }
    
    public static func - (left: Scalar, right: Matrix) -> Matrix {
        return -right + left
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
    
    public static func += (left: inout Matrix, right: Scalar) {
        left = left + right
    }
    
    public static func += (left: inout Matrix, right: Matrix) {
        left = left + right
    }
    
    public static func -= (left: inout Matrix, right: Scalar) {
        left = left - right
    }
    
    public static func -= (left: inout Matrix, right: Matrix) {
        left = left - right
    }
    
    public static func *= (left: inout Matrix, right: Scalar) {
        left = left * right
    }
    
    public static func *= (left: inout Matrix, right: Matrix) {
        left = left * right
    }
    
    public static func /= (left: inout Matrix, right: Scalar) {
        left = left / right
    }
    
    public static func /= (left: inout Matrix, right: Matrix) {
        left = left / right
    }
    
}
