//
//  Exponents.swift
//  Plinth
//
//  Created by Daniel Clelland on 28/04/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public func exp() -> Matrix {
        return fmap(vForce.exp)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func exp() -> ComplexMatrix {
        return real.exp() * ComplexMatrix(real: imaginary.fmap(vForce.cos), imaginary: imaginary.fmap(vForce.sin))
    }
    
}

extension Matrix where Scalar == Double {
    
    public func exp() -> Matrix {
        return fmap(vForce.exp)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func exp() -> ComplexMatrix {
        return real.exp() * ComplexMatrix(real: imaginary.fmap(vForce.cos), imaginary: imaginary.fmap(vForce.sin))
    }
    
}
