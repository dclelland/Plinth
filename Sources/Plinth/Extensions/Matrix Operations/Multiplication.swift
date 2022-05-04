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
        precondition(left.shape.columns == right.shape.rows)
        var output: Matrix = .zeros(shape: .init(rows: left.shape.rows, columns: right.shape.columns))
        vDSP_mmul(left.elements, 1, right.elements, 1, &output.elements, 1, vDSP_Length(left.shape.rows), vDSP_Length(right.shape.columns), vDSP_Length(left.shape.columns))
        return output
    }
    
    @inlinable public static func <*>= (left: inout Matrix, right: Matrix) {
        left = left <*> right
    }
    
}

extension Matrix where Scalar == Double {
    
    @inlinable public static func <*> (left: Matrix, right: Matrix) -> Matrix {
        precondition(left.shape.columns == right.shape.rows)
        var output: Matrix = .zeros(shape: .init(rows: left.shape.rows, columns: right.shape.columns))
        vDSP_mmulD(left.elements, 1, right.elements, 1, &output.elements, 1, vDSP_Length(left.shape.rows), vDSP_Length(right.shape.columns), vDSP_Length(left.shape.columns))
        return output
    }
    
    @inlinable public static func <*>= (left: inout Matrix, right: Matrix) {
        left = left <*> right
    }
    
}
