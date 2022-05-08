//
//  Statistics.swift
//  Plinth
//
//  Created by Daniel Clelland on 13/04/22.
//

import Foundation

extension Matrix where Scalar == Double {
    
    public func moment(degree: Int) -> Scalar {
        precondition(degree >= 0)
        switch degree {
        case 0:
            return 1.0
        case 1:
            return mean()
        case 2:
            return meanSquare()
        default:
            return pow(degree).mean()
        }
    }
    
}

extension Matrix where Scalar == Double {
    
    public func centralMoment(degree: Int) -> Scalar {
        return centralMoment(degree: degree, mean: mean())
    }
    
    public func centralMoment(degree: Int, mean: Scalar) -> Scalar {
        return meanNormalized(mean: mean).moment(degree: degree)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func standardizedMoment(degree: Int) -> Scalar {
        return standardizedMoment(degree: degree, mean: mean())
    }
    
    public func standardizedMoment(degree: Int, mean: Scalar) -> Scalar {
        return centralMoment(degree: degree) / Darwin.pow(standardDeviation(mean: mean), Scalar(degree))
    }
    
}

extension Matrix where Scalar == Double {
    
    public func variance() -> Scalar {
        return variance(mean: mean())
    }
    
    public func variance(mean: Scalar) -> Scalar {
        return centralMoment(degree: 2, mean: mean)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func standardDeviation() -> Scalar {
        return standardDeviation(mean: mean())
    }
    
    public func standardDeviation(mean: Scalar) -> Scalar {
        return centralMoment(degree: 2, mean: mean).squareRoot()
    }
    
}

extension Matrix where Scalar == Double {

    public func skewness() -> Scalar {
        return skewness(mean: mean())
    }

    public func skewness(mean: Scalar) -> Scalar {
        return standardizedMoment(degree: 3, mean: mean)
    }

}

extension Matrix where Scalar == Double {

    public func kurtosis() -> Scalar {
        return kurtosis(mean: mean())
    }

    public func kurtosis(mean: Scalar) -> Scalar {
        return standardizedMoment(degree: 4, mean: mean)
    }

}
