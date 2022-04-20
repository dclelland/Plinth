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
