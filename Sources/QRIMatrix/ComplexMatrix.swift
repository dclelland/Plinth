//
//  ComplexMatrix.swift
//  QRIMatrix
//
//  Created by Daniel Clelland on 13/04/22.
//

import Foundation

public struct ComplexMatrix<Element> where Element: FloatingPoint, Element: ExpressibleByFloatLiteral {
    
    public let real: Matrix<Element>
    
    public let imaginary: Matrix<Element>
    
    public init(real: Matrix<Element>, imaginary: Matrix<Element>) {
        precondition(real.size == imaginary.size)
        self.real = real
        self.imaginary = imaginary
    }
    
}
