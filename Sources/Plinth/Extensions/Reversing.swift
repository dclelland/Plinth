//
//  Reversing.swift
//  Plinth
//
//  Created by Daniel Clelland on 27/04/22.
//

import Foundation

extension Matrix {
    
    public func reversed() -> Matrix {
        return fmap { $0.reversed() }
    }
    
}

extension ComplexMatrix {
    
    public func reversed() -> ComplexMatrix {
        return ComplexMatrix(real: real.reversed(), imaginary: imaginary.reversed())
    }
    
}
