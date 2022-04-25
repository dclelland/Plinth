//
//  ComplexMatrix+Submatrices.swift
//  Plinth
//
//  Created by Daniel Clelland on 24/04/22.
//

import Foundation

extension ComplexMatrix where Scalar == Float {
    
    public func submatrix(rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> ComplexMatrix {
        precondition(shape.contains(rows: rows, columns: columns))
        return ComplexMatrix(real: real.submatrix(rows: rows, columns: columns), imaginary: imaginary.submatrix(rows: rows, columns: columns))
    }
    
    public mutating func setSubmatrix(_ submatrix: ComplexMatrix, rows: ClosedRange<Int>, columns: ClosedRange<Int>) {
        precondition(shape.contains(rows: rows, columns: columns))
        real.setSubmatrix(submatrix.real, rows: rows, columns: columns)
        imaginary.setSubmatrix(submatrix.imaginary, rows: rows, columns: columns)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public subscript(row row: Int) -> ComplexMatrix<Float> {
        get {
            return submatrix(rows: row...row, columns: shape.columnIndices)
        }
        set {
            setSubmatrix(newValue, rows: row...row, columns: shape.columnIndices)
        }
    }
    
    public subscript(column column: Int) -> ComplexMatrix<Float> {
        get {
            return submatrix(rows: shape.columnIndices, columns: column...column)
        }
        set {
            setSubmatrix(newValue, rows: shape.columnIndices, columns: column...column)
        }
    }
    
    public subscript(rows rows: ClosedRange<Int>) -> ComplexMatrix<Float> {
        get {
            return submatrix(rows: rows, columns: shape.columnIndices)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: shape.columnIndices)
        }
    }
    
    public subscript(columns columns: ClosedRange<Int>) -> ComplexMatrix<Float> {
        get {
            return submatrix(rows: shape.rowIndices, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: shape.rowIndices, columns: columns)
        }
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public subscript(row: Int, columns: ClosedRange<Int>) -> ComplexMatrix<Float> {
        get {
            return submatrix(rows: row...row, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: row...row, columns: columns)
        }
    }
    
    public subscript(rows: ClosedRange<Int>, column: Int) -> ComplexMatrix<Float> {
        get {
            return submatrix(rows: rows, columns: column...column)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: column...column)
        }
    }
    
    public subscript(rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> ComplexMatrix<Float> {
        get {
            return submatrix(rows: rows, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: columns)
        }
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func submatrix(rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> ComplexMatrix {
        precondition(shape.contains(rows: rows, columns: columns))
        return ComplexMatrix(real: real.submatrix(rows: rows, columns: columns), imaginary: imaginary.submatrix(rows: rows, columns: columns))
    }
    
    public mutating func setSubmatrix(_ submatrix: ComplexMatrix, rows: ClosedRange<Int>, columns: ClosedRange<Int>) {
        precondition(shape.contains(rows: rows, columns: columns))
        real.setSubmatrix(submatrix.real, rows: rows, columns: columns)
        imaginary.setSubmatrix(submatrix.imaginary, rows: rows, columns: columns)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public subscript(row row: Int) -> ComplexMatrix<Double> {
        get {
            return submatrix(rows: row...row, columns: shape.columnIndices)
        }
        set {
            setSubmatrix(newValue, rows: row...row, columns: shape.columnIndices)
        }
    }
    
    public subscript(column column: Int) -> ComplexMatrix<Double> {
        get {
            return submatrix(rows: shape.columnIndices, columns: column...column)
        }
        set {
            setSubmatrix(newValue, rows: shape.columnIndices, columns: column...column)
        }
    }
    
    public subscript(rows rows: ClosedRange<Int>) -> ComplexMatrix<Double> {
        get {
            return submatrix(rows: rows, columns: shape.columnIndices)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: shape.columnIndices)
        }
    }
    
    public subscript(columns columns: ClosedRange<Int>) -> ComplexMatrix<Double> {
        get {
            return submatrix(rows: shape.rowIndices, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: shape.rowIndices, columns: columns)
        }
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public subscript(row: Int, columns: ClosedRange<Int>) -> ComplexMatrix<Double> {
        get {
            return submatrix(rows: row...row, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: row...row, columns: columns)
        }
    }
    
    public subscript(rows: ClosedRange<Int>, column: Int) -> ComplexMatrix<Double> {
        get {
            return submatrix(rows: rows, columns: column...column)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: column...column)
        }
    }
    
    public subscript(rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> ComplexMatrix<Double> {
        get {
            return submatrix(rows: rows, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: columns)
        }
    }
    
}
