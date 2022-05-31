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

extension ComplexMatrix where Scalar == Float {
    
    @inlinable public static func <*> (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left).multiplied(by: right)
    }
    
    @inlinable public static func <*> (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.multiplied(by: ComplexMatrix(real: right))
    }
    
    @inlinable public static func <*> (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.multiplied(by: right)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    @inlinable public static func <*>= (left: inout ComplexMatrix, right: Matrix) {
        left = left <*> ComplexMatrix(real: right)
    }
    
    @inlinable public static func <*>= (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left <*> right
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func multiplied(by multiplicand: ComplexMatrix) -> ComplexMatrix {
        precondition(shape.columns == multiplicand.shape.rows)
        var left = self
        var right = multiplicand
        var output: ComplexMatrix = .zeros(shape: .init(rows: shape.rows, columns: multiplicand.shape.columns))
        left.withUnsafeMutableSplitComplexVector { leftVector in
            right.withUnsafeMutableSplitComplexVector { rightVector in
                output.withUnsafeMutableSplitComplexVector { outputVector in
                    vDSP_zmmul(&leftVector, 1, &rightVector, 1, &outputVector, 1, vDSP_Length(shape.rows), vDSP_Length(multiplicand.shape.columns), vDSP_Length(shape.columns))
                }
            }
        }
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

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public static func <*> (left: Matrix, right: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(real: left).multiplied(by: right)
    }
    
    @inlinable public static func <*> (left: ComplexMatrix, right: Matrix) -> ComplexMatrix {
        return left.multiplied(by: ComplexMatrix(real: right))
    }
    
    @inlinable public static func <*> (left: ComplexMatrix, right: ComplexMatrix) -> ComplexMatrix {
        return left.multiplied(by: right)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public static func <*>= (left: inout ComplexMatrix, right: Matrix) {
        left = left <*> ComplexMatrix(real: right)
    }
    
    @inlinable public static func <*>= (left: inout ComplexMatrix, right: ComplexMatrix) {
        left = left <*> right
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func multiplied(by multiplicand: ComplexMatrix) -> ComplexMatrix {
        precondition(shape.columns == multiplicand.shape.rows)
        var left = self
        var right = multiplicand
        var output: ComplexMatrix = .zeros(shape: .init(rows: shape.rows, columns: multiplicand.shape.columns))
        left.withUnsafeMutableSplitComplexVector { leftVector in
            right.withUnsafeMutableSplitComplexVector { rightVector in
                output.withUnsafeMutableSplitComplexVector { outputVector in
                    vDSP_zmmulD(&leftVector, 1, &rightVector, 1, &outputVector, 1, vDSP_Length(shape.rows), vDSP_Length(multiplicand.shape.columns), vDSP_Length(shape.columns))
                }
            }
        }
        return output
    }
    
}
