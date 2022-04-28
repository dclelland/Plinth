//
//  Statistics.swift
//  Plinth
//
//  Created by Daniel Clelland on 13/04/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public var minimum: Scalar {
        return fmap(vDSP.minimum)
    }
    
    public var maximum: Scalar {
        return fmap(vDSP.maximum)
    }
    
    public var maximumMagnitude: Scalar {
        return fmap(vDSP.maximumMagnitude)
    }
    
    public var sum: Scalar {
        return fmap(vDSP.sum)
    }
    
    public var sumOfSquares: Scalar {
        return fmap(vDSP.sumOfSquares)
    }
    
    public var sumAndSumOfSquares: (elementsSum: Scalar, squaresSum: Scalar) {
        return fmap(vDSP.sumAndSumOfSquares)
    }
    
    public var sumOfMagnitudes: Scalar {
        return fmap(vDSP.sumOfMagnitudes)
    }
    
}

extension Matrix where Scalar == Float {
    
    public var indexOfMinimum: (UInt, Scalar) {
        return fmap(vDSP.indexOfMinimum)
    }
    
    public var indexOfMaximum: (UInt, Scalar) {
        return fmap(vDSP.indexOfMaximum)
    }
    
    public var indexOfMaximumMagnitude: (UInt, Scalar) {
        return fmap(vDSP.indexOfMaximumMagnitude)
    }
    
}

extension Matrix where Scalar == Float {
    
    public var mean: Scalar {
        return fmap(vDSP.mean)
    }
    
    public var meanMagnitude: Scalar {
        return fmap(vDSP.meanMagnitude)
    }
    
    public var meanSquare: Scalar {
        return fmap(vDSP.meanSquare)
    }
    
    public var rootMeanSquare: Scalar {
        return fmap(vDSP.rootMeanSquare)
    }
    
}

extension Matrix where Scalar == Float {
    
    public var variance: Scalar {
        return variance(mean: mean)
    }
    
    public func variance(mean: Scalar) -> Scalar {
        let difference = self - mean
        return difference.meanSquare
    }
    
}

extension Matrix where Scalar == Float {
    
    public var standardDeviation: Scalar {
        return standardDeviation(mean: mean)
    }
    
    public func standardDeviation(mean: Scalar) -> Scalar {
        let difference = self - mean
        return difference.rootMeanSquare
    }
    
}

extension Matrix where Scalar == Float {
    
    public var skewness: Scalar {
        return skewness(mean: mean)
    }
    
    public func skewness(mean: Scalar) -> Scalar {
        let standardDeviation = standardDeviation(mean: mean)
        let difference = self - mean
        let cubic = difference * difference * difference
        return cubic.mean / pow(standardDeviation, 3.0)
    }
    
}

extension Matrix where Scalar == Float {
    
    public var kurtosis: Scalar {
        return kurtosis(mean: mean)
    }
    
    public func kurtosis(mean: Scalar) -> Scalar {
        let difference = self - mean
        let quartic = difference * difference * difference * difference
        let quadratic = difference * difference
        return quartic.mean / pow(quadratic.mean, 2.0)
    }
    
}

extension Matrix where Scalar == Double {
    
    public var minimum: Scalar {
        return fmap(vDSP.minimum)
    }
    
    public var maximum: Scalar {
        return fmap(vDSP.maximum)
    }
    
    public var maximumMagnitude: Scalar {
        return fmap(vDSP.maximumMagnitude)
    }
    
    public var sum: Scalar {
        return fmap(vDSP.sum)
    }
    
    public var sumOfSquares: Scalar {
        return fmap(vDSP.sumOfSquares)
    }
    
    public var sumAndSumOfSquares: (elementsSum: Scalar, squaresSum: Scalar) {
        return fmap(vDSP.sumAndSumOfSquares)
    }
    
    public var sumOfMagnitudes: Scalar {
        return fmap(vDSP.sumOfMagnitudes)
    }
    
}

extension Matrix where Scalar == Double {
    
    public var indexOfMinimum: (UInt, Scalar) {
        return fmap(vDSP.indexOfMinimum)
    }
    
    public var indexOfMaximum: (UInt, Scalar) {
        return fmap(vDSP.indexOfMaximum)
    }
    
    public var indexOfMaximumMagnitude: (UInt, Scalar) {
        return fmap(vDSP.indexOfMaximumMagnitude)
    }
    
}

extension Matrix where Scalar == Double {
    
    public var mean: Scalar {
        return fmap(vDSP.mean)
    }
    
    public var meanMagnitude: Scalar {
        return fmap(vDSP.meanMagnitude)
    }
    
    public var meanSquare: Scalar {
        return fmap(vDSP.meanSquare)
    }
    
    public var rootMeanSquare: Scalar {
        return fmap(vDSP.rootMeanSquare)
    }
    
}

extension Matrix where Scalar == Double {
    
    public var variance: Scalar {
        return variance(mean: mean)
    }
    
    public func variance(mean: Scalar) -> Scalar {
        let difference = self - mean
        return difference.meanSquare
    }
    
}

extension Matrix where Scalar == Double {
    
    public var standardDeviation: Scalar {
        return standardDeviation(mean: mean)
    }
    
    public func standardDeviation(mean: Scalar) -> Scalar {
        let difference = self - mean
        return difference.rootMeanSquare
    }
    
}

extension Matrix where Scalar == Double {
    
    public var skewness: Scalar {
        return skewness(mean: mean)
    }
    
    public func skewness(mean: Scalar) -> Scalar {
        let standardDeviation = standardDeviation(mean: mean)
        let difference = self - mean
        let cubic = difference * difference * difference
        return cubic.mean / pow(standardDeviation, 3.0)
    }
    
}

extension Matrix where Scalar == Double {
    
    public var kurtosis: Scalar {
        return kurtosis(mean: mean)
    }
    
    public func kurtosis(mean: Scalar) -> Scalar {
        let difference = self - mean
        let quartic = difference * difference * difference * difference
        let quadratic = difference * difference
        return quartic.mean / pow(quadratic.mean, 2.0)
    }
    
}
