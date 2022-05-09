//
//  Eigendecomposition.swift
//  Plinth
//
//  Created by Daniel Clelland on 9/05/22.
//

import Foundation
import Accelerate
import Numerics

public struct Eigendecomposition<Scalar> where Scalar: Real {
    
    public let leftEigenvector: ComplexMatrix<Scalar>
    public let eigenvalues: ComplexMatrix<Scalar>
    public let rightEigenvector: ComplexMatrix<Scalar>
    
    internal init(leftWorkspace: Matrix<Scalar>, eigenvalues: ComplexMatrix<Scalar>, rightWorkspace: Matrix<Scalar>) {
        self.leftEigenvector = Self.eigenvector(from: leftWorkspace, eigenvalues: eigenvalues)
        self.eigenvalues = eigenvalues
        self.rightEigenvector = Self.eigenvector(from: rightWorkspace, eigenvalues: eigenvalues)
    }
    
    private static func eigenvector(from workspace: Matrix<Scalar>, eigenvalues: ComplexMatrix<Scalar>) -> ComplexMatrix<Scalar> {
        var eigenvector: ComplexMatrix<Scalar> = .zeros(shape: workspace.shape)
        for row in workspace.shape.rowIndices {
            var column = 0
            while column < workspace.shape.columns {
                switch eigenvalues[column, 0].imaginary.isZero {
                case true:
                    eigenvector[row, column] = Complex(workspace[row, column], .zero)
                    column += 1
                case false:
                    eigenvector[row, column] = Complex(workspace[row, column], workspace[row, column + 1])
                    eigenvector[row, column + 1] = Complex(workspace[row, column], -workspace[row, column + 1])
                    column += 2
                }
            }
        }
        return eigenvector
    }
    
}

extension Matrix where Scalar == Double {
    
    public func eigendecomposition() -> Eigendecomposition<Scalar> {
        precondition(shape.isSquare)
        
        var input = transposed()
        var length = __CLPK_integer(shape.length)
        var leftComputed: [CChar] = [0x56, 0x00]
        var rightComputed: [CChar] = [0x56, 0x00]

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
        
        return Eigendecomposition(
            leftWorkspace: leftWorkspace.transposed(),
            eigenvalues: eigenvalues.transposed(),
            rightWorkspace: rightWorkspace.transposed()
        )
    }
    
}
