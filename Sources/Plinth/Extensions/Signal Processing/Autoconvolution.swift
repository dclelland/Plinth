//
//  Autoconvolution.swift
//  Plinth
//
//  Created by Daniel Clelland on 28/08/24.
//

import Foundation

extension Matrix where Scalar == Float {
    
    public func autoconvolved(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        let frequencies = fft(setup: setup)
        let convolved = frequencies * frequencies
        return convolved.ifft(setup: setup) / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func autoconvolved(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        let frequencies = fft(setup: setup)
        let convolved = frequencies * frequencies
        return convolved.ifft(setup: setup) / Scalar(shape.count)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func autoconvolved(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        let frequencies = fft(setup: setup)
        let convolved = frequencies * frequencies
        return convolved.ifft(setup: setup) / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func autoconvolved(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        let frequencies = fft(setup: setup)
        let convolved = frequencies * frequencies
        return convolved.ifft(setup: setup) / Scalar(shape.count)
    }
    
}
