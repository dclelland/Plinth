//
//  Division.swift
//  Plinth
//
//  Created by Daniel Clelland on 4/05/22.
//

import Foundation

infix operator />: MultiplicationPrecedence

infix operator </: MultiplicationPrecedence

infix operator />=: AssignmentPrecedence

infix operator </=: AssignmentPrecedence

extension Matrix where Scalar == Float {
    
    @inlinable public static func /> (left: Matrix, right: Matrix) throws -> Matrix {
        return try left.leftDivided(by: right)
    }
    
    @inlinable public static func </ (left: Matrix, right: Matrix) throws -> Matrix {
        return try left.rightDivided(by: right)
    }
    
}

extension Matrix where Scalar == Float {
    
    @inlinable public static func />= (left: inout Matrix, right: Matrix) throws {
        left = try left </ right
    }
    
    @inlinable public static func </= (left: inout Matrix, right: Matrix) throws {
        left = try left /> right
    }
    
}

extension Matrix where Scalar == Float {
    
    public func leftDivided(by dividend: Matrix) throws -> Matrix {
        return try inverted() <*> dividend
    }
    
    public func rightDivided(by divisor: Matrix) throws -> Matrix {
        return try divisor <*> inverted()
    }
    
}

extension Matrix where Scalar == Double {
    
    @inlinable public static func /> (left: Matrix, right: Matrix) throws -> Matrix {
        return try left.leftDivided(by: right)
    }
    
    @inlinable public static func </ (left: Matrix, right: Matrix) throws -> Matrix {
        return try left.rightDivided(by: right)
    }
    
}

extension Matrix where Scalar == Double {
    
    @inlinable public static func />= (left: inout Matrix, right: Matrix) throws {
        try left = left </ right
    }
    
    @inlinable public static func </= (left: inout Matrix, right: Matrix) throws {
        try left = left /> right
    }
    
}

extension Matrix where Scalar == Double {
    
    public func leftDivided(by dividend: Matrix) throws -> Matrix {
        return try inverted() <*> dividend
    }
    
    public func rightDivided(by divisor: Matrix) throws -> Matrix {
        return try divisor <*> inverted()
    }
    
}
