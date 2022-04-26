//
//  Array+Arithmetic.swift
//  Plinth
//
//  Created by Daniel Clelland on 20/04/22.
//

import Foundation
import Accelerate

extension Array where Element == Float {
    
    @inlinable public static prefix func + (operand: Array) -> Array {
        return operand
    }
    
    @inlinable public static prefix func - (operand: Array) -> Array {
        return vDSP.negative(operand)
    }
    
}

extension Array where Element == Float {
    
    @inlinable public static func + (left: Array, right: Element) -> Array {
        return vDSP.add(right, left)
    }
    
    @inlinable public static func - (left: Array, right: Element) -> Array {
        return -right + left
    }
    
    @inlinable public static func * (left: Array, right: Element) -> Array {
        return vDSP.multiply(right, left)
    }
    
    @inlinable public static func / (left: Array, right: Element) -> Array {
        return vDSP.divide(left, right)
    }
    
}

extension Array where Element == Float {
    
    @inlinable public static func + (left: Element, right: Array) -> Array {
        return vDSP.add(left, right)
    }
    
    @inlinable public static func - (left: Element, right: Array) -> Array {
        return -right + left
    }
    
    @inlinable public static func * (left: Element, right: Array) -> Array {
        return vDSP.multiply(left, right)
    }
    
    @inlinable public static func / (left: Element, right: Array) -> Array {
        return vDSP.divide(left, right)
    }
    
}

extension Array where Element == Float {
    
    @inlinable public static func + (left: Array, right: Array) -> Array {
        return vDSP.add(left, right)
    }
    
    @inlinable public static func - (left: Array, right: Array) -> Array {
        return vDSP.subtract(left, right)
    }
    
    @inlinable public static func * (left: Array, right: Array) -> Array {
        return vDSP.multiply(left, right)
    }
    
    @inlinable public static func / (left: Array, right: Array) -> Array {
        return vDSP.divide(left, right)
    }
    
}

extension Array where Element == Float {
    
    @inlinable public static func += (left: inout Array, right: Element) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout Array, right: Element) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout Array, right: Element) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout Array, right: Element) {
        left = left / right
    }
    
}

extension Array where Element == Float {
    
    @inlinable public static func += (left: inout Array, right: Array) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout Array, right: Array) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout Array, right: Array) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout Array, right: Array) {
        left = left / right
    }
    
}

extension Matrix where Scalar == Float {
    
    @inlinable public static prefix func + (operand: Matrix) -> Matrix {
        return operand
    }
    
    @inlinable public static prefix func - (operand: Matrix) -> Matrix {
        return operand.fmap { -$0 }
    }

}

extension Matrix where Scalar == Float {
    
    @inlinable public static func + (left: Matrix, right: Scalar) -> Matrix {
        return left.fmap { $0 + right }
    }
    
    @inlinable public static func - (left: Matrix, right: Scalar) -> Matrix {
        return left.fmap { $0 - right }
    }
    
    @inlinable public static func * (left: Matrix, right: Scalar) -> Matrix {
        return left.fmap { $0 * right }
    }
    
    @inlinable public static func / (left: Matrix, right: Scalar) -> Matrix {
        return left.fmap { $0 / right }
    }

}

extension Matrix where Scalar == Float {
    
    @inlinable public static func + (left: Scalar, right: Matrix) -> Matrix {
        return right.fmap { left + $0 }
    }
    
    @inlinable public static func - (left: Scalar, right: Matrix) -> Matrix {
        return right.fmap { left - $0 }
    }
    
    @inlinable public static func * (left: Scalar, right: Matrix) -> Matrix {
        return right.fmap { left * $0 }
    }
    
    @inlinable public static func / (left: Scalar, right: Matrix) -> Matrix {
        return right.fmap { left / $0 }
    }

}

extension Matrix where Scalar == Float {
    
    @inlinable public static func + (left: Matrix, right: Matrix) -> Matrix {
        return left.fmap { $0 + right.elements }
    }
    
    @inlinable public static func - (left: Matrix, right: Matrix) -> Matrix {
        return left.fmap { $0 - right.elements }
    }
    
    @inlinable public static func * (left: Matrix, right: Matrix) -> Matrix {
        return left.fmap { $0 * right.elements }
    }
    
    @inlinable public static func / (left: Matrix, right: Matrix) -> Matrix {
        return left.fmap { $0 / right.elements }
    }

}

extension Matrix where Scalar == Float {
    
    @inlinable public static func += (left: inout Matrix, right: Scalar) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout Matrix, right: Scalar) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout Matrix, right: Scalar) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout Matrix, right: Scalar) {
        left = left / right
    }

}

extension Matrix where Scalar == Float {
    
    @inlinable public static func += (left: inout Matrix, right: Matrix) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout Matrix, right: Matrix) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout Matrix, right: Matrix) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout Matrix, right: Matrix) {
        left = left / right
    }

}

extension ComplexMatrix where Scalar == Float {
    
    @inlinable public static prefix func + (operand: ComplexMatrix) -> ComplexMatrix {
        return operand
    }
    
    @inlinable public static prefix func - (operand: ComplexMatrix) -> ComplexMatrix {
        return operand.fmap(
            real: { -$0 },
            imaginary: { -$0 }
        )
    }

}

extension ComplexMatrix where Scalar == Float {
    
    @inlinable public static func + (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap(
            real: { $0 + right },
            imaginary: { $0 }
        )
    }

    @inlinable public static func - (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap(
            real: { $0 - right },
            imaginary: { $0 }
        )
    }

    @inlinable public static func * (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap(
            real: { $0 * right },
            imaginary: { $0 * right }
        )
    }

    @inlinable public static func / (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap(
            real: { $0 / right },
            imaginary: { $0 / right }
        )
    }

}

extension ComplexMatrix where Scalar == Float {

    @inlinable public static func + (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left + $0 },
            imaginary: { $0 }
        )
    }
    
    @inlinable public static func - (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left - $0 },
            imaginary: { $0 }
        )
    }
    
    @inlinable public static func * (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left * $0 },
            imaginary: { left * $0 }
        )
    }
    
    @inlinable public static func / (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left / $0 },
            imaginary: { left / $0 }
        )
    }

}

extension ComplexMatrix where Scalar == Float {

    @inlinable public static func + (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return left.fmap(
            real: { $0 + right.real },
            imaginary: { $0 + right.imaginary }
        )
    }

    @inlinable public static func - (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return left.fmap(
            real: { $0 - right.real },
            imaginary: { $0 - right.imaginary }
        )
    }

    @inlinable public static func * (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return left.fmap(
            real: { $0 * right.real - left.imaginary.elements * right.imaginary },
            imaginary: { left.real.elements * right.imaginary + $0 * right.real }
        )
    }

    @inlinable public static func / (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        let divisor = right.real * right.real + right.imaginary * right.imaginary
        return left.fmap(
            real: { ($0 * right.real + left.imaginary.elements * right.imaginary) / divisor },
            imaginary: { ($0 * right.real - left.real.elements * right.imaginary) / divisor }
        )
    }

}

extension ComplexMatrix where Scalar == Float {

    @inlinable public static func + (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left.real + $0 },
            imaginary: { left.imaginary + $0 }
        )
    }

    @inlinable public static func - (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left.real - $0 },
            imaginary: { left.imaginary - $0 }
        )
    }

    @inlinable public static func * (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left.real * $0 - left.imaginary * right.imaginary.elements },
            imaginary: { left.real * $0 + left.imaginary * right.real.elements }
        )
    }

    @inlinable public static func / (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        let divisor = right.real.elements * right.real.elements + right.imaginary.elements * right.imaginary.elements
        return right.fmap(
            real: { (left.real * $0 + left.imaginary * right.imaginary.elements) / divisor },
            imaginary: { (left.imaginary * right.real.elements - left.real * $0) / divisor }
        )
    }

}

extension ComplexMatrix where Scalar == Float {

    @inlinable public static func + (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap(
            real: { $0 + right.elements },
            imaginary: { $0 }
        )
    }

    @inlinable public static func - (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap(
            real: { $0 - right.elements },
            imaginary: { $0 }
        )
    }

    @inlinable public static func * (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap(
            real: { $0 * right.elements },
            imaginary: { $0 * right.elements }
        )
    }

    @inlinable public static func / (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap(
            real: { $0 / right.elements },
            imaginary: { $0 / right.elements }
        )
    }

}

extension ComplexMatrix where Scalar == Float {

    @inlinable public static func + (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left.elements + $0 },
            imaginary: { $0 }
        )
    }

    @inlinable public static func - (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left.elements - $0 },
            imaginary: { $0 }
        )
    }

    @inlinable public static func * (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left.elements * $0 },
            imaginary: { left.elements * $0 }
        )
    }

    @inlinable public static func / (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left.elements / $0 },
            imaginary: { left.elements * $0 }
        )
    }

}

extension ComplexMatrix where Scalar == Float {

    @inlinable public static func + (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.fmap(
            real: { $0 + right.real.elements },
            imaginary: { $0 + right.imaginary.elements }
        )
    }

    @inlinable public static func - (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.fmap(
            real: { $0 - right.real.elements },
            imaginary: { $0 - right.imaginary.elements }
        )
    }

    @inlinable public static func * (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.fmap(
            real: { $0 * right.real.elements - left.imaginary.elements * right.imaginary.elements },
            imaginary: { left.real.elements * right.imaginary.elements + $0 * right.real.elements }
        )
    }

    @inlinable public static func / (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        let divisor = right.real.elements * right.real.elements + right.imaginary.elements * right.imaginary.elements
        return left.fmap(
            real: { ($0 * right.real.elements + left.imaginary.elements * right.imaginary.elements) / divisor },
            imaginary: { ($0 * right.real.elements - left.real.elements * right.imaginary.elements) / divisor }
        )
    }

}

extension ComplexMatrix where Scalar == Float {
    
    @inlinable public static func += (left: inout ComplexMatrix, right: Scalar) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout ComplexMatrix, right: Scalar) {
        left = left - right
    }

    @inlinable public static func *= (left: inout ComplexMatrix, right: Scalar) {
        left = left * right
    }

    @inlinable public static func /= (left: inout ComplexMatrix, right: Scalar) {
        left = left / right
    }
}

extension ComplexMatrix where Scalar == Float {
    
    @inlinable public static func += (left: inout ComplexMatrix, right: Complex) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout ComplexMatrix, right: Complex) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout ComplexMatrix, right: Complex) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout ComplexMatrix, right: Complex) {
        left = left / right
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    @inlinable public static func += (left: inout ComplexMatrix, right: Matrix) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout ComplexMatrix, right: Matrix) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout ComplexMatrix, right: Matrix) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout ComplexMatrix, right: Matrix) {
        left = left / right
    }

}

extension ComplexMatrix where Scalar == Float {

    @inlinable public static func += (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left + right
    }

    @inlinable public static func -= (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left - right
    }

    @inlinable public static func *= (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left * right
    }

    @inlinable public static func /= (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left / right
    }
    
}

extension Array where Element == Double {
    
    @inlinable public static prefix func + (operand: Array) -> Array {
        return operand
    }
    
    @inlinable public static prefix func - (operand: Array) -> Array {
        return vDSP.negative(operand)
    }
    
}

extension Array where Element == Double {
    
    @inlinable public static func + (left: Array, right: Element) -> Array {
        return vDSP.add(right, left)
    }
    
    @inlinable public static func - (left: Array, right: Element) -> Array {
        return -right + left
    }
    
    @inlinable public static func * (left: Array, right: Element) -> Array {
        return vDSP.multiply(right, left)
    }
    
    @inlinable public static func / (left: Array, right: Element) -> Array {
        return vDSP.divide(left, right)
    }
    
}

extension Array where Element == Double {
    
    @inlinable public static func + (left: Element, right: Array) -> Array {
        return vDSP.add(left, right)
    }
    
    @inlinable public static func - (left: Element, right: Array) -> Array {
        return -right + left
    }
    
    @inlinable public static func * (left: Element, right: Array) -> Array {
        return vDSP.multiply(left, right)
    }
    
    @inlinable public static func / (left: Element, right: Array) -> Array {
        return vDSP.divide(left, right)
    }
    
}

extension Array where Element == Double {
    
    @inlinable public static func + (left: Array, right: Array) -> Array {
        return vDSP.add(left, right)
    }
    
    @inlinable public static func - (left: Array, right: Array) -> Array {
        return vDSP.subtract(left, right)
    }
    
    @inlinable public static func * (left: Array, right: Array) -> Array {
        return vDSP.multiply(left, right)
    }
    
    @inlinable public static func / (left: Array, right: Array) -> Array {
        return vDSP.divide(left, right)
    }
    
}

extension Array where Element == Double {
    
    @inlinable public static func += (left: inout Array, right: Element) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout Array, right: Element) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout Array, right: Element) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout Array, right: Element) {
        left = left / right
    }
    
}

extension Array where Element == Double {
    
    @inlinable public static func += (left: inout Array, right: Array) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout Array, right: Array) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout Array, right: Array) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout Array, right: Array) {
        left = left / right
    }
    
}

extension Matrix where Scalar == Double {
    
    @inlinable public static prefix func + (operand: Matrix) -> Matrix {
        return operand
    }
    
    @inlinable public static prefix func - (operand: Matrix) -> Matrix {
        return operand.fmap { -$0 }
    }

}

extension Matrix where Scalar == Double {
    
    @inlinable public static func + (left: Matrix, right: Scalar) -> Matrix {
        return left.fmap { $0 + right }
    }
    
    @inlinable public static func - (left: Matrix, right: Scalar) -> Matrix {
        return left.fmap { $0 - right }
    }
    
    @inlinable public static func * (left: Matrix, right: Scalar) -> Matrix {
        return left.fmap { $0 * right }
    }
    
    @inlinable public static func / (left: Matrix, right: Scalar) -> Matrix {
        return left.fmap { $0 / right }
    }

}

extension Matrix where Scalar == Double {
    
    @inlinable public static func + (left: Scalar, right: Matrix) -> Matrix {
        return right.fmap { left + $0 }
    }
    
    @inlinable public static func - (left: Scalar, right: Matrix) -> Matrix {
        return right.fmap { left - $0 }
    }
    
    @inlinable public static func * (left: Scalar, right: Matrix) -> Matrix {
        return right.fmap { left * $0 }
    }
    
    @inlinable public static func / (left: Scalar, right: Matrix) -> Matrix {
        return right.fmap { left / $0 }
    }

}

extension Matrix where Scalar == Double {
    
    @inlinable public static func + (left: Matrix, right: Matrix) -> Matrix {
        return left.fmap { $0 + right.elements }
    }
    
    @inlinable public static func - (left: Matrix, right: Matrix) -> Matrix {
        return left.fmap { $0 - right.elements }
    }
    
    @inlinable public static func * (left: Matrix, right: Matrix) -> Matrix {
        return left.fmap { $0 * right.elements }
    }
    
    @inlinable public static func / (left: Matrix, right: Matrix) -> Matrix {
        return left.fmap { $0 / right.elements }
    }

}

extension Matrix where Scalar == Double {
    
    @inlinable public static func += (left: inout Matrix, right: Scalar) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout Matrix, right: Scalar) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout Matrix, right: Scalar) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout Matrix, right: Scalar) {
        left = left / right
    }

}

extension Matrix where Scalar == Double {
    
    @inlinable public static func += (left: inout Matrix, right: Matrix) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout Matrix, right: Matrix) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout Matrix, right: Matrix) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout Matrix, right: Matrix) {
        left = left / right
    }

}

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public static prefix func + (operand: ComplexMatrix) -> ComplexMatrix {
        return operand
    }
    
    @inlinable public static prefix func - (operand: ComplexMatrix) -> ComplexMatrix {
        return operand.fmap(
            real: { -$0 },
            imaginary: { -$0 }
        )
    }

}

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public static func + (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap(
            real: { $0 + right },
            imaginary: { $0 }
        )
    }

    @inlinable public static func - (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap(
            real: { $0 - right },
            imaginary: { $0 }
        )
    }

    @inlinable public static func * (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap(
            real: { $0 * right },
            imaginary: { $0 * right }
        )
    }

    @inlinable public static func / (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap(
            real: { $0 / right },
            imaginary: { $0 / right }
        )
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left + $0 },
            imaginary: { $0 }
        )
    }
    
    @inlinable public static func - (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left - $0 },
            imaginary: { $0 }
        )
    }
    
    @inlinable public static func * (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left * $0 },
            imaginary: { left * $0 }
        )
    }
    
    @inlinable public static func / (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left / $0 },
            imaginary: { left / $0 }
        )
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return left.fmap(
            real: { $0 + right.real },
            imaginary: { $0 + right.imaginary }
        )
    }

    @inlinable public static func - (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return left.fmap(
            real: { $0 - right.real },
            imaginary: { $0 - right.imaginary }
        )
    }

    @inlinable public static func * (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return left.fmap(
            real: { $0 * right.real - left.imaginary.elements * right.imaginary },
            imaginary: { left.real.elements * right.imaginary + $0 * right.real }
        )
    }

    @inlinable public static func / (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        let divisor = right.real * right.real + right.imaginary * right.imaginary
        return left.fmap(
            real: { ($0 * right.real + left.imaginary.elements * right.imaginary) / divisor },
            imaginary: { ($0 * right.real - left.real.elements * right.imaginary) / divisor }
        )
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left.real + $0 },
            imaginary: { left.imaginary + $0 }
        )
    }

    @inlinable public static func - (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left.real - $0 },
            imaginary: { left.imaginary - $0 }
        )
    }

    @inlinable public static func * (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left.real * $0 - left.imaginary * right.imaginary.elements },
            imaginary: { left.real * $0 + left.imaginary * right.real.elements }
        )
    }

    @inlinable public static func / (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        let divisor = right.real.elements * right.real.elements + right.imaginary.elements * right.imaginary.elements
        return right.fmap(
            real: { (left.real * $0 + left.imaginary * right.imaginary.elements) / divisor },
            imaginary: { (left.imaginary * right.real.elements - left.real * $0) / divisor }
        )
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap(
            real: { $0 + right.elements },
            imaginary: { $0 }
        )
    }

    @inlinable public static func - (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap(
            real: { $0 - right.elements },
            imaginary: { $0 }
        )
    }

    @inlinable public static func * (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap(
            real: { $0 * right.elements },
            imaginary: { $0 * right.elements }
        )
    }

    @inlinable public static func / (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap(
            real: { $0 / right.elements },
            imaginary: { $0 / right.elements }
        )
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left.elements + $0 },
            imaginary: { $0 }
        )
    }

    @inlinable public static func - (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left.elements - $0 },
            imaginary: { $0 }
        )
    }

    @inlinable public static func * (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left.elements * $0 },
            imaginary: { left.elements * $0 }
        )
    }

    @inlinable public static func / (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(
            real: { left.elements / $0 },
            imaginary: { left.elements * $0 }
        )
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.fmap(
            real: { $0 + right.real.elements },
            imaginary: { $0 + right.imaginary.elements }
        )
    }

    @inlinable public static func - (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.fmap(
            real: { $0 - right.real.elements },
            imaginary: { $0 - right.imaginary.elements }
        )
    }

    @inlinable public static func * (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.fmap(
            real: { $0 * right.real.elements - left.imaginary.elements * right.imaginary.elements },
            imaginary: { left.real.elements * right.imaginary.elements + $0 * right.real.elements }
        )
    }

    @inlinable public static func / (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        let divisor = right.real.elements * right.real.elements + right.imaginary.elements * right.imaginary.elements
        return left.fmap(
            real: { ($0 * right.real.elements + left.imaginary.elements * right.imaginary.elements) / divisor },
            imaginary: { ($0 * right.real.elements - left.real.elements * right.imaginary.elements) / divisor }
        )
    }

}

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public static func += (left: inout ComplexMatrix, right: Scalar) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout ComplexMatrix, right: Scalar) {
        left = left - right
    }

    @inlinable public static func *= (left: inout ComplexMatrix, right: Scalar) {
        left = left * right
    }

    @inlinable public static func /= (left: inout ComplexMatrix, right: Scalar) {
        left = left / right
    }
}

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public static func += (left: inout ComplexMatrix, right: Complex) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout ComplexMatrix, right: Complex) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout ComplexMatrix, right: Complex) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout ComplexMatrix, right: Complex) {
        left = left / right
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public static func += (left: inout ComplexMatrix, right: Matrix) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout ComplexMatrix, right: Matrix) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout ComplexMatrix, right: Matrix) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout ComplexMatrix, right: Matrix) {
        left = left / right
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func += (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left + right
    }

    @inlinable public static func -= (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left - right
    }

    @inlinable public static func *= (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left * right
    }

    @inlinable public static func /= (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left / right
    }
    
}
