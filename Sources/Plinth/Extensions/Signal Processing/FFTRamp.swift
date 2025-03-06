//
//  FFTRamp.swift
//  Plinth
//
//  Created by Daniel Clelland on 28/08/24.
//

import Foundation

extension Matrix where Scalar == Float {
    
    public static func centeredXRamp(shape: Shape) -> Matrix {
        let width = shape.columns / 2
        let range = Scalar(-width)...Scalar(width - 1)
        return Matrix.xRamp(shape: shape, range: range)
    }
    
    public static func centeredYRamp(shape: Shape) -> Matrix {
        let height = shape.rows / 2
        let range = Scalar(-height)...Scalar(height - 1)
        return Matrix.yRamp(shape: shape, range: range)
    }
    
}

extension Matrix where Scalar == Float {
    
    public static func fftXRamp(shape: Shape) -> Matrix {
        return centeredXRamp(shape: shape).fftShifted()
    }
    
    public static func fftYRamp(shape: Shape) -> Matrix {
        return centeredYRamp(shape: shape).fftShifted()
    }
    
}

extension Matrix where Scalar == Float {
    
    public static func fftRadiusRamp(shape: Shape) -> Matrix {
        let xRamp = Matrix.fftXRamp(shape: shape)
        let yRamp = Matrix.fftYRamp(shape: shape)
        return xRamp.hypot(yRamp)
    }
    
    public static func fftAngleRamp(shape: Shape) -> Matrix {
        let xRamp = Matrix.fftXRamp(shape: shape)
        let yRamp = Matrix.fftYRamp(shape: shape)
        return xRamp.atan2(yRamp)
    }
    
}

extension Matrix where Scalar == Double {
    
    public static func centeredXRamp(shape: Shape) -> Matrix {
        let width = shape.columns / 2
        let range = Scalar(-width)...Scalar(width - 1)
        return Matrix.xRamp(shape: shape, range: range)
    }
    
    public static func centeredYRamp(shape: Shape) -> Matrix {
        let height = shape.rows / 2
        let range = Scalar(-height)...Scalar(height - 1)
        return Matrix.yRamp(shape: shape, range: range)
    }
    
}

extension Matrix where Scalar == Double {
    
    public static func fftXRamp(shape: Shape) -> Matrix {
        return centeredXRamp(shape: shape).fftShifted()
    }
    
    public static func fftYRamp(shape: Shape) -> Matrix {
        return centeredYRamp(shape: shape).fftShifted()
    }
    
}

extension Matrix where Scalar == Double {
    
    public static func fftRadiusRamp(shape: Shape) -> Matrix {
        let xRamp = Matrix.fftXRamp(shape: shape)
        let yRamp = Matrix.fftYRamp(shape: shape)
        return xRamp.hypot(yRamp)
    }
    
    public static func fftAngleRamp(shape: Shape) -> Matrix {
        let xRamp = Matrix.fftXRamp(shape: shape)
        let yRamp = Matrix.fftYRamp(shape: shape)
        return xRamp.atan2(yRamp)
    }
    
}
