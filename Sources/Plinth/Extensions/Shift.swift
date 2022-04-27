//
//  Shift.swift
//  Plinth
//
//  Created by Daniel Clelland on 26/04/22.
//

import Foundation

extension Matrix where Scalar == Float {
    
    public func shifted(rows: Int, columns: Int) -> Matrix {
        let inputTop = 0..(rows - 1)
        let inputLeft = 0..(columns - 1)
        let inputBottom = (rows)..(shape.rows - 1)
        let inputRight = (columns)..(shape.columns - 1)
        
        let outputTop = 0..(shape.rows - rows - 1)
        let outputLeft = 0..(shape.columns - columns - 1)
        let outputBottom = (shape.rows - rows)..(shape.rows - 1)
        let outputRight = (shape.rows - rows)..(shape.columns - 1)
        
        var output: Matrix = .zeros(shape: shape)
        
        output[outputTop, outputLeft] = self[inputBottom, inputRight]
        output[outputTop, outputRight] = self[inputBottom, inputLeft]
        output[outputBottom, outputLeft] = self[inputTop, inputRight]
        output[outputBottom, outputRight] = self[inputTop, inputLeft]
        
        return output
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func shifted(rows: Int, columns: Int) -> ComplexMatrix {
        return ComplexMatrix(
            real: real.shifted(rows: rows, columns: columns),
            imaginary: imaginary.shifted(rows: rows, columns: columns)
        )
    }
    
}

extension Matrix where Scalar == Double {
    
    public func shifted(rows: Int, columns: Int) -> Matrix {
        let inputTop = 0..(rows - 1)
        let inputLeft = 0..(columns - 1)
        let inputBottom = (rows)..(shape.rows - 1)
        let inputRight = (columns)..(shape.columns - 1)
        
        let outputTop = 0..(shape.rows - rows - 1)
        let outputLeft = 0..(shape.columns - columns - 1)
        let outputBottom = (shape.rows - rows)..(shape.rows - 1)
        let outputRight = (shape.rows - rows)..(shape.columns - 1)
        
        var output: Matrix = .zeros(shape: shape)
        
        output[outputTop, outputLeft] = self[inputBottom, inputRight]
        output[outputTop, outputRight] = self[inputBottom, inputLeft]
        output[outputBottom, outputLeft] = self[inputTop, inputRight]
        output[outputBottom, outputRight] = self[inputTop, inputLeft]
        
        return output
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func shifted(rows: Int, columns: Int) -> ComplexMatrix {
        return ComplexMatrix(
            real: real.shifted(rows: rows, columns: columns),
            imaginary: imaginary.shifted(rows: rows, columns: columns)
        )
    }
    
}
