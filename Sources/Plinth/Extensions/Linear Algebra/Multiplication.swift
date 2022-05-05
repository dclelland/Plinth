//
//  Multiplication.swift
//  Plinth
//
//  Created by Daniel Clelland on 28/04/22.
//

import Foundation
import Accelerate

infix operator <*>: MultiplicationPrecedence

infix operator <*>=: AssignmentPrecedence

extension Matrix where Scalar == Float {
    
    @inlinable public static func <*> (left: Matrix, right: Matrix) -> Matrix {
        return left.multiplied(by: right)
    }
    
}

extension Matrix where Scalar == Float {
    
    @inlinable public static func <*>= (left: inout Matrix, right: Matrix) {
        left = left <*> right
    }
    
}

extension Matrix where Scalar == Float {
    
    public func multiplied(by multiplicand: Matrix) -> Matrix {
        precondition(shape.columns == multiplicand.shape.rows)
        var output: Matrix = .zeros(shape: .init(rows: shape.rows, columns: multiplicand.shape.columns))
        vDSP_mmul(elements, 1, multiplicand.elements, 1, &output.elements, 1, vDSP_Length(shape.rows), vDSP_Length(multiplicand.shape.columns), vDSP_Length(shape.columns))
        return output
    }
    
}

extension Matrix where Scalar == Double {
    
    @inlinable public static func <*> (left: Matrix, right: Matrix) -> Matrix {
        return left.multiplied(by: right)
    }
    
}

extension Matrix where Scalar == Double {
    
    @inlinable public static func <*>= (left: inout Matrix, right: Matrix) {
        left = left <*> right
    }
    
}

extension Matrix where Scalar == Double {
    
    public func multiplied(by multiplicand: Matrix) -> Matrix {
        precondition(shape.columns == multiplicand.shape.rows)
        var output: Matrix = .zeros(shape: .init(rows: shape.rows, columns: multiplicand.shape.columns))
        vDSP_mmulD(elements, 1, multiplicand.elements, 1, &output.elements, 1, vDSP_Length(shape.rows), vDSP_Length(multiplicand.shape.columns), vDSP_Length(shape.columns))
        return output
    }
    
}
