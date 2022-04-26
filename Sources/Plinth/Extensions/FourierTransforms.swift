//
//  FourierTransforms.swift
//  Plinth
//
//  Created by Daniel Clelland on 26/04/22.
//

import Foundation
import Accelerate

extension FFTDirection {
    
    public static let forward = FFTDirection(kFFTDirection_Forward)
    
    public static let inverse = FFTDirection(kFFTDirection_Inverse)
    
}

extension ComplexMatrix {
    
    public func fftShifted() -> ComplexMatrix {
        return shifted(rows: shape.rows / 2, columns: shape.columns / 2)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func fft() -> ComplexMatrix {
        return fft(direction: .forward).fftShifted()
    }
    
    public func fft(setup: FFTSetupD) -> ComplexMatrix {
        return fft(setup: setup, direction: .forward).fftShifted()
    }
    
    public func ifft() -> ComplexMatrix {
        return fftShifted().fft(direction: .inverse) / Scalar(shape.length)
    }
    
    public func ifft(setup: FFTSetupD) -> ComplexMatrix {
        return fftShifted().fft(setup: setup, direction: .inverse) / Scalar(shape.length)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func fft(direction: FFTDirection) -> ComplexMatrix<Double> {
        let log2N = vDSP_Length(log2(Double(shape.length)))
        let setup = vDSP_create_fftsetupD(log2N, FFTRadix(kFFTRadix2))!
        let output = fft(setup: setup, direction: direction)
        vDSP_destroy_fftsetupD(setup)
        return output
    }
    
    public func fft(setup: FFTSetupD, direction: FFTDirection) -> ComplexMatrix<Double> {
        let log2N0 = vDSP_Length(log2(Double(shape.columns)))
        let log2N1 = vDSP_Length(log2(Double(shape.rows)))
        return fmap { inputVector in
            vDSP_fft2d_zipD(setup, &inputVector, 1, 0, log2N0, log2N1, direction)
        }
    }
    
}
