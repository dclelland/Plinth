//
//  Shifts.swift
//  Plinth
//
//  Created by Daniel Clelland on 26/04/22.
//

import Foundation

extension Matrix {
    
    public func shifted(rows: Int, columns: Int) -> Matrix {
        return Matrix(shape: shape) { (row, column) -> Scalar in
            return self[(row + rows) % shape.rows, (column + columns) % shape.columns]
        }
    }
    
}

extension ComplexMatrix {
    
    public func shifted(rows: Int, columns: Int) -> ComplexMatrix {
        return ComplexMatrix(
            real: real.shifted(rows: rows, columns: columns),
            imaginary: imaginary.shifted(rows: rows, columns: columns)
        )
    }
    
}
