//
//  Statistics.swift
//  Plinth
//
//  Created by Daniel Clelland on 13/04/22.
//

import Foundation
import Accelerate

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
        let cubic = difference.pow(3)
        return cubic.mean() / Darwin.pow(standardDeviation, 3.0)
    }
    
}

extension Matrix where Scalar == Float {
    
    public func kurtosis() -> Scalar {
        return kurtosis(mean: mean())
    }
    
    public func kurtosis(mean: Scalar) -> Scalar {
        let difference = self - mean
        let quartic = difference.pow(4)
        let quadratic = difference.square()
        return quartic.mean() / Darwin.pow(quadratic.mean(), 2.0)
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
        let cubic = difference.pow(3)
        return cubic.mean() / Darwin.pow(standardDeviation, 3.0)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func kurtosis() -> Scalar {
        return kurtosis(mean: mean())
    }
    
    public func kurtosis(mean: Scalar) -> Scalar {
        let difference = self - mean
        let quartic = difference.pow(4)
        let quadratic = difference.square()
        return quartic.mean() / Darwin.pow(quadratic.mean(), 2.0)
    }
    
}
