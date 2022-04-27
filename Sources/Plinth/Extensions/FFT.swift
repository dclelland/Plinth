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
    
    public func fft(setup: FFTSetup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft(setup: setup)
    }
    
    public func ifft(setup: FFTSetup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).ifft(setup: setup)
    }
    
}

extension Matrix where Scalar == Float {
    
    public func fft(direction: FFTDirection, setup: FFTSetup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft(direction: direction, setup: setup)
    }
    
}

extension Matrix where Scalar == Float {
    
    public func fftShifted() -> Matrix {
        return shifted(rows: shape.rows / 2, columns: shape.columns / 2)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func fft(setup: FFTSetup? = nil) -> ComplexMatrix {
        return fft(direction: .forward, setup: setup)
    }
    
    public func ifft(setup: FFTSetup? = nil) -> ComplexMatrix {
        return fft(direction: .inverse, setup: setup) / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func fft(direction: FFTDirection, setup: FFTSetup? = nil) -> ComplexMatrix {
        switch setup {
        case .none:
            return fft(direction: direction)
        case .some(let setup):
            return fft(direction: direction, setup: setup)
        }
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    private func fft(direction: FFTDirection) -> ComplexMatrix {
        let setup = createFFTSetup(shape: shape)
        let output = fft(direction: direction, setup: setup)
        destroyFFTSetup(setup)
        return output
    }
    
    private func fft(direction: FFTDirection, setup: FFTSetupD) -> ComplexMatrix {
        let log2N0 = vDSP_Length(log2(Scalar(shape.columns)))
        let log2N1 = vDSP_Length(log2(Scalar(shape.rows)))
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
    
    public func fft(setup: FFTSetupD? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft(setup: setup)
    }
    
    public func ifft(setup: FFTSetupD? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).ifft(setup: setup)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func fft(direction: FFTDirection, setup: FFTSetupD? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft(direction: direction, setup: setup)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func fftShifted() -> Matrix {
        return shifted(rows: shape.rows / 2, columns: shape.columns / 2)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func fft(setup: FFTSetupD? = nil) -> ComplexMatrix {
        return fft(direction: .forward, setup: setup)
    }
    
    public func ifft(setup: FFTSetupD? = nil) -> ComplexMatrix {
        return fft(direction: .inverse, setup: setup) / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func fft(direction: FFTDirection, setup: FFTSetupD? = nil) -> ComplexMatrix {
        switch setup {
        case .none:
            return fft(direction: direction)
        case .some(let setup):
            return fft(direction: direction, setup: setup)
        }
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    private func fft(direction: FFTDirection) -> ComplexMatrix {
        let setup = createFFTSetupD(shape: shape)
        let output = fft(direction: direction, setup: setup)
        destroyFFTSetupD(setup)
        return output
    }
    
    private func fft(direction: FFTDirection, setup: FFTSetupD) -> ComplexMatrix {
        let log2N0 = vDSP_Length(log2(Scalar(shape.columns)))
        let log2N1 = vDSP_Length(log2(Scalar(shape.rows)))
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
