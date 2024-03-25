//
//  Crop.swift
//  Plinth
//
//  Created by Daniel Clelland on 26/04/22.
//

import Foundation

public struct CropRoundingRule {
    
    internal let top: FloatingPointRoundingRule
    internal let left: FloatingPointRoundingRule
    internal let bottom: FloatingPointRoundingRule
    internal let right: FloatingPointRoundingRule
    
    public static let towardsTopLeft = CropRoundingRule(top: .down, left: .down, bottom: .up, right: .up)
    public static let towardsTopRight = CropRoundingRule(top: .down, left: .up, bottom: .up, right: .down)
    public static let towardsBottomLeft = CropRoundingRule(top: .up, left: .down, bottom: .down, right: .up)
    public static let towardsBottomRight = CropRoundingRule(top: .up, left: .up, bottom: .down, right: .down)
    
}

extension Matrix where Scalar == Float {
    
    public func cropped(to shape: Shape, _ rule: CropRoundingRule = .towardsTopLeft) -> Matrix {
        let top = Int((Scalar(self.shape.rows - shape.rows) / 2.0).rounded(rule.top))
        let left = Int((Scalar(self.shape.columns - shape.columns) / 2.0).rounded(rule.left))
        let bottom = Int((Scalar(self.shape.rows - shape.rows) / 2.0).rounded(rule.bottom))
        let right = Int((Scalar(self.shape.columns - shape.columns) / 2.0).rounded(rule.right))
        return cropped(top: top, left: left, bottom: bottom, right: right)
    }
    
    public func cropped(inset: Int) -> Matrix {
        return cropped(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    public func cropped(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> Matrix {
        let rows = (top)...(shape.rows - bottom - 1)
        let columns = (left)...(shape.columns - right - 1)
        return self[rows, columns]
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func cropped(to shape: Shape, _ rule: CropRoundingRule = .towardsTopLeft) -> ComplexMatrix {
        return ComplexMatrix(real: real.cropped(to: shape, rule), imaginary: imaginary.cropped(to: shape, rule))
    }
    
    public func cropped(inset: Int) -> ComplexMatrix {
        return ComplexMatrix(real: real.cropped(inset: inset), imaginary: imaginary.cropped(inset: inset))
    }
    
    public func cropped(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> ComplexMatrix {
        return ComplexMatrix(real: real.cropped(top: top, left: left, bottom: bottom, right: right), imaginary: imaginary.cropped(top: top, left: left, bottom: bottom, right: right))
    }
    
}

extension Matrix where Scalar == Double {
    
    public func cropped(to shape: Shape, _ rule: CropRoundingRule = .towardsTopLeft) -> Matrix {
        let top = Int((Scalar(self.shape.rows - shape.rows) / 2.0).rounded(rule.top))
        let left = Int((Scalar(self.shape.columns - shape.columns) / 2.0).rounded(rule.left))
        let bottom = Int((Scalar(self.shape.rows - shape.rows) / 2.0).rounded(rule.bottom))
        let right = Int((Scalar(self.shape.columns - shape.columns) / 2.0).rounded(rule.right))
        return cropped(top: top, left: left, bottom: bottom, right: right)
    }
    
    public func cropped(inset: Int) -> Matrix {
        return cropped(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    public func cropped(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> Matrix {
        let rows = (top)...(shape.rows - bottom - 1)
        let columns = (left)...(shape.columns - right - 1)
        return self[rows, columns]
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func cropped(to shape: Shape, _ rule: CropRoundingRule = .towardsTopLeft) -> ComplexMatrix {
        return ComplexMatrix(real: real.cropped(to: shape, rule), imaginary: imaginary.cropped(to: shape, rule))
    }
    
    public func cropped(inset: Int) -> ComplexMatrix {
        return ComplexMatrix(real: real.cropped(inset: inset), imaginary: imaginary.cropped(inset: inset))
    }
    
    public func cropped(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> ComplexMatrix {
        return ComplexMatrix(real: real.cropped(top: top, left: left, bottom: bottom, right: right), imaginary: imaginary.cropped(top: top, left: left, bottom: bottom, right: right))
    }
    
}
