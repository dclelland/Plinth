//
//  vDSP.swift
//  Plinth
//
//  Created by Daniel Clelland on 30/04/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {

    public func maximum() -> Scalar {
        return fmap(vDSP.maximum)
    }
    
    public func maximumMagnitude() -> Scalar {
        return fmap(vDSP.maximumMagnitude)
    }
    
    public func minimum() -> Scalar {
        return fmap(vDSP.minimum)
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

    public func indexOfMaximum() -> (UInt, Float) {
        return fmap(vDSP.indexOfMaximum)
    }
    
    public func indexOfMaximumMagnitude() -> (UInt, Float) {
        return fmap(vDSP.indexOfMaximumMagnitude)
    }
    
    public func indexOfMinimum() -> (UInt, Float) {
        return fmap(vDSP.indexOfMinimum)
    }

}

extension Matrix where Scalar == Float {

    public func meanSquare() -> Scalar {
        return fmap(vDSP.meanSquare)
    }
    
    public func meanMagnitude() -> Scalar {
        return fmap(vDSP.meanMagnitude)
    }
    
    public func mean() -> Scalar {
        return fmap(vDSP.mean)
    }
    
    public func rootMeanSquare() -> Scalar {
        return fmap(vDSP.rootMeanSquare)
    }

}

extension Matrix where Scalar == Float {

    public func clip(to bounds: ClosedRange<Float>) -> Matrix {
        return fmap { vDSP.clip($0, to: bounds) }
    }
    
    public func invertedClip(to bounds: ClosedRange<Float>) -> Matrix {
        return fmap { vDSP.invertedClip($0, to: bounds) }
    }
    
    public func threshold(to lowerBound: Scalar, with rule: vDSP.ThresholdRule<Float>) -> Matrix {
        return fmap { vDSP.threshold($0, to: lowerBound, with: rule) }
    }
    
    public func limit(_ limit: Scalar, withOutputConstant outputConstant: Scalar) -> Matrix {
        return fmap { vDSP.limit($0, limit: limit, withOutputConstant: outputConstant) }
    }

}

extension Matrix where Scalar == Float {

    public func dot(_ vector: Matrix) -> Scalar {
        return fmap { vDSP.dot($0, vector) }
    }
    
    public func hypot(_ y: Matrix) -> Matrix {
        return fmap { vDSP.hypot($0, y) }
    }
    
    public func hypot(x1: Matrix, y0: Matrix, y1: Matrix) -> Matrix {
        return fmap { vDSP.hypot(x0: $0, x1: x1, y0: y0, y1: y1) }
    }
    
    public func distanceSquared(_ point: Matrix) -> Scalar {
        return fmap { vDSP.distanceSquared($0, point) }
    }

}

extension Matrix where Scalar == Float {
    
    public func evaluatePolynomial(usingCoefficients coefficients: [Scalar]) -> Matrix {
        return fmap { vDSP.evaluatePolynomial(usingCoefficients: coefficients, withVariables: $0) }
    }
    
}

extension Matrix where Scalar == Float {

    public func linearInterpolate(_ vector: Matrix, using interpolationConstant: Scalar) -> Matrix {
        return fmap { vDSP.linearInterpolate($0, vector, using: interpolationConstant) }
    }
    
    public func linearInterpolate(using controlVector: Matrix) -> Matrix {
        return fmap { vDSP.linearInterpolate(elementsOf: $0, using: controlVector) }
    }

}

extension Matrix where Scalar == Float {

    public func minimum(_ vector: Matrix) -> Matrix {
        return fmap { vDSP.minimum($0, vector.elements) }
    }
    
    public func maximum(_ vector: Matrix) -> Matrix {
        return fmap { vDSP.maximum($0, vector.elements) }
    }

}

extension Matrix where Scalar == Float {

    public func absolute() -> Matrix {
        return fmap(vDSP.absolute)
    }
    
    public func negativeAbsolute() -> Matrix {
        return fmap(vDSP.negativeAbsolute)
    }
    
    public func negative() -> Matrix {
        return fmap(vDSP.negative)
    }

}

extension Matrix where Scalar == Float {

    public func reverse() -> Matrix {
        return fmap(vDSP.reverse)
    }
    
    public func sort(_ sortOrder: vDSP.SortOrder) -> Matrix {
        return fmap { vDSP.sort(&$0, sortOrder: sortOrder) }
    }

}

extension Matrix where Scalar == Float {

    public func square() -> Matrix {
        return fmap(vDSP.square)
    }
    
    public func signedSquare() -> Matrix {
        return fmap(vDSP.signedSquare)
    }
    
    public func trunc() -> Matrix {
        return fmap(vDSP.trunc)
    }
    
    public func countZeroCrossings() -> UInt {
        return fmap(vDSP.countZeroCrossings)
    }

}

extension ComplexMatrix where Scalar == Float {

    public func phase() -> Matrix {
        return fmap(vDSP.phase)
    }

    public func conjugate() -> ComplexMatrix {
        return fmap { vDSP.conjugate($0, count: shape.count, result: &$1) }
    }

    public func absolute() -> Matrix {
        return fmap(vDSP.absolute)
    }

    public func squareMagnitudes() -> Matrix {
        return fmap(vDSP.squareMagnitudes)
    }

}

extension Matrix where Scalar == Float {

    public func ceil() -> Matrix {
        return fmap(vForce.ceil)
    }

    public func floor() -> Matrix {
        return fmap(vForce.floor)
    }

    public func copysign(_ signs: Matrix) -> Matrix {
        return fmap { vForce.copysign(magnitudes: $0, signs: signs) }
    }
    
    public func truncatingRemainder(_ divisors: Matrix) -> Matrix {
        return fmap { vForce.truncatingRemainder(dividends: $0, divisors: divisors) }
    }
    
    public func remainder(_ divisors: Matrix) -> Matrix {
        return fmap { vForce.remainder(dividends: $0, divisors: divisors) }
    }
    
    public func integerTruncation() -> Matrix {
        return fmap(vForce.trunc)
    }

    public func nearestInteger() -> Matrix {
        return fmap(vForce.nearestInteger)
    }

    public func rsqrt() -> Matrix {
        return fmap(vForce.rsqrt)
    }

    public func sqrt() -> Matrix {
        return fmap(vForce.sqrt)
    }

    public func reciprocal() -> Matrix {
        return fmap(vForce.reciprocal)
    }
    
}

extension Matrix where Scalar == Float {

    public func exp() -> Matrix {
        return fmap(vForce.exp)
    }

    public func expm1() -> Matrix {
        return fmap(vForce.expm1)
    }

    public func exp2() -> Matrix {
        return fmap(vForce.exp2)
    }

    public func log2() -> Matrix {
        return fmap(vForce.log2)
    }

    public func log10() -> Matrix {
        return fmap(vForce.log10)
    }

    public func logb() -> Matrix {
        return fmap(vForce.logb)
    }

    
}

extension Matrix where Scalar == Float {

    public func pow(_ exponents: Matrix) -> Matrix {
        return fmap { vForce.pow(bases: $0, exponents: exponents) }
    }
    
}

extension Matrix where Scalar == Float {

    public func sin() -> Matrix {
        return fmap(vForce.sin)
    }

    public func sinPi() -> Matrix {
        return fmap(vForce.sinPi)
    }

    public func cos() -> Matrix {
        return fmap(vForce.cos)
    }

    public func cosPi() -> Matrix {
        return fmap(vForce.cosPi)
    }

    public func sincos() -> (sinResult: Matrix, cosResult: Matrix) {
        var result = (sinResult: Matrix.zeros(shape: shape), cosResult: Matrix.zeros(shape: shape))
        vForce.sincos(self, sinResult: &result.sinResult, cosResult: &result.cosResult)
        return result
    }

    public func tan() -> Matrix {
        return fmap(vForce.tan)
    }

    public func tanPi() -> Matrix {
        return fmap(vForce.tanPi)
    }
    
}

extension Matrix where Scalar == Float {

    public func asin() -> Matrix {
        return fmap(vForce.asin)
    }

    public func acos() -> Matrix {
        return fmap(vForce.acos)
    }

    public func atan() -> Matrix {
        return fmap(vForce.atan)
    }

    public func sinh() -> Matrix {
        return fmap(vForce.sinh)
    }

    public func cosh() -> Matrix {
        return fmap(vForce.cosh)
    }

    public func tanh() -> Matrix {
        return fmap(vForce.tanh)
    }

    public func asinh() -> Matrix {
        return fmap(vForce.asinh)
    }

    public func acosh() -> Matrix {
        return fmap(vForce.acosh)
    }

    public func atanh() -> Matrix {
        return fmap(vForce.atanh)
    }
    
}

extension Matrix where Scalar == Float {

    public func log() -> Matrix {
        return fmap(vForce.log)
    }

    public func log1p() -> Matrix {
        return fmap(vForce.log1p)
    }

    public func atan2(_ y: Matrix) -> Matrix {
        return fmap { vForce.atan2(x: $0, y: y) }
    }
    
}

extension Matrix where Scalar == Double {

    public func maximum() -> Scalar {
        return fmap(vDSP.maximum)
    }
    
    public func maximumMagnitude() -> Scalar {
        return fmap(vDSP.maximumMagnitude)
    }
    
    public func minimum() -> Scalar {
        return fmap(vDSP.minimum)
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

    public func indexOfMaximum() -> (UInt, Double) {
        return fmap(vDSP.indexOfMaximum)
    }
    
    public func indexOfMaximumMagnitude() -> (UInt, Double) {
        return fmap(vDSP.indexOfMaximumMagnitude)
    }
    
    public func indexOfMinimum() -> (UInt, Double) {
        return fmap(vDSP.indexOfMinimum)
    }

}

extension Matrix where Scalar == Double {

    public func meanSquare() -> Scalar {
        return fmap(vDSP.meanSquare)
    }
    
    public func meanMagnitude() -> Scalar {
        return fmap(vDSP.meanMagnitude)
    }
    
    public func mean() -> Scalar {
        return fmap(vDSP.mean)
    }
    
    public func rootMeanSquare() -> Scalar {
        return fmap(vDSP.rootMeanSquare)
    }

}

extension Matrix where Scalar == Double {

    public func clip(to bounds: ClosedRange<Double>) -> Matrix {
        return fmap { vDSP.clip($0, to: bounds) }
    }
    
    public func invertedClip(to bounds: ClosedRange<Double>) -> Matrix {
        return fmap { vDSP.invertedClip($0, to: bounds) }
    }
    
    public func threshold(to lowerBound: Scalar, with rule: vDSP.ThresholdRule<Double>) -> Matrix {
        return fmap { vDSP.threshold($0, to: lowerBound, with: rule) }
    }
    
    public func limit(_ limit: Scalar, withOutputConstant outputConstant: Scalar) -> Matrix {
        return fmap { vDSP.limit($0, limit: limit, withOutputConstant: outputConstant) }
    }

}

extension Matrix where Scalar == Double {

    public func dot(_ vector: Matrix) -> Scalar {
        return fmap { vDSP.dot($0, vector) }
    }
    
    public func hypot(_ y: Matrix) -> Matrix {
        return fmap { vDSP.hypot($0, y) }
    }
    
    public func hypot(x1: Matrix, y0: Matrix, y1: Matrix) -> Matrix {
        return fmap { vDSP.hypot(x0: $0, x1: x1, y0: y0, y1: y1) }
    }
    
    public func distanceSquared(_ point: Matrix) -> Scalar {
        return fmap { vDSP.distanceSquared($0, point) }
    }

}

extension Matrix where Scalar == Double {
    
    public func evaluatePolynomial(usingCoefficients coefficients: [Scalar]) -> Matrix {
        return fmap { vDSP.evaluatePolynomial(usingCoefficients: coefficients, withVariables: $0) }
    }
    
}

extension Matrix where Scalar == Double {

    public func linearInterpolate(_ vector: Matrix, using interpolationConstant: Scalar) -> Matrix {
        return fmap { vDSP.linearInterpolate($0, vector, using: interpolationConstant) }
    }
    
    public func linearInterpolate(using controlVector: Matrix) -> Matrix {
        return fmap { vDSP.linearInterpolate(elementsOf: $0, using: controlVector) }
    }

}

extension Matrix where Scalar == Double {

    public func minimum(_ vector: Matrix) -> Matrix {
        return fmap { vDSP.minimum($0, vector.elements) }
    }
    
    public func maximum(_ vector: Matrix) -> Matrix {
        return fmap { vDSP.maximum($0, vector.elements) }
    }

}

extension Matrix where Scalar == Double {

    public func absolute() -> Matrix {
        return fmap(vDSP.absolute)
    }
    
    public func negativeAbsolute() -> Matrix {
        return fmap(vDSP.negativeAbsolute)
    }
    
    public func negative() -> Matrix {
        return fmap(vDSP.negative)
    }

}

extension Matrix where Scalar == Double {

    public func reverse() -> Matrix {
        return fmap(vDSP.reverse)
    }
    
    public func sort(_ sortOrder: vDSP.SortOrder) -> Matrix {
        return fmap { vDSP.sort(&$0, sortOrder: sortOrder) }
    }

}

extension Matrix where Scalar == Double {

    public func square() -> Matrix {
        return fmap(vDSP.square)
    }
    
    public func signedSquare() -> Matrix {
        return fmap(vDSP.signedSquare)
    }
    
    public func trunc() -> Matrix {
        return fmap(vDSP.trunc)
    }
    
    public func countZeroCrossings() -> UInt {
        return fmap(vDSP.countZeroCrossings)
    }

}

extension ComplexMatrix where Scalar == Double {

    public func phase() -> Matrix {
        return fmap(vDSP.phase)
    }

    public func conjugate() -> ComplexMatrix {
        return fmap { vDSP.conjugate($0, count: shape.count, result: &$1) }
    }

    public func absolute() -> Matrix {
        return fmap(vDSP.absolute)
    }

    public func squareMagnitudes() -> Matrix {
        return fmap(vDSP.squareMagnitudes)
    }

}

extension Matrix where Scalar == Double {

    public func ceil() -> Matrix {
        return fmap(vForce.ceil)
    }

    public func floor() -> Matrix {
        return fmap(vForce.floor)
    }

    public func copysign(_ signs: Matrix) -> Matrix {
        return fmap { vForce.copysign(magnitudes: $0, signs: signs) }
    }
    
    public func truncatingRemainder(_ divisors: Matrix) -> Matrix {
        return fmap { vForce.truncatingRemainder(dividends: $0, divisors: divisors) }
    }
    
    public func remainder(_ divisors: Matrix) -> Matrix {
        return fmap { vForce.remainder(dividends: $0, divisors: divisors) }
    }
    
    public func integerTruncation() -> Matrix {
        return fmap(vForce.trunc)
    }

    public func nearestInteger() -> Matrix {
        return fmap(vForce.nearestInteger)
    }

    public func rsqrt() -> Matrix {
        return fmap(vForce.rsqrt)
    }

    public func sqrt() -> Matrix {
        return fmap(vForce.sqrt)
    }

    public func reciprocal() -> Matrix {
        return fmap(vForce.reciprocal)
    }
    
}

extension Matrix where Scalar == Double {

    public func exp() -> Matrix {
        return fmap(vForce.exp)
    }

    public func expm1() -> Matrix {
        return fmap(vForce.expm1)
    }

    public func exp2() -> Matrix {
        return fmap(vForce.exp2)
    }

    public func log2() -> Matrix {
        return fmap(vForce.log2)
    }

    public func log10() -> Matrix {
        return fmap(vForce.log10)
    }

    public func logb() -> Matrix {
        return fmap(vForce.logb)
    }

    
}

extension Matrix where Scalar == Double {

    public func pow(_ exponents: Matrix) -> Matrix {
        return fmap { vForce.pow(bases: $0, exponents: exponents) }
    }
    
}

extension Matrix where Scalar == Double {

    public func sin() -> Matrix {
        return fmap(vForce.sin)
    }

    public func sinPi() -> Matrix {
        return fmap(vForce.sinPi)
    }

    public func cos() -> Matrix {
        return fmap(vForce.cos)
    }

    public func cosPi() -> Matrix {
        return fmap(vForce.cosPi)
    }

    public func sincos() -> (sinResult: Matrix, cosResult: Matrix) {
        var result = (sinResult: Matrix.zeros(shape: shape), cosResult: Matrix.zeros(shape: shape))
        vForce.sincos(self, sinResult: &result.sinResult, cosResult: &result.cosResult)
        return result
    }

    public func tan() -> Matrix {
        return fmap(vForce.tan)
    }

    public func tanPi() -> Matrix {
        return fmap(vForce.tanPi)
    }
    
}

extension Matrix where Scalar == Double {

    public func asin() -> Matrix {
        return fmap(vForce.asin)
    }

    public func acos() -> Matrix {
        return fmap(vForce.acos)
    }

    public func atan() -> Matrix {
        return fmap(vForce.atan)
    }

    public func sinh() -> Matrix {
        return fmap(vForce.sinh)
    }

    public func cosh() -> Matrix {
        return fmap(vForce.cosh)
    }

    public func tanh() -> Matrix {
        return fmap(vForce.tanh)
    }

    public func asinh() -> Matrix {
        return fmap(vForce.asinh)
    }

    public func acosh() -> Matrix {
        return fmap(vForce.acosh)
    }

    public func atanh() -> Matrix {
        return fmap(vForce.atanh)
    }
    
}

extension Matrix where Scalar == Double {

    public func log() -> Matrix {
        return fmap(vForce.log)
    }

    public func log1p() -> Matrix {
        return fmap(vForce.log1p)
    }

    public func atan2(_ y: Matrix) -> Matrix {
        return fmap { vForce.atan2(x: $0, y: y) }
    }
    
}
