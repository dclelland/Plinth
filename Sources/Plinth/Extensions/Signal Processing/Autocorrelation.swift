//
//  Autocorrelation.swift
//  Plinth
//
//  Created by Daniel Clelland on 26/04/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public func autocorrelated(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        return fft(setup: setup).squareMagnitudes().ifft(setup: setup) / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func autocorrelated(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        return fft(setup: setup).squareMagnitudes().ifft(setup: setup) / Scalar(shape.count)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func autocorrelated(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        return fft(setup: setup).squareMagnitudes().ifft(setup: setup) / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func autocorrelated(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix {
        return fft(setup: setup).squareMagnitudes().ifft(setup: setup) / Scalar(shape.count)
    }
    
}
