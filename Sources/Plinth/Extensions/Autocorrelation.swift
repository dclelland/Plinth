//
//  Autocorrelation.swift
//  Plinth
//
//  Created by Daniel Clelland on 26/04/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public func autocorrelated() -> ComplexMatrix<Scalar> {
        return fft().fmap(vDSP.squareMagnitudes).ifft() / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func autocorrelated() -> ComplexMatrix {
        return fft().fmap(vDSP.squareMagnitudes).ifft() / Scalar(shape.count)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func autocorrelated() -> ComplexMatrix<Scalar> {
        return fft().fmap(vDSP.squareMagnitudes).ifft() / Scalar(shape.count)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func autocorrelated() -> ComplexMatrix {
        return fft().fmap(vDSP.squareMagnitudes).ifft() / Scalar(shape.count)
    }
    
}
