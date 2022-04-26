//
//  Inset.swift
//  Plinth
//
//  Created by Daniel Clelland on 26/04/22.
//

import Foundation

public struct InsetRoundingRule {
    
    internal var top: FloatingPointRoundingRule
    internal var left: FloatingPointRoundingRule
    internal var bottom: FloatingPointRoundingRule
    internal var right: FloatingPointRoundingRule
    
    internal init(top: FloatingPointRoundingRule, left: FloatingPointRoundingRule, bottom: FloatingPointRoundingRule, right: FloatingPointRoundingRule) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
    
    public static let towardsTopLeft = InsetRoundingRule(top: .down, left: .down, bottom: .up, right: .up)
    public static let towardsTopRight = InsetRoundingRule(top: .down, left: .up, bottom: .up, right: .down)
    public static let towardsBottomLeft = InsetRoundingRule(top: .up, left: .down, bottom: .down, right: .up)
    public static let towardsBottomRight = InsetRoundingRule(top: .up, left: .up, bottom: .down, right: .down)
    
}

extension Matrix where Scalar == Float {
    
    public func inset(to shape: Shape, _ rule: InsetRoundingRule = .towardsTopLeft) -> Matrix {
        let top = Int((Scalar(self.shape.rows - shape.rows) / 2.0).rounded(rule.top))
        let left = Int((Scalar(self.shape.columns - shape.columns) / 2.0).rounded(rule.left))
        let bottom = Int((Scalar(self.shape.rows - shape.rows) / 2.0).rounded(rule.bottom))
        let right = Int((Scalar(self.shape.columns - shape.columns) / 2.0).rounded(rule.right))
        return inset(top: top, left: left, bottom: bottom, right: right)
    }
    
    public func inset(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> Matrix {
        let rows = (top)...(shape.rows - bottom - 1)
        let columns = (left)...(shape.columns - right - 1)
        return self[rows, columns]
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func inset(to shape: Shape, _ rule: InsetRoundingRule = .towardsTopLeft) -> ComplexMatrix {
        return ComplexMatrix(real: real.inset(to: shape, rule), imaginary: imaginary.inset(to: shape, rule))
    }
    
    public func inset(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> ComplexMatrix {
        return ComplexMatrix(real: real.inset(top: top, left: left, bottom: bottom, right: right), imaginary: imaginary.inset(top: top, left: left, bottom: bottom, right: right))
    }
    
}

extension Matrix where Scalar == Double {
    
    public func inset(to shape: Shape, _ rule: InsetRoundingRule = .towardsTopLeft) -> Matrix {
        let top = Int((Scalar(self.shape.rows - shape.rows) / 2.0).rounded(rule.top))
        let left = Int((Scalar(self.shape.columns - shape.columns) / 2.0).rounded(rule.left))
        let bottom = Int((Scalar(self.shape.rows - shape.rows) / 2.0).rounded(rule.bottom))
        let right = Int((Scalar(self.shape.columns - shape.columns) / 2.0).rounded(rule.right))
        return inset(top: top, left: left, bottom: bottom, right: right)
    }
    
    public func inset(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> Matrix {
        let rows = (top)...(shape.rows - bottom - 1)
        let columns = (left)...(shape.columns - right - 1)
        return self[rows, columns]
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func inset(to shape: Shape, _ rule: InsetRoundingRule = .towardsTopLeft) -> ComplexMatrix {
        return ComplexMatrix(real: real.inset(to: shape, rule), imaginary: imaginary.inset(to: shape, rule))
    }
    
    public func inset(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> ComplexMatrix {
        return ComplexMatrix(real: real.inset(top: top, left: left, bottom: bottom, right: right), imaginary: imaginary.inset(top: top, left: left, bottom: bottom, right: right))
    }
    
}
