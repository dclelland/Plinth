//
//  Interpolation.swift
//  Plinth
//
//  Created by Daniel Clelland on 5/05/22.
//

import Foundation

extension Matrix where Scalar == Float {
    
    public func linearInterpolated(to destination: ClosedRange<Scalar>) -> Matrix {
        return self * (destination.upperBound - destination.lowerBound) + destination.lowerBound
    }
    
    public func inverseLinearInterpolated(from origin: ClosedRange<Scalar>) -> Matrix {
        guard origin.isEmpty == false else {
            return .init(shape: shape, repeating: origin.lowerBound)
        }
        
        return (self - origin.lowerBound) / (origin.upperBound - origin.lowerBound)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func linearInterpolated(to destination: ClosedRange<Scalar>) -> Matrix {
        return self * (destination.upperBound - destination.lowerBound) + destination.lowerBound
    }
    
    public func inverseLinearInterpolated(from origin: ClosedRange<Scalar>) -> Matrix {
        guard origin.lowerBound != origin.upperBound else {
            return .init(shape: shape, repeating: origin.lowerBound)
        }
        
        return (self - origin.lowerBound) / (origin.upperBound - origin.lowerBound)
    }
    
}
