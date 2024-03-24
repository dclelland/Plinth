//
//  Interpolation.swift
//  Plinth
//
//  Created by Daniel Clelland on 5/05/22.
//

import Foundation

extension Matrix where Scalar == Float {
    
    public func linearInterpolated(to y0: Scalar, _ y1: Scalar) -> Matrix {
        return self * (y1 - y0) + y0
    }
    
    public func inverseLinearInterpolated(from x0: Scalar, _ x1: Scalar) -> Matrix {
        guard x0 != x1 else {
            return .init(shape: shape, repeating: x0)
        }
        
        return (self - x0) / (x1 - x0)
    }
    
}

extension Matrix where Scalar == Float {
    
    public func linearInterpolated(to destination: ClosedRange<Scalar>) -> Matrix {
        return linearInterpolated(to: destination.lowerBound, destination.upperBound)
    }
    
    public func inverseLinearInterpolated(from origin: ClosedRange<Scalar>) -> Matrix {
        return inverseLinearInterpolated(from: origin.lowerBound, origin.upperBound)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func linearInterpolated(to y0: Scalar, _ y1: Scalar) -> Matrix {
        return self * (y1 - y0) + y0
    }
    
    public func inverseLinearInterpolated(from x0: Scalar, _ x1: Scalar) -> Matrix {
        guard x0 != x1 else {
            return .init(shape: shape, repeating: x0)
        }
        
        return (self - x0) / (x1 - x0)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func linearInterpolated(to destination: ClosedRange<Scalar>) -> Matrix {
        return linearInterpolated(to: destination.lowerBound, destination.upperBound)
    }
    
    public func inverseLinearInterpolated(from origin: ClosedRange<Scalar>) -> Matrix {
        return inverseLinearInterpolated(from: origin.lowerBound, origin.upperBound)
    }
    
}
