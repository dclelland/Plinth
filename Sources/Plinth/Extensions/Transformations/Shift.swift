//
//  Shift.swift
//  Plinth
//
//  Created by Daniel Clelland on 26/04/22.
//

import Foundation

infix operator %%: MultiplicationPrecedence

extension BinaryInteger {
 
    internal static func %% (left: Self, right: Self) -> Self {
        let remainder = left % right
        return remainder >= 0 ? remainder : remainder + right
    }
    
}

extension Matrix where Scalar == Float {
    
    public func shifted(rows: Int) -> Matrix {
        let rows = rows %% shape.rows
        
        guard rows != 0 else {
            return self
        }
        
        let inputTop = 0...(shape.rows - rows - 1)
        let inputBottom = (shape.rows - rows)...(shape.rows - 1)
        
        let outputTop = 0...(rows - 1)
        let outputBottom = (rows)...(shape.rows - 1)
        
        var output: Matrix = .zeros(shape: shape)
        
        output[rows: outputTop] = self[rows: inputBottom]
        output[rows: outputBottom] = self[rows: inputTop]
        
        return output
    }
    
    public func shifted(columns: Int) -> Matrix {
        let columns = columns %% shape.rows
        
        guard columns != 0 else {
            return self
        }
        
        let inputLeft = 0...(shape.columns - columns - 1)
        let inputRight = (shape.columns - columns)...(shape.columns - 1)
        
        let outputLeft = 0...(columns - 1)
        let outputRight = (columns)...(shape.columns - 1)
        
        var output: Matrix = .zeros(shape: shape)
        
        output[columns: outputLeft] = self[columns: inputRight]
        output[columns: outputRight] = self[columns: inputLeft]
        
        return output
    }
    
    public func shifted(rows: Int, columns: Int) -> Matrix {
        let rows = rows %% shape.rows
        let columns = columns %% shape.rows
        
        switch (rows, columns) {
        case (0, 0):
            return self
        case (_, 0):
            return shifted(rows: rows)
        case (0, _):
            return shifted(columns: columns)
        case (_, _):
            break
        }
        
        let inputTop = 0...(shape.rows - rows - 1)
        let inputLeft = 0...(shape.columns - columns - 1)
        let inputBottom = (shape.rows - rows)...(shape.rows - 1)
        let inputRight = (shape.columns - columns)...(shape.columns - 1)
        
        let outputTop = 0...(rows - 1)
        let outputLeft = 0...(columns - 1)
        let outputBottom = (rows)...(shape.rows - 1)
        let outputRight = (columns)...(shape.columns - 1)
        
        var output: Matrix = .zeros(shape: shape)
        
        output[outputTop, outputLeft] = self[inputBottom, inputRight]
        output[outputTop, outputRight] = self[inputBottom, inputLeft]
        output[outputBottom, outputLeft] = self[inputTop, inputRight]
        output[outputBottom, outputRight] = self[inputTop, inputLeft]
        
        return output
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func shifted(rows: Int) -> ComplexMatrix {
        return ComplexMatrix(real: real.shifted(rows: rows), imaginary: imaginary.shifted(rows: rows))
    }
    
    public func shifted(columns: Int) -> ComplexMatrix {
        return ComplexMatrix(real: real.shifted(columns: columns), imaginary: imaginary.shifted(columns: columns))
    }
    
    public func shifted(rows: Int, columns: Int) -> ComplexMatrix {
        return ComplexMatrix(real: real.shifted(rows: rows, columns: columns), imaginary: imaginary.shifted(rows: rows, columns: columns))
    }
    
}


extension Matrix where Scalar == Double {
    
    public func shifted(rows: Int) -> Matrix {
        let rows = rows %% shape.rows
        
        guard rows != 0 else {
            return self
        }
        
        let inputTop = 0...(shape.rows - rows - 1)
        let inputBottom = (shape.rows - rows)...(shape.rows - 1)
        
        let outputTop = 0...(rows - 1)
        let outputBottom = (rows)...(shape.rows - 1)
        
        var output: Matrix = .zeros(shape: shape)
        
        output[rows: outputTop] = self[rows: inputBottom]
        output[rows: outputBottom] = self[rows: inputTop]
        
        return output
    }
    
    public func shifted(columns: Int) -> Matrix {
        let columns = columns %% shape.rows
        
        guard columns != 0 else {
            return self
        }
        
        let inputLeft = 0...(shape.columns - columns - 1)
        let inputRight = (shape.columns - columns)...(shape.columns - 1)
        
        let outputLeft = 0...(columns - 1)
        let outputRight = (columns)...(shape.columns - 1)
        
        var output: Matrix = .zeros(shape: shape)
        
        output[columns: outputLeft] = self[columns: inputRight]
        output[columns: outputRight] = self[columns: inputLeft]
        
        return output
    }
    
    public func shifted(rows: Int, columns: Int) -> Matrix {
        let rows = rows %% shape.rows
        let columns = columns %% shape.rows
        
        switch (rows, columns) {
        case (0, 0):
            return self
        case (_, 0):
            return shifted(rows: rows)
        case (0, _):
            return shifted(columns: columns)
        case (_, _):
            break
        }
        
        let inputTop = 0...(shape.rows - rows - 1)
        let inputLeft = 0...(shape.columns - columns - 1)
        let inputBottom = (shape.rows - rows)...(shape.rows - 1)
        let inputRight = (shape.columns - columns)...(shape.columns - 1)
        
        let outputTop = 0...(rows - 1)
        let outputLeft = 0...(columns - 1)
        let outputBottom = (rows)...(shape.rows - 1)
        let outputRight = (columns)...(shape.columns - 1)
        
        var output: Matrix = .zeros(shape: shape)
        
        output[outputTop, outputLeft] = self[inputBottom, inputRight]
        output[outputTop, outputRight] = self[inputBottom, inputLeft]
        output[outputBottom, outputLeft] = self[inputTop, inputRight]
        output[outputBottom, outputRight] = self[inputTop, inputLeft]
        
        return output
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func shifted(rows: Int) -> ComplexMatrix {
        return ComplexMatrix(real: real.shifted(rows: rows), imaginary: imaginary.shifted(rows: rows))
    }
    
    public func shifted(columns: Int) -> ComplexMatrix {
        return ComplexMatrix(real: real.shifted(columns: columns), imaginary: imaginary.shifted(columns: columns))
    }
    
    public func shifted(rows: Int, columns: Int) -> ComplexMatrix {
        return ComplexMatrix(real: real.shifted(rows: rows, columns: columns), imaginary: imaginary.shifted(rows: rows, columns: columns))
    }
    
}
