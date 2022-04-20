//
//  Shape.swift
//  Plinth
//
//  Created by Daniel Clelland on 30/03/22.
//

import Foundation
    
public struct Shape: Codable {
    
    public var rows: Int
    public var columns: Int
    
    public var count: Int {
        return rows * columns
    }
    
    public init(rows: Int, columns: Int) {
        precondition(rows >= 0)
        precondition(columns >= 0)
        self.rows = rows
        self.columns = columns
    }
    
}

extension Shape {
    
    public static let empty = Shape(rows: 0, columns: 0)
    
}

extension Shape {
    
    @inlinable internal var rowIndices: ClosedRange<Int> {
        return 0...(rows - 1)
    }
    
    @inlinable internal var columnIndices: ClosedRange<Int> {
        return 0...(columns - 1)
    }
    
}

extension Shape {
    
    @inlinable internal func indexFor(row: Int, column: Int) -> Int {
        return row * columns + column
    }
    
    @inlinable internal func indicesFor(row: Int) -> ClosedRange<Int> {
        let startIndex = indexFor(row: row, column: 0)
        let endIndex = indexFor(row: row, column: columns - 1)
        return startIndex...endIndex
    }
    
}

extension Shape {
    
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

extension Shape: CustomStringConvertible {
    
    public var description: String {
        return "\(rows)×\(columns)"
    }
    
}

extension Shape: Equatable {
    
    public static func == (left: Shape, right: Shape) -> Bool {
        return left.rows == right.rows && left.columns == right.columns
    }
    
}

extension Shape: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(rows)
        hasher.combine(columns)
    }
    
}
