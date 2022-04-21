//
//  ComplexMatrix+Arithmetic.swift
//  Plinth
//
//  Created by Daniel Clelland on 20/04/22.
//

import Foundation

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public static prefix func + (operand: ComplexMatrix) -> ComplexMatrix {
        return operand
    }
    
    @inlinable public static prefix func - (operand: ComplexMatrix) -> ComplexMatrix {
        return operand.fmap(real: { -$0 }, imaginary: { -$0 })
    }

}

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public static func + (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap(real: { $0 + right }, imaginary: { $0 })
    }

    @inlinable public static func - (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap(real: { $0 - right }, imaginary: { $0 })
    }

    @inlinable public static func * (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap(real: { $0 * right }, imaginary: { $0 * right })
    }

    @inlinable public static func / (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap(real: { $0 / right }, imaginary: { $0 / right })
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left + $0 }, imaginary: { $0 })
    }
    
    @inlinable public static func - (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left - $0 }, imaginary: { $0 })
    }
    
    @inlinable public static func * (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left * $0 }, imaginary: { left * $0 })
    }
    
    @inlinable public static func / (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left / $0 }, imaginary: { left / $0 })
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return left.fmap(real: { $0 + right.real }, imaginary: { $0 + right.imaginary })
    }

    @inlinable public static func - (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return left.fmap(real: { $0 - right.real }, imaginary: { $0 - right.imaginary })
    }

    @inlinable public static func * (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return left.fmap(real: { $0 * right.real - left.imaginary.elements * right.imaginary }, imaginary: { left.real.elements * right.imaginary + $0 * right.real })
    }

    @inlinable public static func / (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        let divisor = right.real * right.real + right.imaginary * right.imaginary
        return left.fmap(real: { ($0 * right.real + left.imaginary.elements * right.imaginary) / divisor }, imaginary: { ($0 * right.real - left.real.elements * right.imaginary) / divisor })
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left.real + $0 }, imaginary: { left.imaginary + $0 })
    }

    @inlinable public static func - (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left.real - $0 }, imaginary: { left.imaginary - $0 })
    }

    @inlinable public static func * (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left.real * $0 - left.imaginary * right.imaginary.elements }, imaginary: { left.real * $0 + left.imaginary * right.real.elements })
    }

    @inlinable public static func / (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        let divisor = right.real.elements * right.real.elements + right.imaginary.elements * right.imaginary.elements
        return right.fmap(real: { (left.real * $0 + left.imaginary * right.imaginary.elements) / divisor }, imaginary: { (left.imaginary * right.real.elements - left.real * $0) / divisor })
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap(real: { $0 + right.elements }, imaginary: { $0 })
    }

    @inlinable public static func - (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap(real: { $0 - right.elements }, imaginary: { $0 })
    }

    @inlinable public static func * (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap(real: { $0 * right.elements }, imaginary: { $0 * right.elements })
    }

    @inlinable public static func / (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap(real: { $0 / right.elements }, imaginary: { $0 / right.elements })
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left.elements + $0 }, imaginary: { $0 })
    }

    @inlinable public static func - (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left.elements - $0 }, imaginary: { $0 })
    }

    @inlinable public static func * (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left.elements * $0 }, imaginary: { left.elements * $0 })
    }

    @inlinable public static func / (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left.elements / $0 }, imaginary: { left.elements * $0 })
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.fmap(real: { $0 + right.real.elements }, imaginary: { $0 + right.imaginary.elements })
    }

    @inlinable public static func - (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.fmap(real: { $0 - right.real.elements }, imaginary: { $0 - right.imaginary.elements })
    }

    @inlinable public static func * (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.fmap(real: { $0 * right.real.elements - left.imaginary.elements * right.imaginary.elements }, imaginary: { left.real.elements * right.imaginary.elements + $0 * right.real.elements })
    }

    @inlinable public static func / (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        let divisor = right.real.elements * right.real.elements + right.imaginary.elements * right.imaginary.elements
        return left.fmap(real: { ($0 * right.real.elements + left.imaginary.elements * right.imaginary.elements) / divisor }, imaginary: { ($0 * right.real.elements - left.real.elements * right.imaginary.elements) / divisor })
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
