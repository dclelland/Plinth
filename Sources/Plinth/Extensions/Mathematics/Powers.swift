//
//  Powers.swift
//  Plinth
//
//  Created by Daniel Clelland on 29/04/22.
//

import Foundation
import Accelerate

precedencegroup PowerPrecedence {
    associativity: left
    higherThan: MultiplicationPrecedence
}

infix operator **: PowerPrecedence

infix operator **=: AssignmentPrecedence

extension Float {

    @inlinable public static func ** (left: Self, right: Self) -> Self {
        return pow(left, right)
    }

}

extension Float {

    @inlinable public static func **= (left: inout Self, right: Self) {
        left = left ** right
    }

}

extension Array where Element == Float {

    @inlinable internal static func ** (left: Array, right: Int) -> Array {
        switch right.signum() {
        case -1:
            return vForce.reciprocal([Array](repeating: left, count: -right - 1).reduce(left, vDSP.multiply))
        case 0:
            return Array(repeating: 1.0, count: left.count)
        case 1:
            return [Array](repeating: left, count: right - 1).reduce(left, vDSP.multiply)
        default:
            fatalError()
        }
    }
    
    @inlinable internal static func ** (left: Array, right: Element) -> Array {
        return vForce.pow(bases: left, exponents: Array(repeating: right, count: left.count))
    }
    
    @inlinable internal static func ** (left: Array, right: Array) -> Array {
        return vForce.pow(bases: left, exponents: right)
    }

}

extension Array where Element == Float {
    
    @inlinable public static func **= (left: inout Array, right: Int) {
        left = left ** right
    }
    
    @inlinable public static func **= (left: inout Array, right: Element) {
        left = left ** right
    }
    
    @inlinable public static func **= (left: inout Array, right: Array) {
        left = left ** right
    }
    
}

extension Matrix where Scalar == Float {

    @inlinable public static func ** (left: Matrix, right: Int) -> Matrix {
        return left.fmap { $0 ** right }
    }
    
    @inlinable public static func ** (left: Matrix, right: Element) -> Matrix {
        return left.fmap { $0 ** right }
    }
    
    @inlinable public static func ** (left: Matrix, right: Matrix) -> Matrix {
        return left.fmap { $0 ** right.elements }
    }

}

extension Matrix where Element == Float {
    
    @inlinable public static func **= (left: inout Matrix, right: Int) {
        left = left ** right
    }
    
    @inlinable public static func **= (left: inout Matrix, right: Element) {
        left = left ** right
    }
    
    @inlinable public static func **= (left: inout Matrix, right: Matrix) {
        left = left ** right
    }
    
}

extension Double {

    @inlinable public static func ** (left: Self, right: Self) -> Self {
        return pow(left, right)
    }

}

extension Double {

    @inlinable public static func **= (left: inout Self, right: Self) {
        left = left ** right
    }

}

extension Array where Element == Double {

    @inlinable internal static func ** (left: Array, right: Int) -> Array {
        switch right.signum() {
        case -1:
            return vForce.reciprocal([Array](repeating: left, count: -right - 1).reduce(left, vDSP.multiply))
        case 0:
            return Array(repeating: 1.0, count: left.count)
        case 1:
            return [Array](repeating: left, count: right - 1).reduce(left, vDSP.multiply)
        default:
            fatalError()
        }
    }
    
    @inlinable internal static func ** (left: Array, right: Element) -> Array {
        return vForce.pow(bases: left, exponents: Array(repeating: right, count: left.count))
    }
    
    @inlinable internal static func ** (left: Array, right: Array) -> Array {
        return vForce.pow(bases: left, exponents: right)
    }

}

extension Array where Element == Double {
    
    @inlinable public static func **= (left: inout Array, right: Int) {
        left = left ** right
    }
    
    @inlinable public static func **= (left: inout Array, right: Element) {
        left = left ** right
    }
    
    @inlinable public static func **= (left: inout Array, right: Array) {
        left = left ** right
    }
    
}

extension Matrix where Scalar == Double {

    @inlinable public static func ** (left: Matrix, right: Int) -> Matrix {
        return left.fmap { $0 ** right }
    }
    
    @inlinable public static func ** (left: Matrix, right: Element) -> Matrix {
        return left.fmap { $0 ** right }
    }
    
    @inlinable public static func ** (left: Matrix, right: Matrix) -> Matrix {
        return left.fmap { $0 ** right.elements }
    }

}

extension Matrix where Element == Double {
    
    @inlinable public static func **= (left: inout Matrix, right: Int) {
        left = left ** right
    }
    
    @inlinable public static func **= (left: inout Matrix, right: Element) {
        left = left ** right
    }
    
    @inlinable public static func **= (left: inout Matrix, right: Matrix) {
        left = left ** right
    }
    
}
