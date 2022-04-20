//
//  ComplexMatrix+Arithmetic.swift
//  Plinth
//
//  Created by Daniel Clelland on 20/04/22.
//

import Foundation

extension ComplexMatrix where Scalar == Float {
    
    @inlinable public static prefix func + (operand: ComplexMatrix) -> ComplexMatrix {
        return operand
    }
    
    @inlinable public static prefix func - (operand: ComplexMatrix) -> ComplexMatrix {
        return operand.fmap { -$0 }
    }

}

extension ComplexMatrix where Scalar == Float {
    
    @inlinable public static func + (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap { $0 + right }
    }

    @inlinable public static func - (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap { $0 - right }
    }

    @inlinable public static func * (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap { $0 * right }
    }

    @inlinable public static func / (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap { $0 / right }
    }

}

extension ComplexMatrix where Scalar == Float {

    @inlinable public static func + (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left + $0 }
    }
    
    @inlinable public static func - (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left - $0 }
    }
    
    @inlinable public static func * (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left * $0 }
    }
    
    @inlinable public static func / (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left / $0 }
    }

}

extension ComplexMatrix where Scalar == Float {

    @inlinable public static func + (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return left.fmap(real: { $0 + right.real }, imaginary: { $0 + right.imaginary })
    }

    @inlinable public static func - (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return left.fmap(real: { $0 - right.real }, imaginary: { $0 - right.imaginary })
    }

    @inlinable public static func * (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return left.fmap(real: { $0 * right.real }, imaginary: { $0 * right.imaginary })
    }

    @inlinable public static func / (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return left.fmap(real: { $0 / right.real }, imaginary: { $0 / right.imaginary })
    }

}

extension ComplexMatrix where Scalar == Float {

    @inlinable public static func + (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left.real + $0 }, imaginary: { left.imaginary + $0 })
    }

    @inlinable public static func - (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left.real - $0 }, imaginary: { left.imaginary - $0 })
    }

    @inlinable public static func * (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left.real * $0 }, imaginary: { left.imaginary * $0 })
    }

    @inlinable public static func / (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left.real / $0 }, imaginary: { left.imaginary / $0 })
    }

}

extension ComplexMatrix where Scalar == Float {

    @inlinable public static func + (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap { $0 + right.elements }
    }

    @inlinable public static func - (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap { $0 - right.elements }
    }

    @inlinable public static func * (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap { $0 * right.elements }
    }

    @inlinable public static func / (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap { $0 / right.elements }
    }

}

extension ComplexMatrix where Scalar == Float {

    @inlinable public static func + (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left.elements + $0 }
    }

    @inlinable public static func - (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left.elements - $0 }
    }

    @inlinable public static func * (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left.elements * $0 }
    }

    @inlinable public static func / (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left.elements / $0 }
    }

}

extension ComplexMatrix where Scalar == Float {

    @inlinable public static func + (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.fmap(real: { $0 + right.real.elements }, imaginary: { $0 + right.imaginary.elements })
    }

    @inlinable public static func - (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.fmap(real: { $0 - right.real.elements }, imaginary: { $0 - right.imaginary.elements })
    }

    @inlinable public static func * (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.fmap(real: { $0 * right.real.elements }, imaginary: { $0 * right.imaginary.elements })
    }

    @inlinable public static func / (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.fmap(real: { $0 / right.real.elements }, imaginary: { $0 / right.imaginary.elements })
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

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public static prefix func + (operand: ComplexMatrix) -> ComplexMatrix {
        return operand
    }
    
    @inlinable public static prefix func - (operand: ComplexMatrix) -> ComplexMatrix {
        return operand.fmap { -$0 }
    }

}

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public static func + (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap { $0 + right }
    }

    @inlinable public static func - (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap { $0 - right }
    }

    @inlinable public static func * (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap { $0 * right }
    }

    @inlinable public static func / (left: ComplexMatrix, right: Scalar) -> ComplexMatrix {
        return left.fmap { $0 / right }
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left + $0 }
    }
    
    @inlinable public static func - (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left - $0 }
    }
    
    @inlinable public static func * (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left * $0 }
    }
    
    @inlinable public static func / (left: Scalar, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left / $0 }
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
        return left.fmap(real: { $0 * right.real }, imaginary: { $0 * right.imaginary })
    }

    @inlinable public static func / (left: ComplexMatrix, right: Complex) -> ComplexMatrix {
        return left.fmap(real: { $0 / right.real }, imaginary: { $0 / right.imaginary })
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
        return right.fmap(real: { left.real * $0 }, imaginary: { left.imaginary * $0 })
    }

    @inlinable public static func / (left: Complex, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap(real: { left.real / $0 }, imaginary: { left.imaginary / $0 })
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap { $0 + right.elements }
    }

    @inlinable public static func - (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap { $0 - right.elements }
    }

    @inlinable public static func * (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap { $0 * right.elements }
    }

    @inlinable public static func / (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.fmap { $0 / right.elements }
    }

}

extension ComplexMatrix where Scalar == Double {

    @inlinable public static func + (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left.elements + $0 }
    }

    @inlinable public static func - (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left.elements - $0 }
    }

    @inlinable public static func * (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left.elements * $0 }
    }

    @inlinable public static func / (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return right.fmap { left.elements / $0 }
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
        return left.fmap(real: { $0 * right.real.elements }, imaginary: { $0 * right.imaginary.elements })
    }

    @inlinable public static func / (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.fmap(real: { $0 / right.real.elements }, imaginary: { $0 / right.imaginary.elements })
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
