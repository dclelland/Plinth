//
//  File.swift
//  Plinth
//
//  Created by June Russell on 10/03/2025.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public func convolve1D(filter: [Element]) -> Matrix {
        let input = self
        var output: Matrix = .zeros(shape: shape)
        input.withUnsafeBufferPointer { inputVector in
            output.withUnsafeMutableBufferPointer { outputVector in
                filter.withUnsafeBufferPointer { filterVector in
                    vDSP_conv(inputVector.baseAddress!, vDSP_Stride(1), filterVector.baseAddress!, vDSP_Stride(1), outputVector.baseAddress!, vDSP_Stride(1), vDSP_Length(shape.count), vDSP_Length(filter.count))
                }
            }
        }
        return output
    }
    
}

extension Matrix where Scalar == Double {
    
    public func convolve1D(filter: [Element]) -> Matrix {
        let input = self
        var output: Matrix = .zeros(shape: shape)
        input.withUnsafeBufferPointer { inputVector in
            output.withUnsafeMutableBufferPointer { outputVector in
                filter.withUnsafeBufferPointer { filterVector in
                    vDSP_convD(inputVector.baseAddress!, vDSP_Stride(1), filterVector.baseAddress!, vDSP_Stride(1), outputVector.baseAddress!, vDSP_Stride(1), vDSP_Length(shape.count), vDSP_Length(filter.count))
                }
            }
        }
        return output
    }
    
}
