//
//  Roots.swift
//  Plinth
//
//  Created by Daniel Clelland on 5/05/22.
//

import Foundation
import Numerics

extension Array where Element == Float {
    
    public func roots() -> [Complex<Element>] {
        var companion: Matrix<Element> = .diagonal(length: count - 2, index: -1)
        companion[row: 0] = .init(row: Array(self[1..<count]) / self[0])
        return companion.eigenDecomposition().eigenvalues
    }
    
}

extension Array where Element == Double {
    
    public func roots() -> [Complex<Element>] {
        var companion: Matrix<Element> = .diagonal(length: count - 2, index: -1)
        companion[row: 0] = .init(row: Array(self[1..<count]) / self[0])
        return companion.eigenDecomposition().eigenvalues
    }
    
}
