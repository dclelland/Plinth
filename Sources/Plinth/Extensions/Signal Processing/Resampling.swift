//
//  Resampling.swift
//  Plinth
//
//  Created by Daniel Clelland on 06/03/2025.
//

import Plinth
import Accelerate

extension Matrix where Scalar == Float {
    
    public func upsampled(factor: Int = 2) -> Matrix {
        var elements = Matrix.zeros(shape: .init(rows: shape.count, columns: factor))
        elements[column: 0] = asColumn()
        return elements.reshaped(.init(rows: shape.rows, columns: shape.columns * factor))
    }

    public func downsampled(factor: Int = 2, filter: [Scalar] = [1.0]) -> Matrix {
        let coefficients = [Scalar](repeating: 1.0 / Scalar(factor), count: factor)
        let elements = vDSP.downsample(elements, decimationFactor: factor, filter: filter)
        return Matrix(shape: .init(rows: shape.rows, columns: shape.columns / factor), elements: elements)
    }

}

extension ComplexMatrix where Scalar == Float {
    
    public func upsampled(factor: Int = 2) -> ComplexMatrix {
        return ComplexMatrix(
            real: real.upsampled(factor: factor),
            imaginary: imaginary.upsampled(factor: factor)
        )
    }

    public func downsampled(factor: Int = 2, filter: [Scalar] = [1.0]) -> ComplexMatrix {
        return ComplexMatrix(
            real: real.downsampled(factor: factor, filter: filter),
            imaginary: imaginary.downsampled(factor: factor, filter: filter)
        )
    }

}

extension Matrix where Scalar == Double {
    
    public func upsampled(factor: Int = 2) -> Matrix {
        var elements = Matrix.zeros(shape: .init(rows: shape.count, columns: factor))
        elements[column: 0] = asColumn()
        return elements.reshaped(.init(rows: shape.rows, columns: shape.columns * factor))
    }

    public func downsampled(factor: Int = 2, filter: [Scalar] = [1.0]) -> Matrix {
        let coefficients = [Scalar](repeating: 1.0 / Scalar(factor), count: factor)
        let elements = vDSP.downsample(elements, decimationFactor: factor, filter: filter)
        return Matrix(shape: .init(rows: shape.rows, columns: shape.columns / factor), elements: elements)
    }

}

extension ComplexMatrix where Scalar == Double {
    
    public func upsampled(factor: Int = 2) -> ComplexMatrix {
        return ComplexMatrix(
            real: real.upsampled(factor: factor),
            imaginary: imaginary.upsampled(factor: factor)
        )
    }

    public func downsampled(factor: Int = 2, filter: [Scalar] = [1.0]) -> ComplexMatrix {
        return ComplexMatrix(
            real: real.downsampled(factor: factor, filter: filter),
            imaginary: imaginary.downsampled(factor: factor, filter: filter)
        )
    }

}
