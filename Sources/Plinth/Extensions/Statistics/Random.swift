//
//  Random.swift
//  Plinth
//
//  Created by Daniel Clelland on 3/05/22.
//

import Foundation
import Accelerate

public enum RandomDistribution: Int {
    
    case uniformUnitInterval = 1
    case uniformSymmetricUnitInterval = 2
    case gaussian = 3
    
}

public enum ComplexRandomDistribution: Int {
    
    case uniformUnitInterval = 1
    case uniformSymmetricUnitInterval = 2
    case gaussian = 3
    case uniformDisc = 4
    case uniformCircle = 5
    
}

extension Matrix where Scalar == Float {
    
    public static func random(shape: Shape, in range: Range<Scalar>) -> Matrix {
        return Matrix(shape: shape, Scalar.random(in: range))
    }
    
    public static func random<T>(shape: Shape, in range: Range<Scalar>, using generator: inout T) -> Matrix where T : RandomNumberGenerator {
        return Matrix(shape: shape, Scalar.random(in: range, using: &generator))
    }
    
    public static func random(shape: Shape, in range: ClosedRange<Scalar>) -> Matrix {
        return Matrix(shape: shape, Scalar.random(in: range))
    }
    
    public static func random<T>(shape: Shape, in range: ClosedRange<Scalar>, using generator: inout T) -> Matrix where T : RandomNumberGenerator {
        return Matrix(shape: shape, Scalar.random(in: range, using: &generator))
    }
    
}

extension Matrix where Scalar == Float {
    
    private static var seed: [__CLPK_integer] = [0, 0, 0, 1]
    
    public static func random(shape: Shape, distribution: RandomDistribution) -> Matrix {
        var count = __CLPK_integer(shape.count)
        var code = __CLPK_integer(distribution.rawValue)
        var workspace = [Scalar](repeating: .zero, count: shape.count)
        
        withUnsafeMutablePointer(to: &count) { count in
            slarnv_(&code, &seed, count, &workspace)
        }
        
        return .init(shape: shape, elements: workspace)
    }
    
}
    
extension ComplexMatrix where Scalar == Float {
    
    private static var seed: [__CLPK_integer] = [0, 0, 0, 1]
    
    public static func random(shape: Shape, distribution: ComplexRandomDistribution) -> ComplexMatrix {
        var count = __CLPK_integer(shape.count)
        var code = __CLPK_integer(distribution.rawValue)
        var workspace = [__CLPK_complex](repeating: __CLPK_complex(), count: shape.count)
        
        withUnsafeMutablePointer(to: &count) { count in
            clarnv_(&code, &seed, count, &workspace)
        }
        
        return .init(real: .init(shape: shape, elements: workspace.map(\.r)), imaginary: .init(shape: shape, elements: workspace.map(\.i)))
    }
    
}

extension Matrix where Scalar == Double {
    
    public static func random(shape: Shape, in range: Range<Scalar>) -> Matrix {
        return Matrix(shape: shape, Scalar.random(in: range))
    }
    
    public static func random<T>(shape: Shape, in range: Range<Scalar>, using generator: inout T) -> Matrix where T : RandomNumberGenerator {
        return Matrix(shape: shape, Scalar.random(in: range, using: &generator))
    }
    
    public static func random(shape: Shape, in range: ClosedRange<Scalar>) -> Matrix {
        return Matrix(shape: shape, Scalar.random(in: range))
    }
    
    public static func random<T>(shape: Shape, in range: ClosedRange<Scalar>, using generator: inout T) -> Matrix where T : RandomNumberGenerator {
        return Matrix(shape: shape, Scalar.random(in: range, using: &generator))
    }
    
}

extension Matrix where Scalar == Double {
    
    private static var seed: [__CLPK_integer] = [0, 0, 0, 1]
    
    public static func random(shape: Shape, distribution: RandomDistribution) -> Matrix {
        var count = __CLPK_integer(shape.count)
        var code = __CLPK_integer(distribution.rawValue)
        var workspace = [Scalar](repeating: .zero, count: shape.count)
        
        withUnsafeMutablePointer(to: &count) { count in
            dlarnv_(&code, &seed, count, &workspace)
        }
        
        return .init(shape: shape, elements: workspace)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    private static var seed: [__CLPK_integer] = [0, 0, 0, 1]
    
    public static func random(shape: Shape, distribution: ComplexRandomDistribution = .uniformUnitInterval) -> ComplexMatrix {
        var count = __CLPK_integer(shape.count)
        var code = __CLPK_integer(distribution.rawValue)
        var workspace = [__CLPK_doublecomplex](repeating: __CLPK_doublecomplex(), count: shape.count)
        
        withUnsafeMutablePointer(to: &count) { count in
            zlarnv_(&code, &seed, count, &workspace)
        }
        
        return .init(real: .init(shape: shape, elements: workspace.map(\.r)), imaginary: .init(shape: shape, elements: workspace.map(\.i)))
    }
    
}
