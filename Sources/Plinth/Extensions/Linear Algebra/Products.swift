//
//  Products.swift
//  Products
//
//  Created by Daniel Clelland on 28/04/22.
//

import Foundation

extension Matrix where Scalar == Float {
    
    public func innerProduct() -> Matrix {
        return transposed() <*> self
    }
    
    public func outerProduct() -> Matrix {
        return self <*> transposed()
    }
    
}

extension Matrix where Scalar == Double {
    
    public func innerProduct() -> Matrix {
        return transposed() <*> self
    }
    
    public func outerProduct() -> Matrix {
        return self <*> transposed()
    }
    
}
