//
//  Reverse.swift
//  Plinth
//
//  Created by Daniel Clelland on 07/03/2025.
//

import Foundation
import Plinth

extension Matrix where Scalar == Float {
    
    public func reversedRows() -> Matrix {
        var output = self
        for row in output.shape.rowIndices {
            output[row: row] = output[row: row].reversed()
        }
        return output
    }
    
    public func reversedColumns() -> Matrix {
        var output = self
        for column in output.shape.columnIndices {
            output[column: column] = output[column: column].reversed()
        }
        return output
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func reversedRows() -> ComplexMatrix {
        return ComplexMatrix(real: real.reversedRows(), imaginary: imaginary.reversedRows())
    }
    
    public func reversedColumns() -> ComplexMatrix {
        return ComplexMatrix(real: real.reversedColumns(), imaginary: imaginary.reversedColumns())
    }
    
}

extension Matrix where Scalar == Double {
    
    public func reversedRows() -> Matrix {
        var output = self
        for row in output.shape.rowIndices {
            output[row: row] = output[row: row].reversed()
        }
        return output
    }
    
    public func reversedColumns() -> Matrix {
        var output = self
        for column in output.shape.columnIndices {
            output[column: column] = output[column: column].reversed()
        }
        return output
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func reversedRows() -> ComplexMatrix {
        return ComplexMatrix(real: real.reversedRows(), imaginary: imaginary.reversedRows())
    }
    
    public func reversedColumns() -> ComplexMatrix {
        return ComplexMatrix(real: real.reversedColumns(), imaginary: imaginary.reversedColumns())
    }
    
}
