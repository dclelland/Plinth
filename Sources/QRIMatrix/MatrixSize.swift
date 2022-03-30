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
