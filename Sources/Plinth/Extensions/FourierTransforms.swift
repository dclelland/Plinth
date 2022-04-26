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

extension Matrix where Scalar == Float {
    
    public func fft() -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft()
    }
    
    public func fft(setup: FFTSetup) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft(setup: setup)
    }
    
    public func ifft() -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).ifft()
    }
    
    public func ifft(setup: FFTSetup) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).ifft(setup: setup)
    }
    
}

extension Matrix where Scalar == Float {
    
    public func fftShifted() -> Matrix {
        return shifted(rows: shape.rows / 2, columns: shape.columns / 2)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func fft() -> ComplexMatrix {
        return fft(direction: .forward).fftShifted()
    }
    
    public func fft(setup: FFTSetup) -> ComplexMatrix {
        return fft(setup: setup, direction: .forward).fftShifted()
    }
    
    public func ifft() -> ComplexMatrix {
        return fftShifted().fft(direction: .inverse) / Scalar(shape.length)
    }
    
    public func ifft(setup: FFTSetup) -> ComplexMatrix {
        return fftShifted().fft(setup: setup, direction: .inverse) / Scalar(shape.length)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func fftShifted() -> ComplexMatrix {
        return ComplexMatrix(real: real.fftShifted(), imaginary: imaginary.fftShifted())
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func fft(direction: FFTDirection) -> ComplexMatrix {
        let log2N = vDSP_Length(log2(Double(shape.length)))
        let setup = vDSP_create_fftsetup(log2N, FFTRadix(kFFTRadix2))!
        let output = fft(setup: setup, direction: direction)
        vDSP_destroy_fftsetup(setup)
        return output
    }
    
    public func fft(setup: FFTSetup, direction: FFTDirection) -> ComplexMatrix {
        let log2N0 = vDSP_Length(log2(Double(shape.columns)))
        let log2N1 = vDSP_Length(log2(Double(shape.rows)))
        return fmap { inputVector in
            vDSP_fft2d_zip(setup, &inputVector, 1, 0, log2N0, log2N1, direction)
        }
    }
    
}

extension Matrix where Scalar == Double {
    
    public func fft() -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft()
    }
    
    public func fft(setup: FFTSetupD) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft(setup: setup)
    }
    
    public func ifft() -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).ifft()
    }
    
    public func ifft(setup: FFTSetupD) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).ifft(setup: setup)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func fftShifted() -> Matrix {
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
    
    public func fftShifted() -> ComplexMatrix {
        return ComplexMatrix(real: real.fftShifted(), imaginary: imaginary.fftShifted())
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func fft(direction: FFTDirection) -> ComplexMatrix {
        let log2N = vDSP_Length(log2(Double(shape.length)))
        let setup = vDSP_create_fftsetupD(log2N, FFTRadix(kFFTRadix2))!
        let output = fft(setup: setup, direction: direction)
        vDSP_destroy_fftsetupD(setup)
        return output
    }
    
    public func fft(setup: FFTSetupD, direction: FFTDirection) -> ComplexMatrix {
        let log2N0 = vDSP_Length(log2(Double(shape.columns)))
        let log2N1 = vDSP_Length(log2(Double(shape.rows)))
        return fmap { inputVector in
            vDSP_fft2d_zipD(setup, &inputVector, 1, 0, log2N0, log2N1, direction)
        }
    }
    
}
