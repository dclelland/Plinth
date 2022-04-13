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
    
    internal func contains(row: Int) -> Bool {
        return (0..<rows).contains(row)
    }
    
    internal func contains(column: Int) -> Bool {
        return (0..<columns).contains(column)
    }
    
    internal func contains(row: Int, column: Int) -> Bool {
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
