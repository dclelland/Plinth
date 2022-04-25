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
    
    @inlinable public static func + (left: Array, right: Element) -> Array {
        return vDSP.add(right, left)
    }
    
    @inlinable public static func + (left: Element, right: Array) -> Array {
        return vDSP.add(left, right)
    }
    
    @inlinable public static func + (left: Array, right: Array) -> Array {
        return vDSP.add(left, right)
    }
    
    @inlinable public static func - (left: Array, right: Element) -> Array {
        return -right + left
    }
    
    @inlinable public static func - (left: Element, right: Array) -> Array {
        return -right + left
    }
    
    @inlinable public static func - (left: Array, right: Array) -> Array {
        return vDSP.subtract(left, right)
    }
    
    @inlinable public static func * (left: Array, right: Element) -> Array {
        return vDSP.multiply(right, left)
    }
    
    @inlinable public static func * (left: Element, right: Array) -> Array {
        return vDSP.multiply(left, right)
    }
    
    @inlinable public static func * (left: Array, right: Array) -> Array {
        return vDSP.multiply(left, right)
    }
    
    @inlinable public static func / (left: Array, right: Element) -> Array {
        return vDSP.divide(left, right)
    }
    
    @inlinable public static func / (left: Element, right: Array) -> Array {
        return vDSP.divide(left, right)
    }
    
    @inlinable public static func / (left: Array, right: Array) -> Array {
        return vDSP.divide(left, right)
    }
    
    @inlinable public static func += (left: inout Array, right: Element) {
        left = left + right
    }
    
    @inlinable public static func += (left: inout Array, right: Array) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout Array, right: Element) {
        left = left - right
    }
    
    @inlinable public static func -= (left: inout Array, right: Array) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout Array, right: Element) {
        left = left * right
    }
    
    @inlinable public static func *= (left: inout Array, right: Array) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout Array, right: Element) {
        left = left / right
    }
    
    @inlinable public static func /= (left: inout Array, right: Array) {
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
    
    @inlinable public static func + (left: Array, right: Element) -> Array {
        return vDSP.add(right, left)
    }
    
    @inlinable public static func + (left: Element, right: Array) -> Array {
        return vDSP.add(left, right)
    }
    
    @inlinable public static func + (left: Array, right: Array) -> Array {
        return vDSP.add(left, right)
    }
    
    @inlinable public static func - (left: Array, right: Element) -> Array {
        return -right + left
    }
    
    @inlinable public static func - (left: Element, right: Array) -> Array {
        return -right + left
    }
    
    @inlinable public static func - (left: Array, right: Array) -> Array {
        return vDSP.subtract(left, right)
    }
    
    @inlinable public static func * (left: Array, right: Element) -> Array {
        return vDSP.multiply(right, left)
    }
    
    @inlinable public static func * (left: Element, right: Array) -> Array {
        return vDSP.multiply(left, right)
    }
    
    @inlinable public static func * (left: Array, right: Array) -> Array {
        return vDSP.multiply(left, right)
    }
    
    @inlinable public static func / (left: Array, right: Element) -> Array {
        return vDSP.divide(left, right)
    }
    
    @inlinable public static func / (left: Element, right: Array) -> Array {
        return vDSP.divide(left, right)
    }
    
    @inlinable public static func / (left: Array, right: Array) -> Array {
        return vDSP.divide(left, right)
    }
    
    @inlinable public static func += (left: inout Array, right: Element) {
        left = left + right
    }
    
    @inlinable public static func += (left: inout Array, right: Array) {
        left = left + right
    }
    
    @inlinable public static func -= (left: inout Array, right: Element) {
        left = left - right
    }
    
    @inlinable public static func -= (left: inout Array, right: Array) {
        left = left - right
    }
    
    @inlinable public static func *= (left: inout Array, right: Element) {
        left = left * right
    }
    
    @inlinable public static func *= (left: inout Array, right: Array) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout Array, right: Element) {
        left = left / right
    }
    
    @inlinable public static func /= (left: inout Array, right: Array) {
        left = left / right
    }
    
}
