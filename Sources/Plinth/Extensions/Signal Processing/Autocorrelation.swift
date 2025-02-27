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
        let frequencies = fft2D(setup: setup)
        let correlated = frequencies * frequencies.conjugate()
        return correlated.ifft2D(setup: setup) / Scalar(shape.count)
    }
    
    public func magnitudeAutocorrelated(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        let frequencies = fft2D(setup: setup)
        let correlated = frequencies * frequencies.absolute()
        return correlated.ifft2D(setup: setup) / Scalar(shape.count)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func autocorrelated(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        let frequencies = fft2D(setup: setup)
        let correlated = frequencies * frequencies.conjugate()
        return correlated.ifft2D(setup: setup) / Scalar(shape.count)
    }
    
    public func magnitudeAutocorrelated(setup: FFT<Scalar>.Setup? = nil) -> ComplexMatrix<Scalar> {
        let frequencies = fft2D(setup: setup)
        let correlated = frequencies * frequencies.absolute()
        return correlated.ifft2D(setup: setup) / Scalar(shape.count)
    }
    
}
