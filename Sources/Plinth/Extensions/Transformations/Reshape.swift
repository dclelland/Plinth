//
//  Reshape.swift
//  Plinth
//
//  Created by Daniel Clelland on 4/05/22.
//

import Foundation

extension Matrix {
    
    public func reshaped(_ shape: Shape) -> Matrix {
        precondition(self.shape.count == shape.count)
        return Matrix(shape: shape, elements: elements)
    }
    
}

extension Matrix {
    
    public func asRow() -> Matrix {
        return reshaped(.row(length: shape.count))
    }
    
    public func asColumn() -> Matrix {
        return reshaped(.column(length: shape.count))
    }
    
}

extension ComplexMatrix {
    
    public func reshaped(_ shape: Shape) -> ComplexMatrix {
        precondition(self.shape.count == shape.count)
        return ComplexMatrix(shape: shape, elements: elements)
    }
    
}


extension ComplexMatrix {
    
    public func asRow() -> ComplexMatrix {
        return reshaped(.row(length: shape.count))
    }
    
    public func asColumn() -> ComplexMatrix {
        return reshaped(.column(length: shape.count))
    }
    
}
