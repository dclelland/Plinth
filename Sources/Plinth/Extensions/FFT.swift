//
//  FFT.swift
//  Plinth
//
//  Created by Daniel Clelland on 26/04/22.
//

import Foundation
import Accelerate

public func createFFTSetup(shape: Shape) -> FFTSetup {
    let log2N = vDSP_Length(log2(Float(shape.length)))
    return vDSP_create_fftsetup(log2N, FFTRadix(kFFTRadix2))!
}

public func destroyFFTSetup(_ setup: FFTSetup) {
    vDSP_destroy_fftsetup(setup)
}

public func createFFTSetupD(shape: Shape) -> FFTSetupD {
    let log2N = vDSP_Length(log2(Double(shape.length)))
    return vDSP_create_fftsetupD(log2N, FFTRadix(kFFTRadix2))!
}
    
public func destroyFFTSetupD(_ setup: FFTSetupD) {
    vDSP_destroy_fftsetupD(setup)
}

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
    
    public func fft(direction: FFTDirection) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft(direction: direction)
    }
    
    public func fft(setup: FFTSetup, direction: FFTDirection) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft(setup: setup, direction: direction)
    }
    
}

extension Matrix where Scalar == Float {
    
    public func fftShifted() -> Matrix {
        return shifted(rows: shape.rows / 2, columns: shape.columns / 2)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func fft() -> ComplexMatrix {
        return fft(direction: .forward)
    }
    
    public func fft(setup: FFTSetup) -> ComplexMatrix {
        return fft(setup: setup, direction: .forward)
    }
    
    public func ifft() -> ComplexMatrix {
        return fft(direction: .inverse) / Scalar(shape.count)
    }
    
    public func ifft(setup: FFTSetup) -> ComplexMatrix {
        return fft(setup: setup, direction: .inverse) / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func fft(direction: FFTDirection) -> ComplexMatrix {
        let setup = createFFTSetup(shape: shape)
        let output = fft(setup: setup, direction: direction)
        destroyFFTSetup(setup)
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

extension ComplexMatrix where Scalar == Float {
    
    public func fftShifted() -> ComplexMatrix {
        return ComplexMatrix(real: real.fftShifted(), imaginary: imaginary.fftShifted())
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
    
    public func fft(direction: FFTDirection) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft(direction: direction)
    }
    
    public func fft(setup: FFTSetupD, direction: FFTDirection) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft(setup: setup, direction: direction)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func fftShifted() -> Matrix {
        return shifted(rows: shape.rows / 2, columns: shape.columns / 2)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func fft() -> ComplexMatrix {
        return fft(direction: .forward)
    }
    
    public func fft(setup: FFTSetupD) -> ComplexMatrix {
        return fft(setup: setup, direction: .forward)
    }
    
    public func ifft() -> ComplexMatrix {
        return fft(direction: .inverse) / Scalar(shape.count)
    }
    
    public func ifft(setup: FFTSetupD) -> ComplexMatrix {
        return fft(setup: setup, direction: .inverse) / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func fft(direction: FFTDirection) -> ComplexMatrix {
        let setup = createFFTSetupD(shape: shape)
        let output = fft(setup: setup, direction: direction)
        destroyFFTSetupD(setup)
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

extension ComplexMatrix where Scalar == Double {
    
    public func fftShifted() -> ComplexMatrix {
        return ComplexMatrix(real: real.fftShifted(), imaginary: imaginary.fftShifted())
    }
    
}
