//
//  ComplexMatrix+Transposition.swift
//  Plinth
//
//  Created by Daniel Clelland on 25/04/22.
//

import Foundation

extension ComplexMatrix where Scalar == Float {
    
    public func transposed() -> ComplexMatrix {
        return ComplexMatrix(real: real.transposed(), imaginary: imaginary.transposed())
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func transposed() -> ComplexMatrix {
        return ComplexMatrix(real: real.transposed(), imaginary: imaginary.transposed())
    }
    
}
