//
//  Complex.swift
//  QRIMatrix
//
//  Created by Daniel Clelland on 13/04/22.
//

import Foundation

public struct Complex<Scalar> {
    
    public var real: Scalar
    public var imaginary: Scalar
    
    public init(real: Scalar, imaginary: Scalar) {
        self.real = real
        self.imaginary = imaginary
    }
    
}

extension Complex where Scalar: Numeric {
    
    public static var zero: Complex {
        return .init(real: .zero, imaginary: .zero)
    }
    
    public static var i: Complex {
        return .init(real: .zero, imaginary: 1)
    }
    
}

extension Complex: ExpressibleByIntegerLiteral where Scalar == IntegerLiteralType {
    
    public init(integerLiteral value: Scalar) {
        self.init(real: value, imaginary: .zero)
    }
    
}

extension Complex: ExpressibleByFloatLiteral where Scalar == FloatLiteralType {
    
    public init(floatLiteral value: Scalar) {
        self.init(real: value, imaginary: .zero)
    }

}

extension Complex: CustomStringConvertible {
    
    public var description: String {
        return "\(real) + \(imaginary)i"
    }
    
}

extension Complex: Equatable where Scalar: Equatable {
    
    public static func == (lhs: Complex, rhs: Complex) -> Bool {
        return lhs.real == rhs.real && lhs.imaginary == rhs.imaginary
    }
    
}

extension Complex: Hashable where Scalar: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(real)
        hasher.combine(imaginary)
    }
    
}
