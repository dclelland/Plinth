//
//  FFT1D.swift
//  Plinth
//
//  Created by Daniel Clelland on 27/02/2025.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public func fft1D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft1D(setup: setup)
    }
    
    public func ifft1D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).ifft1D(setup: setup)
    }
    
}

extension Matrix where Scalar == Float {
    
    public func fft1D(direction: FFTDirection, setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft1D(direction: direction, setup: setup)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func fft1D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        return fft1D(direction: .forward, setup: setup)
    }
    
    public func ifft1D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        return fft1D(direction: .inverse, setup: setup) / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func fft1D(direction: FFTDirection, setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        switch setup {
        case .none:
            return fft1D(direction: direction)
        case .some(let setup):
            return fft1D(direction: direction, setup: setup)
        }
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    private func fft1D(direction: FFTDirection) -> ComplexMatrix {
        let setup = FFT<Scalar>.createSetup(shape: shape)
        let output = fft1D(direction: direction, setup: setup)
        FFT<Scalar>.destroySetup(setup)
        return output
    }
    
    private func fft1D(direction: FFTDirection, setup: FFT<Scalar>.Setup) -> ComplexMatrix {
        let log2N = vDSP_Length(log2(Scalar(shape.length)))
        return fmap { inputVector in
            vDSP_fft_zip(setup, &inputVector, 1, log2N, direction)
        }
    }
    
}

extension Matrix where Scalar == Double {
    
    public func fft1D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft1D(setup: setup)
    }
    
    public func ifft1D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).ifft1D(setup: setup)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func fft1D(direction: FFTDirection, setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        return ComplexMatrix(real: self).fft1D(direction: direction, setup: setup)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func fft1D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        return fft1D(direction: .forward, setup: setup)
    }
    
    public func ifft1D(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        return fft1D(direction: .inverse, setup: setup) / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func fft1D(direction: FFTDirection, setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        switch setup {
        case .none:
            return fft1D(direction: direction)
        case .some(let setup):
            return fft1D(direction: direction, setup: setup)
        }
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    private func fft1D(direction: FFTDirection) -> ComplexMatrix {
        let setup = FFT<Scalar>.createSetup(shape: shape)
        let output = fft1D(direction: direction, setup: setup)
        FFT<Scalar>.destroySetup(setup)
        return output
    }
    
    private func fft1D(direction: FFTDirection, setup: FFT<Scalar>.Setup) -> ComplexMatrix {
        let log2N = vDSP_Length(log2(Scalar(shape.length)))
        return fmap { inputVector in
            vDSP_fft_zipD(setup, &inputVector, 1, log2N, direction)
        }
    }
    
}
