//
//  Normalization.swift
//  Plinth
//
//  Created by Daniel Clelland on 5/05/22.
//

import Foundation

extension Matrix where Scalar == Float {
    
    public func normalized() -> Matrix {
        return inverseLinearInterpolated(from: minimum()...maximum())
    }
    
    public func normalized(to destination: ClosedRange<Scalar>) -> Matrix {
        return inverseLinearInterpolated(from: minimum()...maximum()).linearInterpolated(to: destination)
    }
    
    public func normalized(from origin: ClosedRange<Scalar>) -> Matrix {
        return inverseLinearInterpolated(from: origin)
    }
    
    public func normalized(from origin: ClosedRange<Scalar>, to destination: ClosedRange<Scalar>) -> Matrix {
        return inverseLinearInterpolated(from: origin).linearInterpolated(to: destination)
    }
    
}

extension Matrix where Scalar == Float {
    
    public func meanNormalized() -> Matrix {
        return meanNormalized(mean: mean())
    }
    
    public func meanNormalized(mean: Scalar) -> Matrix {
        return self - mean
    }
    
}

extension Matrix where Scalar == Double {
    
    public func normalized() -> Matrix {
        return inverseLinearInterpolated(from: minimum()...maximum())
    }
    
    public func normalized(to destination: ClosedRange<Scalar>) -> Matrix {
        return inverseLinearInterpolated(from: minimum()...maximum()).linearInterpolated(to: destination)
    }
    
    public func normalized(from origin: ClosedRange<Scalar>) -> Matrix {
        return inverseLinearInterpolated(from: origin)
    }
    
    public func normalized(from origin: ClosedRange<Scalar>, to destination: ClosedRange<Scalar>) -> Matrix {
        return inverseLinearInterpolated(from: origin).linearInterpolated(to: destination)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func meanNormalized() -> Matrix {
        return meanNormalized(mean: mean())
    }
    
    public func meanNormalized(mean: Scalar) -> Matrix {
        return self - mean
    }
    
}
