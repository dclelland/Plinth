//
//  Conversions.swift
//  Plinth
//
//  Created by Daniel Clelland on 30/04/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {

    public init(_ matrix: Matrix<UInt8>) {
        self = matrix.fmap(vDSP.convertElements)
    }

    public init(_ matrix: Matrix<UInt16>) {
        self = matrix.fmap(vDSP.convertElements)
    }

    public init(_ matrix: Matrix<UInt32>) {
        self = matrix.fmap(vDSP.convertElements)
    }

    public init(_ matrix: Matrix<Int8>) {
        self = matrix.fmap(vDSP.convertElements)
    }

    public init(_ matrix: Matrix<Int16>) {
        self = matrix.fmap(vDSP.convertElements)
    }

    public init(_ matrix: Matrix<Int32>) {
        self = matrix.fmap(vDSP.convertElements)
    }

}

extension Matrix where Scalar: vDSP_IntegerConvertable {
    
    public init(_ matrix: Matrix<Float>, rounding: vDSP.RoundingMode) {
        self = matrix.fmap { vDSP.floatingPointToInteger($0, integerType: Scalar.self, rounding: rounding) }
    }

}

extension Matrix where Scalar == Float {
    
    public init(_ matrix: Matrix<Double>) {
        self = matrix.fmap(vDSP.doubleToFloat)
    }
    
}

extension Matrix where Scalar == Double {

    public init(_ matrix: Matrix<UInt8>) {
        self = matrix.fmap(vDSP.convertElements)
    }

    public init(_ matrix: Matrix<UInt16>) {
        self = matrix.fmap(vDSP.convertElements)
    }

    public init(_ matrix: Matrix<UInt32>) {
        self = matrix.fmap(vDSP.convertElements)
    }

    public init(_ matrix: Matrix<Int8>) {
        self = matrix.fmap(vDSP.convertElements)
    }

    public init(_ matrix: Matrix<Int16>) {
        self = matrix.fmap(vDSP.convertElements)
    }

    public init(_ matrix: Matrix<Int32>) {
        self = matrix.fmap(vDSP.convertElements)
    }

}

extension Matrix where Scalar: vDSP_IntegerConvertable {
    
    public init(_ matrix: Matrix<Double>, rounding: vDSP.RoundingMode) {
        self = matrix.fmap { vDSP.floatingPointToInteger($0, integerType: Scalar.self, rounding: rounding) }
    }

}

extension Matrix where Scalar == Double {
    
    public init(_ matrix: Matrix<Float>) {
        self = matrix.fmap(vDSP.floatToDouble)
    }
    
}
