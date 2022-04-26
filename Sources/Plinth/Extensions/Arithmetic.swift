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
