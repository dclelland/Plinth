//
//  Functors.swift
//  Plinth
//
//  Created by Daniel Clelland on 20/04/22.
//

import Foundation
import Accelerate

extension Matrix {
    
    @inlinable public func fmap<A>(_ function: ([Scalar]) -> A) -> A {
        return function(elements)
    }
    
    @inlinable public func fmap<A>(_ function: ([Scalar]) -> [A]) -> Matrix<A> {
        return Matrix<A>(shape: shape, elements: function(elements))
    }
    
    @inlinable public func fmap(_ function: (inout [Scalar]) -> ()) -> Matrix {
        var output = self
        function(&output.elements)
        return output
    }
    
    @inlinable public func fmap<A>(_ function: ([Scalar], inout [A]) -> ()) -> Matrix<A> where A: Numeric {
        var output = Matrix<A>.zeros(shape: shape)
        function(elements, &output.elements)
        return output
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
    
}

extension ComplexMatrix where Scalar == Float {
    
    @inlinable public func fmap(_ function: (inout DSPSplitComplex) -> ()) -> ComplexMatrix {
        var input = self
        input.withUnsafeMutableSplitComplexVector { inputVector in
            function(&inputVector)
        }
        return input
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

extension ComplexMatrix where Scalar == Float {
    
    @inlinable public mutating func withUnsafeMutableSplitComplexVector<Result>(_ body: (inout DSPSplitComplex) throws -> Result) rethrows -> Result {
        return try real.withUnsafeMutableBufferPointer { realPointer in
            return try imaginary.withUnsafeMutableBufferPointer { imaginaryPointer in
                var split = DSPSplitComplex(realp: realPointer.baseAddress!, imagp: imaginaryPointer.baseAddress!)
                return try body(&split)
            }
        }
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
    
}

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public func fmap(_ function: (inout DSPDoubleSplitComplex) -> ()) -> ComplexMatrix {
        var input = self
        input.withUnsafeMutableSplitComplexVector { inputVector in
            function(&inputVector)
        }
        return input
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

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public mutating func withUnsafeMutableSplitComplexVector<Result>(_ body: (inout DSPDoubleSplitComplex) throws -> Result) rethrows -> Result {
        return try real.withUnsafeMutableBufferPointer { realPointer in
            return try imaginary.withUnsafeMutableBufferPointer { imaginaryPointer in
                var split = DSPDoubleSplitComplex(realp: realPointer.baseAddress!, imagp: imaginaryPointer.baseAddress!)
                return try body(&split)
            }
        }
    }
    
}
