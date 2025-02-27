//
//  Repeat.swift
//  Plinth
//
//  Created by Daniel Clelland on 28/02/2025.
//

import Foundation

extension Matrix where Scalar == Float {
    
    public func repeated(rows: Int) -> Matrix {
        let elements = Array([[Scalar]](repeating: elements, count: rows).joined())
        return Matrix(shape: .init(rows: rows, columns: shape.count), elements: elements)
    }
    
    public func repeated(columns: Int) -> Matrix {
        return repeated(rows: columns).transposed()
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func repeated(rows: Int) -> ComplexMatrix {
        return ComplexMatrix(real: real.repeated(rows: rows), imaginary: imaginary.repeated(rows: rows))
    }
    
    public func repeated(columns: Int) -> ComplexMatrix {
        return ComplexMatrix(real: real.repeated(columns: columns), imaginary: imaginary.repeated(columns: columns))
    }
    
}

extension Matrix where Scalar == Double {
    
    public func repeated(rows: Int) -> Matrix {
        let elements = Array([[Scalar]](repeating: elements, count: rows).joined())
        return Matrix(shape: .init(rows: rows, columns: shape.count), elements: elements)
    }
    
    public func repeated(columns: Int) -> Matrix {
        return repeated(rows: columns).transposed()
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func repeated(rows: Int) -> ComplexMatrix {
        return ComplexMatrix(real: real.repeated(rows: rows), imaginary: imaginary.repeated(rows: rows))
    }
    
    public func repeated(columns: Int) -> ComplexMatrix {
        return ComplexMatrix(real: real.repeated(columns: columns), imaginary: imaginary.repeated(columns: columns))
    }
    
}
