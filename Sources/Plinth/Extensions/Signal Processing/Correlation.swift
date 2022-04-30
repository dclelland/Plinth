//
//  Correlations.swift
//  Plinth
//
//  Created by Daniel Clelland on 26/04/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public func autocorrelated(setup: FFTSetup? = nil) -> ComplexMatrix<Scalar> {
        return fft(setup: setup).fmap(vDSP.squareMagnitudes).ifft(setup: setup) / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func autocorrelated(setup: FFTSetup? = nil) -> ComplexMatrix {
        return fft(setup: setup).fmap(vDSP.squareMagnitudes).ifft(setup: setup) / Scalar(shape.count)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func autocorrelated(setup: FFTSetupD? = nil) -> ComplexMatrix<Scalar> {
        return fft(setup: setup).fmap(vDSP.squareMagnitudes).ifft(setup: setup) / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func autocorrelated(setup: FFTSetupD? = nil) -> ComplexMatrix {
        return fft(setup: setup).fmap(vDSP.squareMagnitudes).ifft(setup: setup) / Scalar(shape.count)
    }
    
}
