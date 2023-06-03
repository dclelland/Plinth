//
//  Bitmaps.swift
//  Plinth
//
//  Created by Daniel Clelland on 3/06/23.
//

import Foundation

extension Matrix where Scalar == Float {
    
    public init(bitmap matrix: Matrix<UInt8>) {
        self = .init(matrix) / 255.0
    }
    
}

extension Matrix where Scalar == Float {
    
    public var bitmap: Matrix<UInt8> {
        return Matrix<UInt8>(self * 255.0, rounding: .towardZero)
    }
    
}

extension Matrix where Scalar == Double {
    
    public init(bitmap matrix: Matrix<UInt8>) {
        self = .init(matrix) / 255.0
    }
    
}

extension Matrix where Scalar == Double {
    
    public var bitmap: Matrix<UInt8> {
        return Matrix<UInt8>(self * 255.0, rounding: .towardZero)
    }
    
}
