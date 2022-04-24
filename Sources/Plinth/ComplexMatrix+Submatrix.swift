//
//  ComplexMatrix+Submatrix.swift
//  Plinth
//
//  Created by Daniel Clelland on 24/04/22.
//

import Foundation
import Accelerate

extension ComplexMatrix where Scalar == Float {
    
    public func submatrix(rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> ComplexMatrix {
        precondition(shape.contains(rows: rows, columns: columns))
        return ComplexMatrix(real: real.submatrix(rows: rows, columns: columns), imaginary: imaginary.submatrix(rows: rows, columns: columns))
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public subscript(row row: Int) -> ComplexMatrix {
        get {
            return submatrix(rows: row...row, columns: shape.columnIndices)
        }
    }
    
    public subscript(column column: Int) -> ComplexMatrix {
        get {
            return submatrix(rows: shape.columnIndices, columns: column...column)
        }
    }
    
    public subscript(rows rows: ClosedRange<Int>) -> ComplexMatrix {
        get {
            return submatrix(rows: rows, columns: shape.columnIndices)
        }
    }
    
    public subscript(columns columns: ClosedRange<Int>) -> ComplexMatrix {
        get {
            return submatrix(rows: shape.rowIndices, columns: columns)
        }
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public subscript(row: Int, columns: ClosedRange<Int>) -> ComplexMatrix {
        get {
            return submatrix(rows: row...row, columns: columns)
        }
    }
    
    public subscript(rows: ClosedRange<Int>, column: Int) -> ComplexMatrix {
        get {
            return submatrix(rows: rows, columns: column...column)
        }
    }
    
    public subscript(rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> ComplexMatrix {
        get {
            return submatrix(rows: rows, columns: columns)
        }
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func submatrix(rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> ComplexMatrix {
        precondition(shape.contains(rows: rows, columns: columns))
        return ComplexMatrix(real: real.submatrix(rows: rows, columns: columns), imaginary: imaginary.submatrix(rows: rows, columns: columns))
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public subscript(row row: Int) -> ComplexMatrix {
        get {
            return submatrix(rows: row...row, columns: shape.columnIndices)
        }
    }
    
    public subscript(column column: Int) -> ComplexMatrix {
        get {
            return submatrix(rows: shape.columnIndices, columns: column...column)
        }
    }
    
    public subscript(rows rows: ClosedRange<Int>) -> ComplexMatrix {
        get {
            return submatrix(rows: rows, columns: shape.columnIndices)
        }
    }
    
    public subscript(columns columns: ClosedRange<Int>) -> ComplexMatrix {
        get {
            return submatrix(rows: shape.rowIndices, columns: columns)
        }
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public subscript(row: Int, columns: ClosedRange<Int>) -> ComplexMatrix {
        get {
            return submatrix(rows: row...row, columns: columns)
        }
    }
    
    public subscript(rows: ClosedRange<Int>, column: Int) -> ComplexMatrix {
        get {
            return submatrix(rows: rows, columns: column...column)
        }
    }
    
    public subscript(rows: ClosedRange<Int>, columns: ClosedRange<Int>) -> ComplexMatrix {
        get {
            return submatrix(rows: rows, columns: columns)
        }
    }
    
}
