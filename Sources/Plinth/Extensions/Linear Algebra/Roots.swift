//
//  Roots.swift
//  Plinth
//
//  Created by Daniel Clelland on 5/05/22.
//

import Foundation
import Numerics

extension Matrix where Scalar == Float {
    
    public func roots() -> ComplexMatrix<Element> {
        precondition(shape.isRow)
        var companion: Matrix<Element> = .diagonal(length: count - 2, index: -1)
        companion[row: 0] = -self[0, 1...shape.columnIndices.upperBound] / self[0, 0]
        return companion.eigenvalues()
    }
    
}

extension Matrix where Scalar == Double {
    
    public func roots() -> ComplexMatrix<Element> {
        precondition(shape.isRow)
        var companion: Matrix<Element> = .diagonal(length: count - 2, index: -1)
        companion[row: 0] = -self[0, 1...shape.columnIndices.upperBound] / self[0, 0]
        return companion.eigenvalues()
    }
    
}
