//
//  Ones.swift
//  Plinth
//
//  Created by Daniel Clelland on 14/05/22.
//

import Foundation

extension Matrix where Scalar: Numeric {
    
    public static func ones(shape: Shape) -> Matrix {
        return .init(shape: shape, repeating: 1)
    }
    
}

extension ComplexMatrix where Scalar: Numeric {

    public static func ones(shape: Shape) -> ComplexMatrix {
        return ComplexMatrix(real: .ones(shape: shape), imaginary: .zeros(shape: shape))
    }
    
}
