//
//  Submatrix.swift
//  Plinth
//
//  Created by Daniel Clelland on 24/04/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public func submatrix(rows: Span, columns: Span) -> Matrix {
        precondition(shape.contains(rows: rows, columns: columns))
        let matrix = self
        var submatrix: Matrix = .zeros(shape: .init(rows: rows.count, columns: columns.count))
        withUnsafeBufferPointer { pointer in
            let matrixIndex = matrix.shape.indexFor(row: rows.startIndex, column: columns.startIndex)
            let matrixPointer = UnsafePointer(pointer.baseAddress! + matrixIndex)!
            vDSP_mmov(matrixPointer, &submatrix.elements, vDSP_Length(columns.length), vDSP_Length(rows.length), vDSP_Length(matrix.shape.columns), vDSP_Length(submatrix.shape.columns))
        }
        return submatrix
    }
    
    public mutating func setSubmatrix(_ submatrix: Matrix, rows: Span, columns: Span) {
        precondition(shape.contains(rows: rows, columns: columns))
        let matrix = self
        withUnsafeMutableBufferPointer { pointer in
            let matrixIndex = matrix.shape.indexFor(row: rows.startIndex, column: columns.startIndex)
            let matrixPointer = UnsafeMutablePointer(pointer.baseAddress! + matrixIndex)!
            vDSP_mmov(submatrix.elements, matrixPointer, vDSP_Length(columns.length), vDSP_Length(rows.length), vDSP_Length(submatrix.shape.columns), vDSP_Length(matrix.shape.columns))
        }
    }
    
}

extension Matrix where Scalar == Float {
    
    public subscript(row row: Int) -> Matrix<Float> {
        get {
            return submatrix(rows: row..row, columns: shape.columnBounds)
        }
        set {
            setSubmatrix(newValue, rows: row..row, columns: shape.columnBounds)
        }
    }
    
    public subscript(column column: Int) -> Matrix<Float> {
        get {
            return submatrix(rows: shape.columnBounds, columns: column..column)
        }
        set {
            setSubmatrix(newValue, rows: shape.columnBounds, columns: column..column)
        }
    }
    
    public subscript(rows rows: Span) -> Matrix<Float> {
        get {
            return submatrix(rows: rows, columns: shape.columnBounds)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: shape.columnBounds)
        }
    }
    
    public subscript(columns columns: Span) -> Matrix<Float> {
        get {
            return submatrix(rows: shape.rowBounds, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: shape.rowBounds, columns: columns)
        }
    }
    
}

extension Matrix where Scalar == Float {
    
    public subscript(row: Int, columns: Span) -> Matrix<Float> {
        get {
            return submatrix(rows: row..row, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: row..row, columns: columns)
        }
    }
    
    public subscript(rows: Span, column: Int) -> Matrix<Float> {
        get {
            return submatrix(rows: rows, columns: column..column)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: column..column)
        }
    }
    
    public subscript(rows: Span, columns: Span) -> Matrix<Float> {
        get {
            return submatrix(rows: rows, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: columns)
        }
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func submatrix(rows: Span, columns: Span) -> ComplexMatrix {
        precondition(shape.contains(rows: rows, columns: columns))
        return ComplexMatrix(real: real.submatrix(rows: rows, columns: columns), imaginary: imaginary.submatrix(rows: rows, columns: columns))
    }
    
    public mutating func setSubmatrix(_ submatrix: ComplexMatrix, rows: Span, columns: Span) {
        precondition(shape.contains(rows: rows, columns: columns))
        real.setSubmatrix(submatrix.real, rows: rows, columns: columns)
        imaginary.setSubmatrix(submatrix.imaginary, rows: rows, columns: columns)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public subscript(row row: Int) -> ComplexMatrix<Float> {
        get {
            return submatrix(rows: row..row, columns: shape.columnBounds)
        }
        set {
            setSubmatrix(newValue, rows: row..row, columns: shape.columnBounds)
        }
    }
    
    public subscript(column column: Int) -> ComplexMatrix<Float> {
        get {
            return submatrix(rows: shape.columnBounds, columns: column..column)
        }
        set {
            setSubmatrix(newValue, rows: shape.columnBounds, columns: column..column)
        }
    }
    
    public subscript(rows rows: Span) -> ComplexMatrix<Float> {
        get {
            return submatrix(rows: rows, columns: shape.columnBounds)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: shape.columnBounds)
        }
    }
    
    public subscript(columns columns: Span) -> ComplexMatrix<Float> {
        get {
            return submatrix(rows: shape.rowBounds, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: shape.rowBounds, columns: columns)
        }
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public subscript(row: Int, columns: Span) -> ComplexMatrix<Float> {
        get {
            return submatrix(rows: row..row, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: row..row, columns: columns)
        }
    }
    
    public subscript(rows: Span, column: Int) -> ComplexMatrix<Float> {
        get {
            return submatrix(rows: rows, columns: column..column)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: column..column)
        }
    }
    
    public subscript(rows: Span, columns: Span) -> ComplexMatrix<Float> {
        get {
            return submatrix(rows: rows, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: columns)
        }
    }
    
}

extension Matrix where Scalar == Double {
    
    public func submatrix(rows: Span, columns: Span) -> Matrix {
        precondition(shape.contains(rows: rows, columns: columns))
        let matrix = self
        var submatrix: Matrix = .zeros(shape: .init(rows: rows.count, columns: columns.count))
        withUnsafeBufferPointer { pointer in
            let matrixIndex = matrix.shape.indexFor(row: rows.startIndex, column: columns.startIndex)
            let matrixPointer = UnsafePointer(pointer.baseAddress! + matrixIndex)!
            vDSP_mmovD(matrixPointer, &submatrix.elements, vDSP_Length(columns.length), vDSP_Length(rows.length), vDSP_Length(matrix.shape.columns), vDSP_Length(submatrix.shape.columns))
        }
        return submatrix
    }
    
    public mutating func setSubmatrix(_ submatrix: Matrix, rows: Span, columns: Span) {
        precondition(shape.contains(rows: rows, columns: columns))
        let matrix = self
        withUnsafeMutableBufferPointer { pointer in
            let matrixIndex = matrix.shape.indexFor(row: rows.startIndex, column: columns.startIndex)
            let matrixPointer = UnsafeMutablePointer(pointer.baseAddress! + matrixIndex)!
            vDSP_mmovD(submatrix.elements, matrixPointer, vDSP_Length(columns.length), vDSP_Length(rows.length), vDSP_Length(submatrix.shape.columns), vDSP_Length(matrix.shape.columns))
        }
    }
    
}

extension Matrix where Scalar == Double {
    
    public subscript(row row: Int) -> Matrix<Double> {
        get {
            return submatrix(rows: row..row, columns: shape.columnBounds)
        }
        set {
            setSubmatrix(newValue, rows: row..row, columns: shape.columnBounds)
        }
    }
    
    public subscript(column column: Int) -> Matrix<Double> {
        get {
            return submatrix(rows: shape.columnBounds, columns: column..column)
        }
        set {
            setSubmatrix(newValue, rows: shape.columnBounds, columns: column..column)
        }
    }
    
    public subscript(rows rows: Span) -> Matrix<Double> {
        get {
            return submatrix(rows: rows, columns: shape.columnBounds)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: shape.columnBounds)
        }
    }
    
    public subscript(columns columns: Span) -> Matrix<Double> {
        get {
            return submatrix(rows: shape.rowBounds, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: shape.rowBounds, columns: columns)
        }
    }
    
}

extension Matrix where Scalar == Double {
    
    public subscript(row: Int, columns: Span) -> Matrix<Double> {
        get {
            return submatrix(rows: row..row, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: row..row, columns: columns)
        }
    }
    
    public subscript(rows: Span, column: Int) -> Matrix<Double> {
        get {
            return submatrix(rows: rows, columns: column..column)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: column..column)
        }
    }
    
    public subscript(rows: Span, columns: Span) -> Matrix<Double> {
        get {
            return submatrix(rows: rows, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: columns)
        }
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func submatrix(rows: Span, columns: Span) -> ComplexMatrix {
        precondition(shape.contains(rows: rows, columns: columns))
        return ComplexMatrix(real: real.submatrix(rows: rows, columns: columns), imaginary: imaginary.submatrix(rows: rows, columns: columns))
    }
    
    public mutating func setSubmatrix(_ submatrix: ComplexMatrix, rows: Span, columns: Span) {
        precondition(shape.contains(rows: rows, columns: columns))
        real.setSubmatrix(submatrix.real, rows: rows, columns: columns)
        imaginary.setSubmatrix(submatrix.imaginary, rows: rows, columns: columns)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public subscript(row row: Int) -> ComplexMatrix<Double> {
        get {
            return submatrix(rows: row..row, columns: shape.columnBounds)
        }
        set {
            setSubmatrix(newValue, rows: row..row, columns: shape.columnBounds)
        }
    }
    
    public subscript(column column: Int) -> ComplexMatrix<Double> {
        get {
            return submatrix(rows: shape.columnBounds, columns: column..column)
        }
        set {
            setSubmatrix(newValue, rows: shape.columnBounds, columns: column..column)
        }
    }
    
    public subscript(rows rows: Span) -> ComplexMatrix<Double> {
        get {
            return submatrix(rows: rows, columns: shape.columnBounds)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: shape.columnBounds)
        }
    }
    
    public subscript(columns columns: Span) -> ComplexMatrix<Double> {
        get {
            return submatrix(rows: shape.rowBounds, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: shape.rowBounds, columns: columns)
        }
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public subscript(row: Int, columns: Span) -> ComplexMatrix<Double> {
        get {
            return submatrix(rows: row..row, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: row..row, columns: columns)
        }
    }
    
    public subscript(rows: Span, column: Int) -> ComplexMatrix<Double> {
        get {
            return submatrix(rows: rows, columns: column..column)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: column..column)
        }
    }
    
    public subscript(rows: Span, columns: Span) -> ComplexMatrix<Double> {
        get {
            return submatrix(rows: rows, columns: columns)
        }
        set {
            setSubmatrix(newValue, rows: rows, columns: columns)
        }
    }
    
}
