//
//  Statistics.swift
//  Plinth
//
//  Created by Daniel Clelland on 13/04/22.
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

extension Matrix where Scalar == Float {
    
    public func variance() -> Scalar {
        return variance(mean: mean())
    }
    
    public func variance(mean: Scalar) -> Scalar {
        let difference = self - mean
        return difference.meanSquare()
    }
    
}

extension Matrix where Scalar == Float {
    
    public func standardDeviation() -> Scalar {
        return standardDeviation(mean: mean())
    }
    
    public func standardDeviation(mean: Scalar) -> Scalar {
        let difference = self - mean
        return difference.rootMeanSquare()
    }
    
}

extension Matrix where Scalar == Float {
    
    public func skewness() -> Scalar {
        return skewness(mean: mean())
    }
    
    public func skewness(mean: Scalar) -> Scalar {
        let standardDeviation = standardDeviation(mean: mean)
        let difference = self - mean
        let cubic = difference * difference * difference
        return cubic.mean() / pow(standardDeviation, 3.0)
    }
    
}

extension Matrix where Scalar == Float {
    
    public func kurtosis() -> Scalar {
        return kurtosis(mean: mean())
    }
    
    public func kurtosis(mean: Scalar) -> Scalar {
        let difference = self - mean
        let quartic = difference * difference * difference * difference
        let quadratic = difference * difference
        return quartic.mean() / pow(quadratic.mean(), 2.0)
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

extension Matrix where Scalar == Double {
    
    public func variance() -> Scalar {
        return variance(mean: mean())
    }
    
    public func variance(mean: Scalar) -> Scalar {
        let difference = self - mean
        return difference.meanSquare()
    }
    
}

extension Matrix where Scalar == Double {
    
    public func standardDeviation() -> Scalar {
        return standardDeviation(mean: mean())
    }
    
    public func standardDeviation(mean: Scalar) -> Scalar {
        let difference = self - mean
        return difference.rootMeanSquare()
    }
    
}

extension Matrix where Scalar == Double {
    
    public func skewness() -> Scalar {
        return skewness(mean: mean())
    }
    
    public func skewness(mean: Scalar) -> Scalar {
        let standardDeviation = standardDeviation(mean: mean)
        let difference = self - mean
        let cubic = difference * difference * difference
        return cubic.mean() / pow(standardDeviation, 3.0)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func kurtosis() -> Scalar {
        return kurtosis(mean: mean())
    }
    
    public func kurtosis(mean: Scalar) -> Scalar {
        let difference = self - mean
        let quartic = difference * difference * difference * difference
        let quadratic = difference * difference
        return quartic.mean() / pow(quadratic.mean(), 2.0)
    }
    
}
