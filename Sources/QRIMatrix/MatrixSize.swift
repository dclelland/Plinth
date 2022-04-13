//
//  MatrixSize.swift
//  QRIMatrix
//
//  Created by Daniel Clelland on 30/03/22.
//

import Foundation
    
public struct MatrixSize {
    
    public var rows: Int
    public var columns: Int
    
    public var count: Int {
        return rows * columns
    }
    
    public init(rows: Int = 1, columns: Int = 1) {
        precondition(rows > 0)
        precondition(columns > 0)
        self.rows = rows
        self.columns = columns
    }
    
}

extension MatrixSize {
    
    @inlinable internal var rowIndices: ClosedRange<Int> {
        return 0...(rows - 1)
    }
    
    @inlinable internal var columnIndices: ClosedRange<Int> {
        return 0...(columns - 1)
    }
    
}

extension MatrixSize {
    
    @inlinable internal func indexFor(row: Int, column: Int) -> Int {
        return row * columns + column
    }
    
    @inlinable internal func indicesFor(row: Int) -> ClosedRange<Int> {
        let startIndex = indexFor(row: row, column: 0)
        let endIndex = indexFor(row: row, column: columns - 1)
        return startIndex...endIndex
    }
    
}

extension MatrixSize {
    
    @inlinable internal func contains(row: Int) -> Bool {
        return rowIndices.contains(row)
    }
    
    @inlinable internal func contains(column: Int) -> Bool {
        return columnIndices.contains(column)
    }
    
    @inlinable internal func contains(row: Int, column: Int) -> Bool {
        return contains(row: row) && contains(column: column)
    }
    
}

extension MatrixSize: Equatable {
    
    public static func == (lhs: MatrixSize, rhs: MatrixSize) -> Bool {
        return lhs.rows == rhs.rows && lhs.columns == rhs.columns
    }
    
}

extension MatrixSize: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(rows)
        hasher.combine(columns)
    }
    
}
