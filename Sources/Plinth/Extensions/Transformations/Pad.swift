//
//  Pad.swift
//  Plinth
//
//  Created by Daniel Clelland on 27/04/22.
//

import Foundation

public struct PadRoundingRule {

    internal let top: FloatingPointRoundingRule
    internal let left: FloatingPointRoundingRule
    internal let bottom: FloatingPointRoundingRule
    internal let right: FloatingPointRoundingRule

    public static let towardsTopLeft = PadRoundingRule(top: .down, left: .down, bottom: .up, right: .up)
    public static let towardsTopRight = PadRoundingRule(top: .down, left: .up, bottom: .up, right: .down)
    public static let towardsBottomLeft = PadRoundingRule(top: .up, left: .down, bottom: .down, right: .up)
    public static let towardsBottomRight = PadRoundingRule(top: .up, left: .up, bottom: .down, right: .down)

}

extension Matrix where Scalar == Float {
    
    public func padded(to shape: Shape, _ rule: PadRoundingRule = .towardsTopLeft, repeating element: Scalar = .zero) -> Matrix {
        let top = Int((Scalar(shape.rows - self.shape.rows) / 2.0).rounded(rule.top))
        let left = Int((Scalar(shape.columns - self.shape.columns) / 2.0).rounded(rule.left))
        let bottom = Int((Scalar(shape.rows - self.shape.rows) / 2.0).rounded(rule.bottom))
        let right = Int((Scalar(shape.columns - self.shape.columns) / 2.0).rounded(rule.right))
        return padded(top: top, left: left, bottom: bottom, right: right)
    }
    
    public func padded(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0, repeating element: Scalar = .zero) -> Matrix {
        var output: Matrix = .init(shape: .init(rows: shape.rows + top + bottom, columns: shape.columns + left + right), repeating: element)
        output[top...(top + shape.rows - 1), left...(left + shape.columns - 1)] = self
        return output
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func padded(to shape: Shape, _ rule: PadRoundingRule = .towardsTopLeft, repeating element: Complex = .zero) -> ComplexMatrix {
        return ComplexMatrix(
            real: real.padded(to: shape, rule, repeating: element.real),
            imaginary: imaginary.padded(to: shape, rule, repeating: element.imaginary)
        )
    }
    
    public func padded(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0, repeating element: Complex = .zero) -> ComplexMatrix {
        return ComplexMatrix(
            real: real.padded(top: top, left: left, bottom: bottom, right: right, repeating: element.real),
            imaginary: imaginary.padded(top: top, left: left, bottom: bottom, right: right, repeating: element.imaginary)
        )
    }
    
}

extension Matrix where Scalar == Double {
    
    public func padded(to shape: Shape, _ rule: PadRoundingRule = .towardsTopLeft, repeating element: Scalar = .zero) -> Matrix {
        let top = Int((Scalar(shape.rows - self.shape.rows) / 2.0).rounded(rule.top))
        let left = Int((Scalar(shape.columns - self.shape.columns) / 2.0).rounded(rule.left))
        let bottom = Int((Scalar(shape.rows - self.shape.rows) / 2.0).rounded(rule.bottom))
        let right = Int((Scalar(shape.columns - self.shape.columns) / 2.0).rounded(rule.right))
        return padded(top: top, left: left, bottom: bottom, right: right)
    }
    
    public func padded(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0, repeating element: Scalar = .zero) -> Matrix {
        var output: Matrix = .init(shape: .init(rows: shape.rows + top + bottom, columns: shape.columns + left + right), repeating: element)
        output[top...(top + shape.rows - 1), left...(left + shape.columns - 1)] = self
        return output
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func padded(to shape: Shape, _ rule: PadRoundingRule = .towardsTopLeft, repeating element: Complex = .zero) -> ComplexMatrix {
        return ComplexMatrix(
            real: real.padded(to: shape, rule, repeating: element.real),
            imaginary: imaginary.padded(to: shape, rule, repeating: element.imaginary)
        )
    }
    
    public func padded(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0, repeating element: Complex = .zero) -> ComplexMatrix {
        return ComplexMatrix(
            real: real.padded(top: top, left: left, bottom: bottom, right: right, repeating: element.real),
            imaginary: imaginary.padded(top: top, left: left, bottom: bottom, right: right, repeating: element.imaginary)
        )
    }
    
}
