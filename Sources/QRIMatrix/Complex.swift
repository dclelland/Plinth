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
