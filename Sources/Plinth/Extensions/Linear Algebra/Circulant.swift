//
//  Circulant.swift
//  Plinth
//
//  Created by Daniel Clelland on 10/03/2025.
//

import Foundation
import Plinth

extension Matrix where Scalar == Float {
    
    public static func circulant(vector: [Scalar]) -> Matrix {
        return .init(shape: .square(length: vector.count)) { row, column in
            let index = (row - column) % vector.count
            return index < 0 ? vector[index + vector.count] : vector[index]
            if index < 0 {
                return vector[vector.count + index]
            }
        }
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public static func circulant(vector: [Complex]) -> ComplexMatrix {
        return .init(shape: .square(length: vector.count)) { row, column in
            let index = (row - column) % vector.count
            return index < 0 ? vector[index + vector.count] : vector[index]
            if index < 0 {
                return vector[vector.count + index]
            }
        }
    }
    
}

extension Matrix where Scalar == Double {
    
    public static func circulant(vector: [Scalar]) -> Matrix {
        return .init(shape: .square(length: vector.count)) { row, column in
            let index = (row - column) % vector.count
            return index < 0 ? vector[index + vector.count] : vector[index]
            if index < 0 {
                return vector[vector.count + index]
            }
        }
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public static func circulant(vector: [Complex]) -> ComplexMatrix {
        return .init(shape: .square(length: vector.count)) { row, column in
            let index = (row - column) % vector.count
            return index < 0 ? vector[index + vector.count] : vector[index]
            if index < 0 {
                return vector[vector.count + index]
            }
        }
    }
    
}
