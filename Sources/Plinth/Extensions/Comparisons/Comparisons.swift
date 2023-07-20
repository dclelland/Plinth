//
//  LessThan.swift
//  Plinth
//
//  Created by Daniel Clelland on 14/05/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    @inlinable public static func < (left: Matrix, right: Scalar) -> Matrix {
        return left.threshold(to: right, with: .signedConstant(-1.0)).threshold(to: .zero, with: .zeroFill)
    }
    
    @inlinable public static func <= (left: Matrix, right: Scalar) -> Matrix {
        return left.threshold(to: right.nextUp, with: .signedConstant(-1.0)).threshold(to: .zero, with: .zeroFill)
    }
    
    @inlinable public static func > (left: Matrix, right: Scalar) -> Matrix {
        return left.threshold(to: right.nextUp, with: .signedConstant(1.0)).threshold(to: .zero, with: .zeroFill)
    }
    
    @inlinable public static func >= (left: Matrix, right: Scalar) -> Matrix {
        return left.threshold(to: right, with: .signedConstant(1.0)).threshold(to: .zero, with: .zeroFill)
    }
    
}

extension Matrix where Scalar == Float {
    
    @inlinable public static func == (left: Matrix, right: Scalar) -> Matrix {
        return (left - right).absolute().threshold(to: .zero.nextUp, with: .signedConstant(-1.0)).threshold(to: .zero, with: .zeroFill)
    }
    
    @inlinable public static func !== (left: Matrix, right: Scalar) -> Matrix {
        return (left - right).absolute().threshold(to: .zero.nextUp, with: .signedConstant(1.0)).threshold(to: .zero, with: .zeroFill)
    }
    
}

extension Matrix where Scalar == Double {
    
    @inlinable public static func < (left: Matrix, right: Scalar) -> Matrix {
        return left.threshold(to: right, with: .signedConstant(-1.0)).threshold(to: .zero, with: .zeroFill)
    }
    
    @inlinable public static func <= (left: Matrix, right: Scalar) -> Matrix {
        return left.threshold(to: right.nextUp, with: .signedConstant(-1.0)).threshold(to: .zero, with: .zeroFill)
    }
    
    @inlinable public static func > (left: Matrix, right: Scalar) -> Matrix {
        return left.threshold(to: right.nextUp, with: .signedConstant(1.0)).threshold(to: .zero, with: .zeroFill)
    }
    
    @inlinable public static func >= (left: Matrix, right: Scalar) -> Matrix {
        return left.threshold(to: right, with: .signedConstant(1.0)).threshold(to: .zero, with: .zeroFill)
    }
    
}
    
extension Matrix where Scalar == Double {
    
    @inlinable public static func == (left: Matrix, right: Scalar) -> Matrix {
        return (left - right).absolute().threshold(to: .zero.nextUp, with: .signedConstant(-1.0)).threshold(to: .zero, with: .zeroFill)
    }
    
    @inlinable public static func !== (left: Matrix, right: Scalar) -> Matrix {
        return (left - right).absolute().threshold(to: .zero.nextUp, with: .signedConstant(1.0)).threshold(to: .zero, with: .zeroFill)
    }
    
}
