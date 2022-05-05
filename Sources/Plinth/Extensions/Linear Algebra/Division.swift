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
    
    @inlinable public static func /> (left: Matrix, right: Matrix) -> Matrix {
        return left.leftDivided(by: right)
    }
    
    @inlinable public static func </ (left: Matrix, right: Matrix) -> Matrix {
        return left.rightDivided(by: right)
    }
    
}

extension Matrix where Scalar == Float {
    
    @inlinable public static func />= (left: inout Matrix, right: Matrix) {
        left = left </ right
    }
    
    @inlinable public static func </= (left: inout Matrix, right: Matrix) {
        left = left /> right
    }
    
}

extension Matrix where Scalar == Float {
    
    public func leftDivided(by dividend: Matrix) -> Matrix {
        return inverted() <*> dividend
    }
    
    public func rightDivided(by divisor: Matrix) -> Matrix {
        return divisor <*> inverted()
    }
    
}

extension Matrix where Scalar == Double {
    
    @inlinable public static func /> (left: Matrix, right: Matrix) -> Matrix {
        return left.leftDivided(by: right)
    }
    
    @inlinable public static func </ (left: Matrix, right: Matrix) -> Matrix {
        return left.rightDivided(by: right)
    }
    
}

extension Matrix where Scalar == Double {
    
    @inlinable public static func />= (left: inout Matrix, right: Matrix) {
        left = left </ right
    }
    
    @inlinable public static func </= (left: inout Matrix, right: Matrix) {
        left = left /> right
    }
    
}

extension Matrix where Scalar == Double {
    
    public func leftDivided(by dividend: Matrix) -> Matrix {
        return inverted() <*> dividend
    }
    
    public func rightDivided(by divisor: Matrix) -> Matrix {
        return divisor <*> inverted()
    }
    
}
