//
//  Center.swift
//  Plinth
//
//  Created by Daniel Clelland on 26/04/22.
//

import Foundation

public struct CenterRoundingRule {
    
    internal let row: FloatingPointRoundingRule
    internal let column: FloatingPointRoundingRule
    
    public static let towardsTopLeft = CenterRoundingRule(row: .down, column: .down)
    public static let towardsTopRight = CenterRoundingRule(row: .down, column: .up)
    public static let towardsBottomLeft = CenterRoundingRule(row: .up, column: .down)
    public static let towardsBottomRight = CenterRoundingRule(row: .up, column: .up)
    
}

extension Shape {
    
    public func center(_ rule: CenterRoundingRule = .towardsTopLeft) -> (row: Int, column: Int) {
        return (
            row: Int((Double(rows - 1) / 2.0).rounded(rule.row)),
            column: Int((Double(columns - 1) / 2.0).rounded(rule.column))
        )
    }
    
}

extension Matrix {
    
    public func center(_ rule: CenterRoundingRule = .towardsTopLeft) -> Scalar {
        let center = shape.center(rule)
        return self[center.row, center.column]
    }
    
}

extension ComplexMatrix {
    
    public func center(_ rule: CenterRoundingRule = .towardsTopLeft) -> Complex {
        let center = shape.center(rule)
        return self[center.row, center.column]
    }
    
}
