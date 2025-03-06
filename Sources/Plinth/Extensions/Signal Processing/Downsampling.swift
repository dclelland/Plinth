//
//  Downsampling.swift
//  Plinth
//
//  Created by Daniel Clelland on 06/03/2025.
//

import Plinth
import Accelerate

extension Matrix where Scalar == Float {

    public func downsampled(decimationFactor: Int = 2, filter: [Scalar] = [1.0]) -> Matrix {
        let coefficients = [Scalar](repeating: 1.0 / Scalar(decimationFactor), count: decimationFactor)
        let elements = vDSP.downsample(elements, decimationFactor: decimationFactor, filter: filter)
        return Matrix(shape: .row(length: shape.count / decimationFactor), elements: elements)
    }

}

extension ComplexMatrix where Scalar == Float {

    public func downsampled(decimationFactor: Int = 2, filter: [Scalar] = [1.0]) -> ComplexMatrix {
        return ComplexMatrix(
            real: real.downsampled(decimationFactor: decimationFactor, filter: filter),
            imaginary: imaginary.downsampled(decimationFactor: decimationFactor, filter: filter)
        )
    }

}

extension Matrix where Scalar == Double {

    public func downsampled(decimationFactor: Int = 2, filter: [Scalar] = [1.0]) -> Matrix {
        let coefficients = [Scalar](repeating: 1.0 / Scalar(decimationFactor), count: decimationFactor)
        let elements = vDSP.downsample(elements, decimationFactor: decimationFactor, filter: filter)
        return Matrix(shape: .row(length: shape.count / decimationFactor), elements: elements)
    }

}

extension ComplexMatrix where Scalar == Double {

    public func downsampled(decimationFactor: Int = 2, filter: [Scalar] = [1.0]) -> ComplexMatrix {
        return ComplexMatrix(
            real: real.downsampled(decimationFactor: decimationFactor, filter: filter),
            imaginary: imaginary.downsampled(decimationFactor: decimationFactor, filter: filter)
        )
    }

}
