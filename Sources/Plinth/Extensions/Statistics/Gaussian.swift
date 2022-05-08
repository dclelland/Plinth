//
//  Gaussian.swift
//  Plinth
//
//  Created by Daniel Clelland on 3/05/22.
//

import Foundation

extension Float {
    
    internal static func gaussian() -> Self {
        var generator = SystemRandomNumberGenerator()
        return gaussian(using: &generator)
    }
    
    internal static func gaussian<T>(using generator: inout T) -> Self where T: RandomNumberGenerator {
        var s: Self = 0.0
        var x: Self = 0.0
        var y: Self = 0.0
        while true {
            x = .random(in: -1.0...1.0, using: &generator)
            y = .random(in: -1.0...1.0, using: &generator)
            s = x * x + y * y
            if s < 1.0 { break }
        }
        return x * (-2.0 * log(s) / s).squareRoot()
    }
    
}

extension Matrix where Scalar == Float {
    
    public static func gaussian(shape: Shape, mean: Scalar = 0.0, standardDeviation: Scalar = 1.0) -> Matrix {
        return .init(shape: shape, Scalar.gaussian()) * standardDeviation + mean
    }
    
    public static func gaussian<T>(shape: Shape, mean: Scalar = 0.0, standardDeviation: Scalar = 1.0, using generator: inout T) -> Matrix where T: RandomNumberGenerator {
        return .init(shape: shape, Scalar.gaussian(using: &generator)) * standardDeviation + mean
    }
    
}

extension Double {
    
    internal static func gaussian() -> Self {
        var generator = SystemRandomNumberGenerator()
        return gaussian(using: &generator)
    }
    
    internal static func gaussian<T>(using generator: inout T) -> Self where T: RandomNumberGenerator {
        var s: Self = 0.0
        var x: Self = 0.0
        var y: Self = 0.0
        while true {
            x = .random(in: -1.0...1.0, using: &generator)
            y = .random(in: -1.0...1.0, using: &generator)
            s = x * x + y * y
            if s < 1.0 { break }
        }
        return x * (-2.0 * log(s) / s).squareRoot()
    }
    
}

extension Matrix where Scalar == Double {
    
    public static func gaussian(shape: Shape, mean: Scalar = 0.0, standardDeviation: Scalar = 1.0) -> Matrix {
        return .init(shape: shape, Scalar.gaussian()) * standardDeviation + mean
    }
    
    public static func gaussian<T>(shape: Shape, mean: Scalar = 0.0, standardDeviation: Scalar = 1.0, using generator: inout T) -> Matrix where T: RandomNumberGenerator {
        return .init(shape: shape, Scalar.gaussian(using: &generator)) * standardDeviation + mean
    }
    
}
