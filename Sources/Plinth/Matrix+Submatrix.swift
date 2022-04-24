//
//  Matrix+Submatrix.swift
//  Plinth
//
//  Created by Daniel Clelland on 24/04/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public func submatrix(rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> Matrix {
        precondition(shape.contains(rows: rows, columns: columns))
        var output: Matrix = .zeros(shape: .init(rows: rows.count, columns: columns.count))
        withUnsafeBufferPointer { pointer in
            let startIndex = shape.indexFor(row: rows.lowerBound, column: columns.lowerBound)
            let startPointer = UnsafePointer(pointer.baseAddress! + startIndex)!
            vDSP_mmov(startPointer, &output.elements, vDSP_Length(columns.count), vDSP_Length(rows.count), vDSP_Length(shape.columns), vDSP_Length(output.shape.columns))
        }
        return output
    }
    
}

extension Matrix where Scalar == Float {
    
    public subscript(row row: Int) -> Matrix {
        get {
            return submatrix(rows: row...row, columns: shape.columnIndices)
        }
    }
    
    public subscript(column column: Int) -> Matrix {
        get {
            return submatrix(rows: shape.columnIndices, columns: column...column)
        }
    }
    
    public subscript(rows rows: ClosedRange<Int>) -> Matrix {
        get {
            return submatrix(rows: rows, columns: shape.columnIndices)
        }
    }
    
    public subscript(columns columns: ClosedRange<Int>) -> Matrix {
        get {
            return submatrix(rows: shape.rowIndices, columns: columns)
        }
    }
    
    public subscript(rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> Matrix {
        get {
            return submatrix(rows: rows, columns: columns)
        }
    }
    
}

extension Matrix where Scalar == Double {
    
    public func submatrix(rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> Matrix {
        precondition(shape.contains(rows: rows, columns: columns))
        var output: Matrix = .zeros(shape: .init(rows: rows.count, columns: columns.count))
        withUnsafeBufferPointer { pointer in
            let startIndex = shape.indexFor(row: rows.lowerBound, column: columns.lowerBound)
            let startPointer = UnsafePointer(pointer.baseAddress! + startIndex)!
            vDSP_mmovD(startPointer, &output.elements, vDSP_Length(columns.count), vDSP_Length(rows.count), vDSP_Length(shape.columns), vDSP_Length(output.shape.columns))
        }
        return output
    }
    
}

extension Matrix where Scalar == Double {
    
    public subscript(row row: Int) -> Matrix {
        get {
            return submatrix(rows: row...row, columns: shape.columnIndices)
        }
    }
    
    public subscript(column column: Int) -> Matrix {
        get {
            return submatrix(rows: shape.columnIndices, columns: column...column)
        }
    }
    
    public subscript(rows rows: ClosedRange<Int>) -> Matrix {
        get {
            return submatrix(rows: rows, columns: shape.columnIndices)
        }
    }
    
    public subscript(columns columns: ClosedRange<Int>) -> Matrix {
        get {
            return submatrix(rows: shape.rowIndices, columns: columns)
        }
    }
    
    public subscript(rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> Matrix {
        get {
            return submatrix(rows: rows, columns: columns)
        }
    }
    
}
