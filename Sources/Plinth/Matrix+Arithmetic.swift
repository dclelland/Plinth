//
//  Matrix+Arithmetic.swift
//  Plinth
//
//  Created by Daniel Clelland on 20/04/22.
//

import Foundation
import Accelerate

public protocol MatrixArithmetic {
    
    associatedtype Scalar
    
    static prefix func + (right: Self) -> Self
    static prefix func - (right: Self) -> Self
    
    static func + (left: Self, right: Scalar) -> Self
    static func + (left: Scalar, right: Self) -> Self
    static func + (left: Self, right: Self) -> Self
    
}

extension Matrix: MatrixArithmetic where Scalar == Double {
    
    public static prefix func + (right: Matrix<Scalar>) -> Matrix<Scalar> {
        return right
    }
    
    public static prefix func - (right: Matrix<Scalar>) -> Matrix<Scalar> {
        return Matrix<Double>(size: right.size, elements: vDSP.negative(right))
    }
    
    public static func + (left: Matrix<Scalar>, right: Double) -> Matrix<Scalar> {
        return Matrix<Double>(size: left.size, elements: vDSP.add(right, left))
    }
    
    public static func + (left: Double, right: Matrix<Scalar>) -> Matrix<Scalar> {
        return Matrix<Double>(size: right.size, elements: vDSP.add(left, right))
    }
    
    public static func + (left: Matrix<Scalar>, right: Matrix<Scalar>) -> Matrix<Scalar> {
        return Matrix<Double>(size: left.size, elements: vDSP.add(left, right))
    }
    
    
//    public static func + (left: Self, right: Scalar) -> Self {
//        return Self(size: size, elements: vDSP.add(right, self))
//    }
//
//    public static func + (left: Scalar, right: Self) -> Self {
//        return Self(size: size, elements: vDSP.add(left, self))
//    }
    
}

    

//extension Matrix: MatrixArithmetic where Scalar == Float {
//
//}
//
//extension Matrix: MatrixArithmetic where Scalar == Double {
//
//}
