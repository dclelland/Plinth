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
            return column - row == 0 ? 1 : 0
        }
    }
    
}
