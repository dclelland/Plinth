//
//  Powers.swift
//  Plinth
//
//  Created by Daniel Clelland on 29/04/22.
//

import Foundation

extension Matrix where Scalar == Float {

    public func pow(_ exponent: Int) -> Matrix {
        switch exponent.signum() {
        case -1:
            return [Matrix](repeating: self, count: -exponent - 1).reduce(self, *).reciprocal()
        case 0:
            return .init(shape: shape, repeating: 1.0)
        case 1:
            return [Matrix](repeating: self, count: exponent - 1).reduce(self, *)
        default:
            fatalError()
        }
    }

}

extension Matrix where Scalar == Double {

    public func pow(_ exponent: Int) -> Matrix {
        switch exponent.signum() {
        case -1:
            return [Matrix](repeating: self, count: -exponent - 1).reduce(self, *).reciprocal()
        case 0:
            return .init(shape: shape, repeating: 1.0)
        case 1:
            return [Matrix](repeating: self, count: exponent - 1).reduce(self, *)
        default:
            fatalError()
        }
    }

}