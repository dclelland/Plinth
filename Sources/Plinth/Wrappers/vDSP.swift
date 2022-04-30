//
//  vDSP.swift
//  Plinth
//
//  Created by Daniel Clelland on 30/04/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public func minimum() -> Scalar {
        return fmap(vDSP.minimum)
    }
    
    public func maximum() -> Scalar {
        return fmap(vDSP.maximum)
    }
    
    public func maximumMagnitude() -> Scalar {
        return fmap(vDSP.maximumMagnitude)
    }
    
    public func sum() -> Scalar {
        return fmap(vDSP.sum)
    }
    
    public func sumOfSquares() -> Scalar {
        return fmap(vDSP.sumOfSquares)
    }
    
    public func sumAndSumOfSquares() -> (elementsSum: Scalar, squaresSum: Scalar) {
        return fmap(vDSP.sumAndSumOfSquares)
    }
    
    public func sumOfMagnitudes() -> Scalar {
        return fmap(vDSP.sumOfMagnitudes)
    }
    
}

extension Matrix where Scalar == Float {
    
    public func indexOfMinimum() -> (UInt, Scalar) {
        return fmap(vDSP.indexOfMinimum)
    }
    
    public func indexOfMaximum() -> (UInt, Scalar) {
        return fmap(vDSP.indexOfMaximum)
    }
    
    public func indexOfMaximumMagnitude() -> (UInt, Scalar) {
        return fmap(vDSP.indexOfMaximumMagnitude)
    }
    
}

extension Matrix where Scalar == Float {
    
    public func mean() -> Scalar {
        return fmap(vDSP.mean)
    }
    
    public func meanMagnitude() -> Scalar {
        return fmap(vDSP.meanMagnitude)
    }
    
    public func meanSquare() -> Scalar {
        return fmap(vDSP.meanSquare)
    }
    
    public func rootMeanSquare() -> Scalar {
        return fmap(vDSP.rootMeanSquare)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func minimum() -> Scalar {
        return fmap(vDSP.minimum)
    }
    
    public func maximum() -> Scalar {
        return fmap(vDSP.maximum)
    }
    
    public func maximumMagnitude() -> Scalar {
        return fmap(vDSP.maximumMagnitude)
    }
    
    public func sum() -> Scalar {
        return fmap(vDSP.sum)
    }
    
    public func sumOfSquares() -> Scalar {
        return fmap(vDSP.sumOfSquares)
    }
    
    public func sumAndSumOfSquares() -> (elementsSum: Scalar, squaresSum: Scalar) {
        return fmap(vDSP.sumAndSumOfSquares)
    }
    
    public func sumOfMagnitudes() -> Scalar {
        return fmap(vDSP.sumOfMagnitudes)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func indexOfMinimum() -> (UInt, Scalar) {
        return fmap(vDSP.indexOfMinimum)
    }
    
    public func indexOfMaximum() -> (UInt, Scalar) {
        return fmap(vDSP.indexOfMaximum)
    }
    
    public func indexOfMaximumMagnitude() -> (UInt, Scalar) {
        return fmap(vDSP.indexOfMaximumMagnitude)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func mean() -> Scalar {
        return fmap(vDSP.mean)
    }
    
    public func meanMagnitude() -> Scalar {
        return fmap(vDSP.meanMagnitude)
    }
    
    public func meanSquare() -> Scalar {
        return fmap(vDSP.meanSquare)
    }
    
    public func rootMeanSquare() -> Scalar {
        return fmap(vDSP.rootMeanSquare)
    }
    
}
