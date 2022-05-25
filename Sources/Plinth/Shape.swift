//
//  Shape.swift
//  Plinth
//
//  Created by Daniel Clelland on 30/03/22.
//

import Foundation
    
public struct Shape {
    
    public let rows: Int
    public let columns: Int
    
    public init(rows: Int, columns: Int) {
        precondition(rows >= 0)
        precondition(columns >= 0)
        self.rows = rows
        self.columns = columns
    }
    
}

extension Shape {
    
    public var rowIndices: ClosedRange<Int> {
        return 0...(rows - 1)
    }
    
    public var columnIndices: ClosedRange<Int> {
        return 0...(columns - 1)
    }
    
}

extension Shape {
    
    public var count: Int {
        return rows * columns
    }
    
    public var length: Int {
        return max(rows, columns)
    }
    
    public var breadth: Int {
        return min(rows, columns)
    }
    
}

extension Shape {
    
    public static var empty: Shape {
        return .init(rows: 0, columns: 0)
    }
    
    public static func row(length: Int) -> Shape {
        return .init(rows: 1, columns: length)
    }
    
    public static func column(length: Int) -> Shape {
        return .init(rows: length, columns: 1)
    }
    
    public static func square(length: Int) -> Shape {
        return .init(rows: length, columns: length)
    }
    
    public var isEmpty: Bool {
        return rows == 0 || columns == 0
    }
    
    public var isRow: Bool {
        return rows == 1
    }
    
    public var isColumn: Bool {
        return columns == 1
    }
    
    public var isSquare: Bool {
        return rows == columns
    }
    
}

extension Shape {
    
    @inlinable internal func indexFor(row: Int, column: Int) -> Int {
        return row * columns + column
    }
    
    @inlinable internal func indicesFor(row: Int) -> ClosedRange<Int> {
        return indexFor(row: row, column: columnIndices.lowerBound)...indexFor(row: row, column: columnIndices.upperBound)
    }
    
}

extension Shape {
    
    @inlinable internal func contains(row: Int, column: Int) -> Bool {
        return rowIndices.contains(row) && columnIndices.contains(column)
    }
    
    @inlinable internal func contains(rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> Bool {
        return rowIndices.contains(rows.lowerBound) && rowIndices.contains(rows.upperBound) && columnIndices.contains(columns.lowerBound) && columnIndices.contains(columns.upperBound)
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

extension Shape: Codable {
    
    enum CodingKeys: String, CodingKey {
        case rows
        case columns
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rows = try container.decode(Int.self, forKey: .rows)
        self.columns = try container.decode(Int.self, forKey: .columns)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(rows, forKey: .rows)
        try container.encode(columns, forKey: .columns)
    }

}
