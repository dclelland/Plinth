//
//  Reshape.swift
//  Plinth
//
//  Created by Daniel Clelland on 4/05/22.
//

import Foundation

public enum ReshapeOrder {
    
    case rowMajor
    case columnMajor
    
}

extension Matrix where Scalar == Float {
    
    public func reshaped(_ shape: Shape, order: ReshapeOrder = .rowMajor) -> Matrix {
        precondition(self.shape.count == shape.count)
        switch order {
        case .rowMajor:
            return Matrix(shape: shape, elements: elements)
        case .columnMajor:
            return Matrix(shape: shape, elements: transposed().elements)
        }
    }
    
}

extension Matrix where Scalar == Float {
    
    public func asRow(order: ReshapeOrder = .rowMajor) -> Matrix {
        return reshaped(.row(length: shape.count), order: order)
    }
    
    public func asColumn(order: ReshapeOrder = .rowMajor) -> Matrix {
        return reshaped(.column(length: shape.count), order: order)
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func reshaped(_ shape: Shape, order: ReshapeOrder = .rowMajor) -> ComplexMatrix {
        precondition(self.shape.count == shape.count)
        return ComplexMatrix(real: real.reshaped(shape, order: order), imaginary: imaginary.reshaped(shape, order: order))
    }
    
}


extension ComplexMatrix where Scalar == Float {
    
    public func asRow(order: ReshapeOrder = .rowMajor) -> ComplexMatrix {
        return reshaped(.row(length: shape.count), order: order)
    }
    
    public func asColumn(order: ReshapeOrder = .rowMajor) -> ComplexMatrix {
        return reshaped(.column(length: shape.count), order: order)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func reshaped(_ shape: Shape, order: ReshapeOrder = .rowMajor) -> Matrix {
        precondition(self.shape.count == shape.count)
        switch order {
        case .rowMajor:
            return Matrix(shape: shape, elements: elements)
        case .columnMajor:
            return Matrix(shape: shape, elements: transposed().elements)
        }
    }
    
}

extension Matrix where Scalar == Double {
    
    public func asRow(order: ReshapeOrder = .rowMajor) -> Matrix {
        return reshaped(.row(length: shape.count), order: order)
    }
    
    public func asColumn(order: ReshapeOrder = .rowMajor) -> Matrix {
        return reshaped(.column(length: shape.count), order: order)
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func reshaped(_ shape: Shape, order: ReshapeOrder = .rowMajor) -> ComplexMatrix {
        precondition(self.shape.count == shape.count)
        return ComplexMatrix(real: real.reshaped(shape, order: order), imaginary: imaginary.reshaped(shape, order: order))
    }
    
}


extension ComplexMatrix where Scalar == Double {
    
    public func asRow(order: ReshapeOrder = .rowMajor) -> ComplexMatrix {
        return reshaped(.row(length: shape.count), order: order)
    }
    
    public func asColumn(order: ReshapeOrder = .rowMajor) -> ComplexMatrix {
        return reshaped(.column(length: shape.count), order: order)
    }
    
}
