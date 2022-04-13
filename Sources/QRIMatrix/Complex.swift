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
    
    public static func == <Element>(lhs: Complex<Element>, rhs: Complex<Element>) -> Bool {
        return lhs.real == rhs.real && lhs.imaginary == rhs.imaginary
    }
    
}

extension Complex: Hashable where Element: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(real)
        hasher.combine(imaginary)
    }
    
}
