//
//  EigenDecomposition.swift
//  Plinth
//
//  Created by Daniel Clelland on 5/05/22.
//

import Foundation
import Accelerate
import Numerics

public struct EigenDecomposition<Scalar> where Scalar: Real {
    
    public let eigenvalues: [Complex<Scalar>]
    public let leftEigenvectors: ComplexMatrix<Scalar>
    public let rightEigenvectors: ComplexMatrix<Scalar>
    
}

extension Matrix where Scalar == Float {
    
    public func eigenvalues() -> ComplexMatrix<Scalar> {
        fatalError()
    }
    
}

extension Matrix where Scalar == Double {
    
    public func eigenvalues() -> ComplexMatrix<Scalar> {
        precondition(shape.isSquare)
        
        var input = transposed()
        var length = __CLPK_integer(shape.length)
        var leftComputed: [CChar] = [0x4E, 0x00]
        var rightComputed: [CChar] = [0x4E, 0x00]

        var eigenvalues = ComplexMatrix<Scalar>.zeros(shape: .row(length: shape.length))
        var leftWorkspace = Matrix.zeros(shape: shape)
        var rightWorkspace = Matrix.zeros(shape: shape)
        
        var workspace = [Scalar]()
        var workspaceQuery = Scalar(0.0)
        var workspaceSize = __CLPK_integer(-1)
        var error = __CLPK_integer(0)
        
        withUnsafeMutablePointer(to: &length) { length in
            dgeev_(&leftComputed, &rightComputed, length, &input.elements, length, &eigenvalues.real.elements, &eigenvalues.imaginary.elements, &leftWorkspace.elements, length, &rightWorkspace.elements, length, &workspaceQuery, &workspaceSize, &error)
            
            workspace = [Scalar](repeating: .zero, count: Int(workspaceQuery))
            workspaceSize = __CLPK_integer(workspaceQuery)
            
            dgeev_(&leftComputed, &rightComputed, length, &input.elements, length, &eigenvalues.real.elements, &eigenvalues.imaginary.elements, &leftWorkspace.elements, length, &rightWorkspace.elements, length, &workspace, &workspaceSize, &error)
        }
        
        precondition(error == 0)
        
        return eigenvalues
    }
    
}
