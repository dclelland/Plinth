//
//  Wrappers.swift
//  Plinth
//
//  Created by Daniel Clelland on 30/04/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Double {

    public func ceil() -> Matrix {
        return fmap(vForce.ceil)
    }

    public func floor() -> Matrix {
        return fmap(vForce.floor)
    }

    public func copysign(signs: Matrix) -> Matrix {
        return fmap { vForce.copysign(magnitudes: $0, signs: signs) }
    }
    
    public func truncatingRemainder(divisors: Matrix) -> Matrix {
        return fmap { vForce.truncatingRemainder(dividends: $0, divisors: divisors) }
    }
    
    public func remainder(divisors: Matrix) -> Matrix {
        return fmap { vForce.remainder(dividends: $0, divisors: divisors) }
    }
    
    public func trunc() -> Matrix {
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

    public func pow(exponents: Matrix) -> Matrix {
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

    // public func atan2<U, V>
    
}
