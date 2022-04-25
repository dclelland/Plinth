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
        let matrix = self
        var submatrix: Matrix = .zeros(shape: .init(rows: rows.count, columns: columns.count))
        withUnsafeBufferPointer { pointer in
            let matrixIndex = matrix.shape.indexFor(row: rows.lowerBound, column: columns.lowerBound)
            let matrixPointer = UnsafePointer(pointer.baseAddress! + matrixIndex)!
            vDSP_mmov(matrixPointer, &submatrix.elements, vDSP_Length(columns.count), vDSP_Length(rows.count), vDSP_Length(matrix.shape.columns), vDSP_Length(submatrix.shape.columns))
        }
        return submatrix
    }
    
    public mutating func setSubmatrix(_ submatrix: Matrix, rows: ClosedRange<Int>, columns: ClosedRange<Int>) {
        precondition(shape.contains(rows: rows, columns: columns))
        let matrix = self
        withUnsafeMutableBufferPointer { pointer in
            let matrixIndex = matrix.shape.indexFor(row: rows.lowerBound, column: columns.lowerBound)
            let matrixPointer = UnsafeMutablePointer(pointer.baseAddress! + matrixIndex)!
            vDSP_mmov(submatrix.elements, matrixPointer, vDSP_Length(columns.count), vDSP_Length(rows.count), vDSP_Length(submatrix.shape.columns), vDSP_Length(matrix.shape.columns))
        }
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
    
}

extension Matrix where Scalar == Float {
    
    public subscript(row: Int, columns: ClosedRange<Int>) -> Matrix {
        get {
            return submatrix(rows: row...row, columns: columns)
        }
    }
    
    public subscript(rows: ClosedRange<Int>, column: Int) -> Matrix {
        get {
            return submatrix(rows: rows, columns: column...column)
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
        let matrix = self
        var submatrix: Matrix = .zeros(shape: .init(rows: rows.count, columns: columns.count))
        withUnsafeBufferPointer { pointer in
            let matrixIndex = matrix.shape.indexFor(row: rows.lowerBound, column: columns.lowerBound)
            let matrixPointer = UnsafePointer(pointer.baseAddress! + matrixIndex)!
            vDSP_mmovD(matrixPointer, &submatrix.elements, vDSP_Length(columns.count), vDSP_Length(rows.count), vDSP_Length(matrix.shape.columns), vDSP_Length(submatrix.shape.columns))
        }
        return submatrix
    }
    
    public mutating func setSubmatrix(_ submatrix: Matrix, rows: ClosedRange<Int>, columns: ClosedRange<Int>) {
        precondition(shape.contains(rows: rows, columns: columns))
        let matrix = self
        withUnsafeMutableBufferPointer { pointer in
            let matrixIndex = matrix.shape.indexFor(row: rows.lowerBound, column: columns.lowerBound)
            let matrixPointer = UnsafeMutablePointer(pointer.baseAddress! + matrixIndex)!
            vDSP_mmovD(submatrix.elements, matrixPointer, vDSP_Length(columns.count), vDSP_Length(rows.count), vDSP_Length(submatrix.shape.columns), vDSP_Length(matrix.shape.columns))
        }
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
    
}

extension Matrix where Scalar == Double {
    
    public subscript(row: Int, columns: ClosedRange<Int>) -> Matrix {
        get {
            return submatrix(rows: row...row, columns: columns)
        }
    }
    
    public subscript(rows: ClosedRange<Int>, column: Int) -> Matrix {
        get {
            return submatrix(rows: rows, columns: column...column)
        }
    }
    
    public subscript(rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> Matrix {
        get {
            return submatrix(rows: rows, columns: columns)
        }
    }
    
}
