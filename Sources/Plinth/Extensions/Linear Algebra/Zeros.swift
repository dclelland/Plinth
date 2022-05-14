//
//  Zeros.swift
//  Plinth
//
//  Created by Daniel Clelland on 14/05/22.
//

import Foundation

extension Matrix where Scalar: Numeric {
    
    public static func zeros(shape: Shape) -> Matrix {
        return .init(shape: shape, repeating: 0)
    }
    
}

extension ComplexMatrix where Scalar: Numeric {

    public static func zeros(shape: Shape) -> ComplexMatrix {
        return ComplexMatrix(real: .zeros(shape: shape), imaginary: .zeros(shape: shape))
    }
    
}
