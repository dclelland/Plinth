//
//  Inset.swift
//  Plinth
//
//  Created by Daniel Clelland on 26/04/22.
//

import Foundation

extension Matrix where Scalar == Float {
    
    public func inset(to shape: Shape) -> Matrix {
        let top = Int((Scalar(self.shape.rows - shape.rows) / 2.0).rounded(.up))
        let left = Int((Scalar(self.shape.columns - shape.columns) / 2.0).rounded(.up))
        let bottom = Int((Scalar(self.shape.rows - shape.rows) / 2.0).rounded(.down))
        let right = Int((Scalar(self.shape.columns - shape.columns) / 2.0).rounded(.down))
        return inset(top: top, left: left, bottom: bottom, right: right)
    }
    
    public func inset(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> Matrix {
        let rows = (top)...(shape.rows - bottom - 1)
        let columns = (left)...(shape.columns - right - 1)
        return self[rows, columns]
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    public func inset(to shape: Shape) -> ComplexMatrix {
        return ComplexMatrix(real: real.inset(to: shape), imaginary: imaginary.inset(to: shape))
    }
    
    public func inset(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> ComplexMatrix {
        return ComplexMatrix(real: real.inset(top: top, left: left, bottom: bottom, right: right), imaginary: imaginary.inset(top: top, left: left, bottom: bottom, right: right))
    }
    
}

extension Matrix where Scalar == Double {
    
    public func inset(to shape: Shape) -> Matrix {
        let top = Int((Scalar(self.shape.rows - shape.rows) / 2.0).rounded(.up))
        let left = Int((Scalar(self.shape.columns - shape.columns) / 2.0).rounded(.up))
        let bottom = Int((Scalar(self.shape.rows - shape.rows) / 2.0).rounded(.down))
        let right = Int((Scalar(self.shape.columns - shape.columns) / 2.0).rounded(.down))
        return inset(top: top, left: left, bottom: bottom, right: right)
    }
    
    public func inset(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> Matrix {
        let rows = (top)...(shape.rows - bottom - 1)
        let columns = (left)...(shape.columns - right - 1)
        return self[rows, columns]
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func inset(to shape: Shape) -> ComplexMatrix {
        return ComplexMatrix(real: real.inset(to: shape), imaginary: imaginary.inset(to: shape))
    }
    
    public func inset(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> ComplexMatrix {
        return ComplexMatrix(real: real.inset(top: top, left: left, bottom: bottom, right: right), imaginary: imaginary.inset(top: top, left: left, bottom: bottom, right: right))
    }
    
}
