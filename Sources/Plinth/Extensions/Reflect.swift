//
//  Reflect.swift
//  
//
//  Created by Daniel Clelland on 27/04/22.
//

import Foundation

extension Matrix where Scalar == Float {
    
    public func reflectedHorizontally() -> Matrix {
        return self[shape.rowBounds.reversed(), shape.columnBounds]
    }
    
    public func reflectedVertically() -> Matrix {
        return self[shape.rowBounds, shape.columnBounds.reversed()]
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func reflectedHorizontally() -> ComplexMatrix {
        return ComplexMatrix(real: real.reflectedHorizontally(), imaginary: imaginary.reflectedHorizontally())
    }
    
    public func reflectedVertically() -> ComplexMatrix {
        return ComplexMatrix(real: real.reflectedVertically(), imaginary: imaginary.reflectedVertically())
    }
    
}

extension Matrix where Scalar == Double {
    
    public func reflectedHorizontally() -> Matrix {
        return self[shape.rowBounds.reversed(), shape.columnBounds]
    }
    
    public func reflectedVertically() -> Matrix {
        return self[shape.rowBounds, shape.columnBounds.reversed()]
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func reflectedHorizontally() -> ComplexMatrix {
        return ComplexMatrix(real: real.reflectedHorizontally(), imaginary: imaginary.reflectedHorizontally())
    }
    
    public func reflectedVertically() -> ComplexMatrix {
        return ComplexMatrix(real: real.reflectedVertically(), imaginary: imaginary.reflectedVertically())
    }
    
}
