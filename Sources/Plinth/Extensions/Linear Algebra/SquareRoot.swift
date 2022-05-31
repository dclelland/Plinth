//
//  SquareRoot.swift
//  Plinth
//
//  Created by Daniel Clelland on 30/05/22.
//

import Foundation

extension ComplexMatrix where Scalar == Float {
    
    public func sqrt() -> ComplexMatrix {
        let phase = phase()
        return absolute().sqrt() * ComplexMatrix(real: (phase / 2.0).cos(), imaginary: (phase / 2.0).sin())
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func sqrt() -> ComplexMatrix {
        let phase = phase()
        return absolute().sqrt() * ComplexMatrix(real: (phase / 2.0).cos(), imaginary: (phase / 2.0).sin())
    }
    
}
