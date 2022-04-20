//
//  ComplexMatrix+Functor.swift
//  Plinth
//
//  Created by Daniel Clelland on 20/04/22.
//

import Foundation

extension ComplexMatrix {
    
    @inlinable public func fmap<A>(real realFunction: ([Scalar]) -> [A], imaginary imaginaryFunction: ([Scalar]) -> [A]) -> ComplexMatrix<A> {
        return ComplexMatrix<A>(real: real.fmap(realFunction), imaginary: imaginary.fmap(imaginaryFunction))
    }
    
    @inlinable public func fmap<A>(_ function: ([Scalar]) -> [A]) -> ComplexMatrix<A> {
        return ComplexMatrix<A>(real: real.fmap(function), imaginary: imaginary.fmap(function))
    }
    
}

/*
extension ComplexMatrix where Scalar == Double {
    
    // TODO: Review type signatures in vDSP
    
    @inlinable public func fmap<A>(_ function: (DSPSplitComplex) -> A) -> ComplexMatrix<A> {
        var input = self
        return input.withUnsafeMutableSplitComplexVector { inputVector in
            return function(inputVector)
        }
    }
    
    @inlinable public func fmap<A>(_ function: (DSPSplitComplex) -> [A]) -> Matrix<A> {
        var input = self
        return input.withUnsafeMutableSplitComplexVector { inputVector in
            return function(inputVector)
        }
    }
    
    @inlinable public func fmap<A>(_ function: (DSPSplitComplex) -> [A]) -> ComplexMatrix<A> {
        var input = self
        return input.withUnsafeMutableSplitComplexVector { inputVector in
            return function(inputVector)
        }
    }
    
}
 */
