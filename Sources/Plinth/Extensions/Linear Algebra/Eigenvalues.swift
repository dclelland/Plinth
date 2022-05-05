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

// TODO: Looks like computing the eigenvectors is optional
extension Matrix where Scalar == Double {
    
    public func eigenvalues() -> ComplexMatrix<Scalar> {
        precondition(shape.isSquare)
        
//        // dgeev_ needs column-major matrices, so transpose lhs.
//        var matrixGrid: [__CLPK_doublereal] = transpose(lhs).grid
//        var matrixRowCount = __CLPK_integer(lhs.rows)
//        let matrixColCount = matrixRowCount
//        var eigenValueCount = matrixRowCount
//        var leftEigenVectorCount = matrixRowCount
//        var rightEigenVectorCount = matrixRowCount
        
        var input = transposed()
        var length = __CLPK_integer(shape.length)

        var eigenvalues = ComplexMatrix<Scalar>.zeros(shape: .row(length: shape.length))
        var leftWorkspace = Matrix.zeros(shape: shape)
        var rightWorkspace = Matrix.zeros(shape: shape)
        
        var workspace = [Scalar]()
        var workspaceQuery = Scalar(0.0)
        var workspaceSize = __CLPK_integer(-1)
        var error = __CLPK_integer(0)
        
        print("Companion matrix before")
        print(input)
        
        var decompositionJobVL: [CChar] = [0x56, 0x00] // "V" (compute)
        var decompositionJobVR: [CChar] = [0x56, 0x00] // "V" (compute)
        withUnsafeMutablePointer(to: &length) { length in
            dgeev_(&decompositionJobVL, &decompositionJobVR, length, &input.elements, length, &eigenvalues.real.elements, &eigenvalues.imaginary.elements, &leftWorkspace.elements, length, &rightWorkspace.elements, length, &workspaceQuery, &workspaceSize, &error)
            workspace = [Scalar](repeating: .zero, count: Int(workspaceQuery))
            workspaceSize = __CLPK_integer(workspaceQuery)
            dgeev_(&decompositionJobVL, &decompositionJobVR, length, &input.elements, length, &eigenvalues.real.elements, &eigenvalues.imaginary.elements, &leftWorkspace.elements, length, &rightWorkspace.elements, length, &workspace, &workspaceSize, &error)
        }
        
        precondition(error == 0)
        
        print("Companion matrix after")
        print(input)
        print("Eigenvalues")
        print(eigenvalues)
        print("Left workspace")
        print(leftWorkspace)
        print("Right workspace")
        print(rightWorkspace)
        print("Workspace")
        print(workspace)
        
        return eigenvalues
    }
    
}
