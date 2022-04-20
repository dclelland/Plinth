//
//  Matrix+Arithmetic.swift
//  Plinth
//
//  Created by Daniel Clelland on 20/04/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    @inlinable public static prefix func + (operand: Matrix) -> Matrix {
        return operand
    }
    
    @inlinable public static prefix func - (operand: Matrix) -> Matrix {
        return Matrix(shape: operand.shape, elements: vDSP.negative(operand))
    }
    
    @inlinable public static func + (left: Matrix, right: Scalar) -> Matrix {
        return Matrix(shape: left.shape, elements: vDSP.add(right, left))
    }
    
    @inlinable public static func + (left: Scalar, right: Matrix) -> Matrix {
        return Matrix(shape: right.shape, elements: vDSP.add(left, right))
    }
    
    @inlinable public static func + (left: Matrix, right: Matrix) -> Matrix {
        return Matrix(shape: left.shape, elements: vDSP.add(left, right))
    }
    
    @inlinable public static func - (left: Matrix, right: Scalar) -> Matrix {
        return -right + left
    }
    
    @inlinable public static func - (left: Scalar, right: Matrix) -> Matrix {
        return -right + left
    }
    
    @inlinable public static func - (left: Matrix, right: Matrix) -> Matrix {
        return Matrix(shape: left.shape, elements: vDSP.subtract(left, right))
    }
    
    @inlinable public static func * (left: Matrix, right: Scalar) -> Matrix {
        return Matrix(shape: left.shape, elements: vDSP.multiply(right, left))
    }
    
    @inlinable public static func * (left: Scalar, right: Matrix) -> Matrix {
        return Matrix(shape: right.shape, elements: vDSP.multiply(left, right))
    }
    
    @inlinable public static func * (left: Matrix, right: Matrix) -> Matrix {
        return Matrix(shape: left.shape, elements: vDSP.multiply(left, right))
    }
    
    @inlinable public static func / (left: Matrix, right: Scalar) -> Matrix {
        return Matrix(shape: left.shape, elements: vDSP.divide(left, right))
    }
    
    @inlinable public static func / (left: Scalar, right: Matrix) -> Matrix {
        return Matrix(shape: right.shape, elements: vDSP.divide(left, right))
    }
    
    @inlinable public static func / (left: Matrix, right: Matrix) -> Matrix {
        return Matrix(shape: left.shape, elements: vDSP.divide(left, right))
    }
    
    @inlinable public static func += (left: inout Matrix, right: Scalar) {
        left = left + right
    }
    
    @inlinable public static func += (left: inout Matrix, right: Matrix) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout Matrix, right: Scalar) {
        left = left - right
    }
    
    @inlinable public static func -= (left: inout Matrix, right: Matrix) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout Matrix, right: Scalar) {
        left = left * right
    }
    
    @inlinable public static func *= (left: inout Matrix, right: Matrix) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout Matrix, right: Scalar) {
        left = left / right
    }
    
    @inlinable public static func /= (left: inout Matrix, right: Matrix) {
        left = left / right
    }
    
}

extension Matrix where Scalar == Double {
    
    @inlinable public static prefix func + (operand: Matrix) -> Matrix {
        return operand
    }
    
    @inlinable public static prefix func - (operand: Matrix) -> Matrix {
        return Matrix(shape: operand.shape, elements: vDSP.negative(operand))
    }
    
    @inlinable public static func + (left: Matrix, right: Scalar) -> Matrix {
        return Matrix(shape: left.shape, elements: vDSP.add(right, left))
    }
    
    @inlinable public static func + (left: Scalar, right: Matrix) -> Matrix {
        return Matrix(shape: right.shape, elements: vDSP.add(left, right))
    }
    
    @inlinable public static func + (left: Matrix, right: Matrix) -> Matrix {
        return Matrix(shape: left.shape, elements: vDSP.add(left, right))
    }
    
    @inlinable public static func - (left: Matrix, right: Scalar) -> Matrix {
        return -right + left
    }
    
    @inlinable public static func - (left: Scalar, right: Matrix) -> Matrix {
        return -right + left
    }
    
    @inlinable public static func - (left: Matrix, right: Matrix) -> Matrix {
        return Matrix(shape: left.shape, elements: vDSP.subtract(left, right))
    }
    
    @inlinable public static func * (left: Matrix, right: Scalar) -> Matrix {
        return Matrix(shape: left.shape, elements: vDSP.multiply(right, left))
    }
    
    @inlinable public static func * (left: Scalar, right: Matrix) -> Matrix {
        return Matrix(shape: right.shape, elements: vDSP.multiply(left, right))
    }
    
    @inlinable public static func * (left: Matrix, right: Matrix) -> Matrix {
        return Matrix(shape: left.shape, elements: vDSP.multiply(left, right))
    }
    
    @inlinable public static func / (left: Matrix, right: Scalar) -> Matrix {
        return Matrix(shape: left.shape, elements: vDSP.divide(left, right))
    }
    
    @inlinable public static func / (left: Scalar, right: Matrix) -> Matrix {
        return Matrix(shape: right.shape, elements: vDSP.divide(left, right))
    }
    
    @inlinable public static func / (left: Matrix, right: Matrix) -> Matrix {
        return Matrix(shape: left.shape, elements: vDSP.divide(left, right))
    }
    
    @inlinable public static func += (left: inout Matrix, right: Scalar) {
        left = left + right
    }
    
    @inlinable public static func += (left: inout Matrix, right: Matrix) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout Matrix, right: Scalar) {
        left = left - right
    }
    
    @inlinable public static func -= (left: inout Matrix, right: Matrix) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout Matrix, right: Scalar) {
        left = left * right
    }
    
    @inlinable public static func *= (left: inout Matrix, right: Matrix) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout Matrix, right: Scalar) {
        left = left / right
    }
    
    @inlinable public static func /= (left: inout Matrix, right: Matrix) {
        left = left / right
    }
    
}
