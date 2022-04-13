//
//  Complex.swift
//  QRIMatrix
//
//  Created by Daniel Clelland on 13/04/22.
//

import Foundation

public struct Complex<Element: Numeric> {
    
    public var real: Element
    public var imaginary: Element
    
    public init(real: Element, imaginary: Element) {
        self.real = real
        self.imaginary = imaginary
    }
    
}

extension Complex: Equatable {
    
    public static func == (lhs: MatrixSize, rhs: MatrixSize) -> Bool {
        return lhs.real == rhs.real && lhs.imaginary == rhs.imaginary
    }
    
}

extension Complex: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(real)
        hasher.combine(imaginary)
    }
    
}
