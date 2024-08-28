//
//  Convolutions.swift
//  Plinth
//
//  Created by Daniel Clelland on 27/08/24.
//

import Plinth
import Accelerate

public enum ConvolutionFilter<Scalar> { }

extension ConvolutionFilter where Scalar == Float {
    
    public static let blur3x3: Matrix = [
        [1.0, 2.0, 1.0],
        [2.0, 4.0, 2.0],
        [1.0, 2.0, 1.0]
    ] / 16.0
    
    public static let blur5x5: Matrix = [
        [1.0, 4.0, 6.0, 4.0, 1.0],
        [4.0, 16.0, 24.0, 16.0, 4.0],
        [6.0, 24.0, 36.0, 24.0, 6.0],
        [4.0, 16.0, 24.0, 16.0, 4.0],
        [1.0, 4.0, 6.0, 4.0, 1.0]
    ] / 256.0
    
    public static let sharpen3x3: Matrix = [
        [0.0, -1.0, 0.0],
        [-1.0, 5.0, -1.0],
        [0.0, -1.0, 0.0]
    ]
    
    public static let sharpen5x5: Matrix = [
        [1.0, 4.0, 6.0, 4.0, 1.0],
        [4.0, 16.0, 24.0, 16.0, 4.0],
        [6.0, 24.0, -476.0, 24.0, 6.0],
        [4.0, 16.0, 24.0, 16.0, 4.0],
        [1.0, 4.0, 6.0, 4.0, 1.0]
    ] / -256.0
    
}

extension Matrix where Scalar == Float {
    
    public func convolve3x3(filter: Matrix) -> Matrix {
        let input = self
        var output: Matrix = .zeros(shape: shape)
        input.withUnsafeBufferPointer { inputVector in
            output.withUnsafeMutableBufferPointer { outputVector in
                filter.withUnsafeBufferPointer { filterVector in
                    vDSP_f3x3(inputVector.baseAddress!, vDSP_Length(shape.rows), vDSP_Length(shape.columns), filterVector.baseAddress!, outputVector.baseAddress!)
                }
            }
        }
        return output
    }
    
    public func convolve5x5(filter: Matrix) -> Matrix {
        let input = self
        var output: Matrix = .zeros(shape: shape)
        input.withUnsafeBufferPointer { inputVector in
            output.withUnsafeMutableBufferPointer { outputVector in
                filter.withUnsafeBufferPointer { filterVector in
                    vDSP_f5x5(inputVector.baseAddress!, vDSP_Length(shape.rows), vDSP_Length(shape.columns), filterVector.baseAddress!, outputVector.baseAddress!)
                }
            }
        }
        return output
    }
    
    public func convolve(filter: Matrix) -> Matrix {
        let input = self
        var output: Matrix = .zeros(shape: shape)
        input.withUnsafeBufferPointer { inputVector in
            output.withUnsafeMutableBufferPointer { outputVector in
                filter.withUnsafeBufferPointer { filterVector in
                    vDSP_imgfir(inputVector.baseAddress!, vDSP_Length(shape.rows), vDSP_Length(shape.columns), filterVector.baseAddress!, outputVector.baseAddress!, vDSP_Length(filter.shape.rows), vDSP_Length(filter.shape.columns))
                }
            }
        }
        return output
    }
    
}

extension ConvolutionFilter where Scalar == Double {
    
    public static let blur3x3: Matrix = [
        [1.0, 2.0, 1.0],
        [2.0, 4.0, 2.0],
        [1.0, 2.0, 1.0]
    ] / 16.0
    
    public static let blur5x5: Matrix = [
        [1.0, 4.0, 6.0, 4.0, 1.0],
        [4.0, 16.0, 24.0, 16.0, 4.0],
        [6.0, 24.0, 36.0, 24.0, 6.0],
        [4.0, 16.0, 24.0, 16.0, 4.0],
        [1.0, 4.0, 6.0, 4.0, 1.0]
    ] / 256.0
    
    public static let sharpen3x3: Matrix = [
        [0.0, -1.0, 0.0],
        [-1.0, 5.0, -1.0],
        [0.0, -1.0, 0.0]
    ]
    
    public static let sharpen5x5: Matrix = [
        [1.0, 4.0, 6.0, 4.0, 1.0],
        [4.0, 16.0, 24.0, 16.0, 4.0],
        [6.0, 24.0, -476.0, 24.0, 6.0],
        [4.0, 16.0, 24.0, 16.0, 4.0],
        [1.0, 4.0, 6.0, 4.0, 1.0]
    ] / -256.0
    
}

extension Matrix where Scalar == Double {
    
    public func convolve3x3(filter: Matrix) -> Matrix {
        let input = self
        var output: Matrix = .zeros(shape: shape)
        input.withUnsafeBufferPointer { inputVector in
            output.withUnsafeMutableBufferPointer { outputVector in
                filter.withUnsafeBufferPointer { filterVector in
                    vDSP_f3x3D(inputVector.baseAddress!, vDSP_Length(shape.rows), vDSP_Length(shape.columns), filterVector.baseAddress!, outputVector.baseAddress!)
                }
            }
        }
        return output
    }
    
    public func convolve5x5(filter: Matrix) -> Matrix {
        let input = self
        var output: Matrix = .zeros(shape: shape)
        input.withUnsafeBufferPointer { inputVector in
            output.withUnsafeMutableBufferPointer { outputVector in
                filter.withUnsafeBufferPointer { filterVector in
                    vDSP_f5x5D(inputVector.baseAddress!, vDSP_Length(shape.rows), vDSP_Length(shape.columns), filterVector.baseAddress!, outputVector.baseAddress!)
                }
            }
        }
        return output
    }
    
    public func convolve(filter: Matrix) -> Matrix {
        let input = self
        var output: Matrix = .zeros(shape: shape)
        input.withUnsafeBufferPointer { inputVector in
            output.withUnsafeMutableBufferPointer { outputVector in
                filter.withUnsafeBufferPointer { filterVector in
                    vDSP_imgfirD(inputVector.baseAddress!, vDSP_Length(shape.rows), vDSP_Length(shape.columns), filterVector.baseAddress!, outputVector.baseAddress!, vDSP_Length(filter.shape.rows), vDSP_Length(filter.shape.columns))
                }
            }
        }
        return output
    }
    
}
