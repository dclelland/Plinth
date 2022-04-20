//
//  ComplexMatrix+Functor.swift
//  Plinth
//
//  Created by Daniel Clelland on 20/04/22.
//

import Foundation
import Accelerate

extension ComplexMatrix {
    
    @inlinable public func fmap<A>(_ function: ([Scalar]) -> [A]) -> ComplexMatrix<A> {
        return ComplexMatrix<A>(real: real.fmap(function), imaginary: imaginary.fmap(function))
    }
    
    @inlinable public func fmap<A>(_ function: ([Scalar], inout [A]) -> ()) -> ComplexMatrix<A> where A: Numeric {
        return ComplexMatrix<A>(real: real.fmap(function), imaginary: imaginary.fmap(function))
    }
    
}

extension ComplexMatrix {
    
    @inlinable public func fmap<A>(real realFunction: ([Scalar]) -> [A], imaginary imaginaryFunction: ([Scalar]) -> [A]) -> ComplexMatrix<A> {
        return ComplexMatrix<A>(real: real.fmap(realFunction), imaginary: imaginary.fmap(imaginaryFunction))
    }
    
    @inlinable public func fmap<A>(real realFunction: ([Scalar], inout [A]) -> (), imaginary imaginaryFunction: ([Scalar], inout [A]) -> ()) -> ComplexMatrix<A> where A: Numeric {
        return ComplexMatrix<A>(real: real.fmap(realFunction), imaginary: imaginary.fmap(imaginaryFunction))
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    @inlinable public func fmap(_ function: (DSPSplitComplex, inout [Scalar]) -> ()) -> Matrix {
        var input = self
        var output = Matrix.zeros(shape: shape)
        input.withUnsafeMutableSplitComplexVector { inputVector in
            function(inputVector, &output.elements)
        }
        return output
    }
    
    @inlinable public func fmap(_ function: (DSPSplitComplex, inout DSPSplitComplex) -> ()) -> ComplexMatrix {
        var input = self
        var output = ComplexMatrix.zeros(shape: shape)
        input.withUnsafeMutableSplitComplexVector { inputVector in
            output.withUnsafeMutableSplitComplexVector { outputVector in
                function(inputVector, &outputVector)
            }
        }
        return output
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public func fmap(_ function: (DSPDoubleSplitComplex, inout [Scalar]) -> ()) -> Matrix {
        var input = self
        var output = Matrix.zeros(shape: shape)
        input.withUnsafeMutableSplitComplexVector { inputVector in
            function(inputVector, &output.elements)
        }
        return output
    }
    
    @inlinable public func fmap(_ function: (DSPDoubleSplitComplex, inout DSPDoubleSplitComplex) -> ()) -> ComplexMatrix {
        var input = self
        var output = ComplexMatrix.zeros(shape: shape)
        input.withUnsafeMutableSplitComplexVector { inputVector in
            output.withUnsafeMutableSplitComplexVector { outputVector in
                function(inputVector, &outputVector)
            }
        }
        return output
    }
    
}
