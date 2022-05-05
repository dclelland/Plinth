//
//  Matrix.swift
//  Plinth
//
//  Created by Daniel Clelland on 5/05/22.
//

import Foundation

extension Matrix where Scalar: Numeric {
    
    public static func diagonal(length: Int, index: Int = 0) -> Matrix {
        return .diagonal(vector: .init(repeating: 1, count: length), index: index)
    }
    
    public static func diagonal(vector: [Scalar], index: Int = 0) -> Matrix {
        return .init(shape: .square(length: vector.count + abs(index))) { row, column in
            return column - row == index ? vector[Swift.min(row, column)] : .zero
        }
    }
    
}
