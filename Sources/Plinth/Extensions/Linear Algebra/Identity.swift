//
//  Identity.swift
//  Plinth
//
//  Created by Daniel Clelland on 8/05/22.
//

import Foundation

extension Matrix where Scalar: Numeric {
    
    public static func identity(shape: Shape) -> Matrix {
        return .init(shape: shape) { row, column in
            return row == column ? 1 : 0
        }
    }
    
}

extension ComplexMatrix where Scalar: Numeric {
    
    public static func identity(shape: Shape) -> ComplexMatrix {
        return .init(shape: shape) { row, column in
            return row == column ? 1 : 0
        }
    }
    
}
