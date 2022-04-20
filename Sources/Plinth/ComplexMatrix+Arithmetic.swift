//
//  ComplexMatrix+Arithmetic.swift
//  Plinth
//
//  Created by Daniel Clelland on 20/04/22.
//

import Foundation

extension ComplexMatrix where Scalar == Float {
    
    public static prefix func + (operand: ComplexMatrix) -> ComplexMatrix {
        return operand
    }
    
    public static prefix func - (operand: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: -operand.real, imaginary: -operand.imaginary)
    }
    
    public static func + (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return ComplexMatrix(real: left.real + right, imaginary: left.imaginary + right)
    }

    public static func + (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left + right.real, imaginary: left + right.imaginary)
    }
    
    public static func + (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return ComplexMatrix(real: left.real + right.real, imaginary: left.imaginary + right.imaginary)
    }
    
    public static func + (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real + right.real, imaginary: left.imaginary + right.imaginary)
    }
    
    public static func + (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real + right, imaginary: left.imaginary + right)
    }

    public static func + (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left + right.real, imaginary: left + right.imaginary)
    }

    public static func + (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real + right.real, imaginary: left.imaginary + right.imaginary)
    }

    public static func - (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return ComplexMatrix(real: left.real - right, imaginary: left.imaginary - right)
    }

    public static func - (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left - right.real, imaginary: left - right.imaginary)
    }
    
    public static func - (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return ComplexMatrix(real: left.real - right.real, imaginary: left.imaginary - right.imaginary)
    }
    
    public static func - (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real - right.real, imaginary: left.imaginary - right.imaginary)
    }
    
    public static func - (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real - right, imaginary: left.imaginary - right)
    }

    public static func - (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left - right.real, imaginary: left - right.imaginary)
    }

    public static func - (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real - right.real, imaginary: left.imaginary - right.imaginary)
    }

    public static func * (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return ComplexMatrix(real: left.real * right, imaginary: left.imaginary * right)
    }

    public static func * (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left * right.real, imaginary: left * right.imaginary)
    }
    
    public static func * (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return ComplexMatrix(real: left.real * right.real, imaginary: left.imaginary * right.imaginary)
    }
    
    public static func * (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real * right.real, imaginary: left.imaginary * right.imaginary)
    }
    
    public static func * (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real * right, imaginary: left.imaginary * right)
    }

    public static func * (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left * right.real, imaginary: left * right.imaginary)
    }

    public static func * (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real * right.real, imaginary: left.imaginary * right.imaginary)
    }

    public static func / (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return ComplexMatrix(real: left.real / right, imaginary: left.imaginary / right)
    }

    public static func / (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left / right.real, imaginary: left / right.imaginary)
    }
    
    public static func / (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return ComplexMatrix(real: left.real / right.real, imaginary: left.imaginary / right.imaginary)
    }
    
    public static func / (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real / right.real, imaginary: left.imaginary / right.imaginary)
    }
    
    public static func / (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real / right, imaginary: left.imaginary / right)
    }

    public static func / (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left / right.real, imaginary: left / right.imaginary)
    }

    public static func / (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real / right.real, imaginary: left.imaginary / right.imaginary)
    }
    
    public static func += (left: inout ComplexMatrix, right: Scalar) {
        left = left + right
    }
    
    public static func += (left: inout ComplexMatrix, right: Complex) {
        left = left + right
    }
    
    public static func += (left: inout ComplexMatrix, right: Matrix) {
        left = left + right
    }

    public static func += (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left + right
    }
    
    public static func -= (left: inout ComplexMatrix, right: Scalar) {
        left = left - right
    }
    
    public static func -= (left: inout ComplexMatrix, right: Complex) {
        left = left - right
    }
    
    public static func -= (left: inout ComplexMatrix, right: Matrix) {
        left = left - right
    }

    public static func -= (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left - right
    }

    public static func *= (left: inout ComplexMatrix, right: Scalar) {
        left = left * right
    }
    
    public static func *= (left: inout ComplexMatrix, right: Complex) {
        left = left * right
    }
    
    public static func *= (left: inout ComplexMatrix, right: Matrix) {
        left = left * right
    }

    public static func *= (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left * right
    }

    public static func /= (left: inout ComplexMatrix, right: Scalar) {
        left = left / right
    }
    
    public static func /= (left: inout ComplexMatrix, right: Complex) {
        left = left / right
    }
    
    public static func /= (left: inout ComplexMatrix, right: Matrix) {
        left = left / right
    }

    public static func /= (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left / right
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public static prefix func + (operand: ComplexMatrix) -> ComplexMatrix {
        return operand
    }
    
    public static prefix func - (operand: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: -operand.real, imaginary: -operand.imaginary)
    }
    
    public static func + (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return ComplexMatrix(real: left.real + right, imaginary: left.imaginary + right)
    }

    public static func + (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left + right.real, imaginary: left + right.imaginary)
    }
    
    public static func + (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return ComplexMatrix(real: left.real + right.real, imaginary: left.imaginary + right.imaginary)
    }
    
    public static func + (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real + right.real, imaginary: left.imaginary + right.imaginary)
    }
    
    public static func + (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real + right, imaginary: left.imaginary + right)
    }

    public static func + (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left + right.real, imaginary: left + right.imaginary)
    }

    public static func + (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real + right.real, imaginary: left.imaginary + right.imaginary)
    }

    public static func - (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return ComplexMatrix(real: left.real - right, imaginary: left.imaginary - right)
    }

    public static func - (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left - right.real, imaginary: left - right.imaginary)
    }
    
    public static func - (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return ComplexMatrix(real: left.real - right.real, imaginary: left.imaginary - right.imaginary)
    }
    
    public static func - (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real - right.real, imaginary: left.imaginary - right.imaginary)
    }
    
    public static func - (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real - right, imaginary: left.imaginary - right)
    }

    public static func - (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left - right.real, imaginary: left - right.imaginary)
    }

    public static func - (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real - right.real, imaginary: left.imaginary - right.imaginary)
    }

    public static func * (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return ComplexMatrix(real: left.real * right, imaginary: left.imaginary * right)
    }

    public static func * (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left * right.real, imaginary: left * right.imaginary)
    }
    
    public static func * (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return ComplexMatrix(real: left.real * right.real, imaginary: left.imaginary * right.imaginary)
    }
    
    public static func * (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real * right.real, imaginary: left.imaginary * right.imaginary)
    }
    
    public static func * (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real * right, imaginary: left.imaginary * right)
    }

    public static func * (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left * right.real, imaginary: left * right.imaginary)
    }

    public static func * (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real * right.real, imaginary: left.imaginary * right.imaginary)
    }

    public static func / (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return ComplexMatrix(real: left.real / right, imaginary: left.imaginary / right)
    }

    public static func / (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left / right.real, imaginary: left / right.imaginary)
    }
    
    public static func / (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return ComplexMatrix(real: left.real / right.real, imaginary: left.imaginary / right.imaginary)
    }
    
    public static func / (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real / right.real, imaginary: left.imaginary / right.imaginary)
    }
    
    public static func / (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real / right, imaginary: left.imaginary / right)
    }

    public static func / (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left / right.real, imaginary: left / right.imaginary)
    }

    public static func / (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left.real / right.real, imaginary: left.imaginary / right.imaginary)
    }
    
    public static func += (left: inout ComplexMatrix, right: Scalar) {
        left = left + right
    }
    
    public static func += (left: inout ComplexMatrix, right: Complex) {
        left = left + right
    }
    
    public static func += (left: inout ComplexMatrix, right: Matrix) {
        left = left + right
    }

    public static func += (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left + right
    }
    
    public static func -= (left: inout ComplexMatrix, right: Scalar) {
        left = left - right
    }
    
    public static func -= (left: inout ComplexMatrix, right: Complex) {
        left = left - right
    }
    
    public static func -= (left: inout ComplexMatrix, right: Matrix) {
        left = left - right
    }

    public static func -= (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left - right
    }

    public static func *= (left: inout ComplexMatrix, right: Scalar) {
        left = left * right
    }
    
    public static func *= (left: inout ComplexMatrix, right: Complex) {
        left = left * right
    }
    
    public static func *= (left: inout ComplexMatrix, right: Matrix) {
        left = left * right
    }

    public static func *= (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left * right
    }

    public static func /= (left: inout ComplexMatrix, right: Scalar) {
        left = left / right
    }
    
    public static func /= (left: inout ComplexMatrix, right: Complex) {
        left = left / right
    }
    
    public static func /= (left: inout ComplexMatrix, right: Matrix) {
        left = left / right
    }

    public static func /= (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left / right
    }
    
}
