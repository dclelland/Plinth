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
        return real.fmap(vForce.exp) * ComplexMatrix(real: imaginary.fmap(vForce.cos), imaginary: imaginary.fmap(vForce.sin))
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func exp() -> ComplexMatrix {
        return real.fmap(vForce.exp) * ComplexMatrix(real: imaginary.fmap(vForce.cos), imaginary: imaginary.fmap(vForce.sin))
    }
    
}
