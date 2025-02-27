//
//  FFT.swift
//  Plinth
//
//  Created by Daniel Clelland on 26/04/22.
//

import Foundation
import Accelerate

public enum FFT<Scalar> {
    
    public typealias Setup = OpaquePointer
    
}

extension FFT where Scalar == Float {
    
    public static func createSetup(shape: Shape) -> Setup {
        let log2N = vDSP_Length(log2(Scalar(shape.length)))
        return vDSP_create_fftsetup(log2N, FFTRadix(kFFTRadix2))!
    }
    
    public static func destroySetup(_ setup: Setup) {
        vDSP_destroy_fftsetup(setup)
    }
    
}

extension FFT where Scalar == Double {
    
    public static func createSetup(shape: Shape) -> Setup {
        let log2N = vDSP_Length(log2(Scalar(shape.length)))
        return vDSP_create_fftsetupD(log2N, FFTRadix(kFFTRadix2))!
    }
    
    public static func destroySetup(_ setup: Setup) {
        vDSP_destroy_fftsetupD(setup)
    }
    
}

extension FFTDirection {
    
    public static let forward = FFTDirection(kFFTDirection_Forward)
    
    public static let inverse = FFTDirection(kFFTDirection_Inverse)
    
}
