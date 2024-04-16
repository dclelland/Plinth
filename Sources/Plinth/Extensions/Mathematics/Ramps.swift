//
//  File.swift
//  
//
//  Created by Daniel Clelland on 15/04/24.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public static func xRamp(shape: Shape, range: ClosedRange<Scalar>) -> Matrix<Scalar> {
        let ramp = vDSP.ramp(in: range, count: shape.columns)
        let elements = Array([[Scalar]](repeating: ramp, count: shape.rows).joined())
        return Matrix(shape: shape, elements: elements)
    }
    
    public static func yRamp(shape: Shape, range: ClosedRange<Scalar>) -> Matrix<Scalar> {
        let ramp = vDSP.ramp(in: range, count: shape.rows)
        let elements = Array(ramp.map({ [Scalar](repeating: $0, count: shape.columns) }).joined())
        return Matrix(shape: shape, elements: elements)
    }
    
}

extension Matrix where Scalar == Float {
    
    public static func radiusRamp(shape: Shape, xRange: ClosedRange<Scalar> = -1.0...1.0, yRange: ClosedRange<Scalar> = -1.0...1.0) -> Matrix<Scalar> {
        let xRamp = xRamp(shape: shape, range: xRange)
        let yRamp = yRamp(shape: shape, range: yRange)
        return xRamp.hypot(yRamp)
    }
    
    public static func angleRamp(shape: Shape, xRange: ClosedRange<Scalar> = -1.0...1.0, yRange: ClosedRange<Scalar> = -1.0...1.0) -> Matrix<Scalar> {
        let xRamp = xRamp(shape: shape, range: xRange)
        let yRamp = yRamp(shape: shape, range: yRange)
        return xRamp.atan2(yRamp)
    }
    
}

extension Matrix where Scalar == Double {
    
    public static func xRamp(shape: Shape, range: ClosedRange<Scalar>) -> Matrix<Scalar> {
        let ramp = vDSP.ramp(in: range, count: shape.columns)
        let elements = Array([[Scalar]](repeating: ramp, count: shape.rows).joined())
        return Matrix(shape: shape, elements: elements)
    }
    
    public static func yRamp(shape: Shape, range: ClosedRange<Scalar>) -> Matrix<Scalar> {
        let ramp = vDSP.ramp(in: range, count: shape.rows)
        let elements = Array(ramp.map({ [Scalar](repeating: $0, count: shape.columns) }).joined())
        return Matrix(shape: shape, elements: elements)
    }
    
}

extension Matrix where Scalar == Double {
    
    public static func radiusRamp(shape: Shape, xRange: ClosedRange<Scalar> = -1.0...1.0, yRange: ClosedRange<Scalar> = -1.0...1.0) -> Matrix<Scalar> {
        let xRamp = xRamp(shape: shape, range: xRange)
        let yRamp = yRamp(shape: shape, range: yRange)
        return xRamp.hypot(yRamp)
    }
    
    public static func angleRamp(shape: Shape, xRange: ClosedRange<Scalar> = -1.0...1.0, yRange: ClosedRange<Scalar> = -1.0...1.0) -> Matrix<Scalar> {
        let xRamp = xRamp(shape: shape, range: xRange)
        let yRamp = yRamp(shape: shape, range: yRange)
        return xRamp.atan2(yRamp)
    }
    
}
