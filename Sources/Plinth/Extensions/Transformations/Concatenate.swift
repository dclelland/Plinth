//
//  Concatenate.swift
//  Plinth
//
//  Created by Daniel Clelland on 15/05/22.
//

import Foundation

extension Array where Element == Matrix<Float> {
    
    public func concatenatedRows() -> Element {
        return .concatenating(rows: self)
    }
    
    public func concatenatedColumns() -> Element {
        return .concatenating(columns: self)
    }
    
}

extension Matrix where Scalar == Float {
    
    public static func concatenating(rows matrices: [Matrix]) -> Matrix {
        let outputRows = matrices.map(\.shape.rows).reduce(0, +)
        let outputColumns = matrices.map(\.shape.columns).min() ?? 0
        var output: Matrix = .zeros(shape: .init(rows: outputRows, columns: outputColumns))
        var currentRow = 0
        for matrix in matrices {
            output[rows: (matrix.shape.rowIndices.lowerBound + currentRow)...(matrix.shape.rowIndices.upperBound + currentRow)] = matrix
            currentRow += matrix.shape.rows
        }
        return output
    }
    
    public static func concatenating(columns matrices: [Matrix]) -> Matrix {
        let outputRows = matrices.map(\.shape.rows).min() ?? 0
        let outputColumns = matrices.map(\.shape.columns).reduce(0, +)
        var output: Matrix = .zeros(shape: .init(rows: outputRows, columns: outputColumns))
        var currentColumn = 0
        for matrix in matrices {
            output[columns: (matrix.shape.columnIndices.lowerBound + currentColumn)...(matrix.shape.columnIndices.upperBound + currentColumn)] = matrix
            currentColumn += matrix.shape.columns
        }
        return output
    }
    
}

extension Array where Element == ComplexMatrix<Float> {
    
    public func concatenatedRows() -> Element {
        return .concatenating(rows: self)
    }
    
    public func concatenatedColumns() -> Element {
        return .concatenating(columns: self)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public static func concatenating(rows matrices: [ComplexMatrix]) -> ComplexMatrix {
        return ComplexMatrix(real: .concatenating(rows: matrices.map(\.real)), imaginary: .concatenating(rows: matrices.map(\.imaginary)))
    }
    
    public static func concatenating(columns matrices: [ComplexMatrix]) -> ComplexMatrix {
        return ComplexMatrix(real: .concatenating(columns: matrices.map(\.real)), imaginary: .concatenating(columns: matrices.map(\.imaginary)))
    }
    
}

extension Array where Element == Matrix<Double> {
    
    public func concatenatedRows() -> Element {
        return .concatenating(rows: self)
    }
    
    public func concatenatedColumns() -> Element {
        return .concatenating(columns: self)
    }
    
}

extension Matrix where Scalar == Double {
    
    public static func concatenating(rows matrices: [Matrix]) -> Matrix {
        let outputRows = matrices.map(\.shape.rows).reduce(0, +)
        let outputColumns = matrices.map(\.shape.columns).min() ?? 0
        var output: Matrix = .zeros(shape: .init(rows: outputRows, columns: outputColumns))
        var currentRow = 0
        for matrix in matrices {
            output[rows: (matrix.shape.rowIndices.lowerBound + currentRow)...(matrix.shape.rowIndices.upperBound + currentRow)] = matrix
            currentRow += matrix.shape.rows
        }
        return output
    }
    
    public static func concatenating(columns matrices: [Matrix]) -> Matrix {
        let outputRows = matrices.map(\.shape.rows).min() ?? 0
        let outputColumns = matrices.map(\.shape.columns).reduce(0, +)
        var output: Matrix = .zeros(shape: .init(rows: outputRows, columns: outputColumns))
        var currentColumn = 0
        for matrix in matrices {
            output[columns: (matrix.shape.columnIndices.lowerBound + currentColumn)...(matrix.shape.columnIndices.upperBound + currentColumn)] = matrix
            currentColumn += matrix.shape.columns
        }
        return output
    }
    
}

extension Array where Element == ComplexMatrix<Double> {
    
    public func concatenatedRows() -> Element {
        return .concatenating(rows: self)
    }
    
    public func concatenatedColumns() -> Element {
        return .concatenating(columns: self)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public static func concatenating(rows matrices: [ComplexMatrix]) -> ComplexMatrix {
        return ComplexMatrix(real: .concatenating(rows: matrices.map(\.real)), imaginary: .concatenating(rows: matrices.map(\.imaginary)))
    }
    
    public static func concatenating(columns matrices: [ComplexMatrix]) -> ComplexMatrix {
        return ComplexMatrix(real: .concatenating(columns: matrices.map(\.real)), imaginary: .concatenating(columns: matrices.map(\.imaginary)))
    }
    
}
