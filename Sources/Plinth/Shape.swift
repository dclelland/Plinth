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
    
    public var length: Int {
        return max(rows, columns)
    }
    
    public var breadth: Int {
        return min(rows, columns)
    }
    
}

extension Shape {
    
    public static let empty = Shape(rows: .zero, columns: .zero)
    
    public var isEmpty: Bool {
        return rows == .zero || columns == .zero
    }
    
}

extension Shape {
    
    public static func square(length: Int) -> Shape {
        return .init(rows: length, columns: length)
    }
    
    public var isSquare: Bool {
        return rows == columns
    }
    
}

extension Shape {
    
    public func upscaled(by factor: Int = 1) -> Shape {
        let multiplicand = Int(pow(2.0, Double(factor)))
        return Shape(rows: rows * multiplicand, columns: columns * multiplicand)
    }
    
    public func downscaled(by factor: Int = 1) -> Shape {
        let dividend = Int(pow(2.0, Double(factor)))
        return Shape(rows: rows / dividend, columns: columns / dividend)
    }
    
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
    
    @inlinable internal func indicesFor(row: Int) -> ClosedRange<Int> {
        return indexFor(row: row, column: columnIndices.lowerBound)...indexFor(row: row, column: columnIndices.upperBound)
    }
    
    @inlinable internal func indexFor(row: Int, column: Int) -> Int {
        return row * columns + column
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
