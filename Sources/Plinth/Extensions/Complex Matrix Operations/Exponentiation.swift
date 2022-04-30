//
//  Exponents.swift
//  Plinth
//
//  Created by Daniel Clelland on 28/04/22.
//

import Foundation
import Accelerate

extension ComplexMatrix where Scalar == Float {
    
    public func exp() -> ComplexMatrix {
        return real.exp() * ComplexMatrix(real: imaginary.cos(), imaginary: imaginary.sin())
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func exp() -> ComplexMatrix {
        return real.exp() * ComplexMatrix(real: imaginary.cos(), imaginary: imaginary.sin())
    }
    
}
