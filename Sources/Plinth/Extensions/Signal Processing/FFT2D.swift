//
//  FFT2D.swift
//  Plinth
//
//  Created by Daniel Clelland on 27/02/2025.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public func fft2D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft2D(setup: setup)
    }
    
    public func ifft2D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).ifft2D(setup: setup)
    }
    
}

extension Matrix where Scalar == Float {
    
    public func fft2D(direction: FFTDirection, setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft2D(direction: direction, setup: setup)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func fft2D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        return fft2D(direction: .forward, setup: setup)
    }
    
    public func ifft2D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        return fft2D(direction: .inverse, setup: setup) / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func fft2D(direction: FFTDirection, setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        switch setup {
        case .none:
            return fft2D(direction: direction)
        case .some(let setup):
            return fft2D(direction: direction, setup: setup)
        }
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    private func fft2D(direction: FFTDirection) -> ComplexMatrix {
        let setup = FFT<Scalar>.createSetup(shape: shape)
        let output = fft2D(direction: direction, setup: setup)
        FFT<Scalar>.destroySetup(setup)
        return output
    }
    
    private func fft2D(direction: FFTDirection, setup: FFT<Scalar>.Setup) -> ComplexMatrix {
        let log2N0 = vDSP_Length(log2(Scalar(shape.columns)))
        let log2N1 = vDSP_Length(log2(Scalar(shape.rows)))
        return fmap { inputVector in
            vDSP_fft2d_zip(setup, &inputVector, 1, 0, log2N0, log2N1, direction)
        }
    }
    
}

extension Matrix where Scalar == Double {
    
    public func fft2D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft2D(setup: setup)
    }
    
    public func ifft2D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).ifft2D(setup: setup)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func fft2D(direction: FFTDirection, setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft2D(direction: direction, setup: setup)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func fft2D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        return fft2D(direction: .forward, setup: setup)
    }
    
    public func ifft2D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        return fft2D(direction: .inverse, setup: setup) / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func fft2D(direction: FFTDirection, setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        switch setup {
        case .none:
            return fft2D(direction: direction)
        case .some(let setup):
            return fft2D(direction: direction, setup: setup)
        }
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    private func fft2D(direction: FFTDirection) -> ComplexMatrix {
        let setup = FFT<Scalar>.createSetup(shape: shape)
        let output = fft2D(direction: direction, setup: setup)
        FFT<Scalar>.destroySetup(setup)
        return output
    }
    
    private func fft2D(direction: FFTDirection, setup: FFT<Scalar>.Setup) -> ComplexMatrix {
        let log2N0 = vDSP_Length(log2(Scalar(shape.columns)))
        let log2N1 = vDSP_Length(log2(Scalar(shape.rows)))
        return fmap { inputVector in
            vDSP_fft2d_zipD(setup, &inputVector, 1, 0, log2N0, log2N1, direction)
        }
    }
    
}
