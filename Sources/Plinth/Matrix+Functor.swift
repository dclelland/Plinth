//
//  Matrix+Functor.swift
//  Plinth
//
//  Created by Daniel Clelland on 20/04/22.
//

import Foundation

extension Matrix {
    
    @inlinable public func fmap<A>(_ function: ([Scalar]) -> A) -> A {
        return function(elements)
    }
    
    @inlinable public func fmap<A>(_ function: ([Scalar]) -> [A]) -> Matrix<A> {
        return Matrix<A>(shape: shape, elements: function(elements))
    }
    
    @inlinable public func fmap<A>(_ function: ([Scalar], inout [A]) -> ()) -> Matrix<A> where A: Numeric {
        var output = Matrix<A>.zeros(shape: shape)
        function(elements, &output.elements)
        return output
    }
    
}
