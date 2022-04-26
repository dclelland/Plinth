//
//  Transpose.swift
//  Plinth
//
//  Created by Daniel Clelland on 25/04/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == Float {
    
    public func transposed() -> Matrix {
        var output: Matrix = .zeros(shape: .init(rows: shape.columns, columns: shape.rows))
        vDSP_mtrans(elements, 1, &output.elements, 1, vDSP_Length(shape.columns), vDSP_Length(shape.rows))
        return output
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func transposed() -> ComplexMatrix {
        return ComplexMatrix(real: real.transposed(), imaginary: imaginary.transposed())
    }
    
}

extension Matrix where Scalar == Double {
    
    public func transposed() -> Matrix {
        var output: Matrix = .zeros(shape: .init(rows: shape.columns, columns: shape.rows))
        vDSP_mtransD(elements, 1, &output.elements, 1, vDSP_Length(shape.columns), vDSP_Length(shape.rows))
        return output
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func transposed() -> ComplexMatrix {
        return ComplexMatrix(real: real.transposed(), imaginary: imaginary.transposed())
    }
    
}
