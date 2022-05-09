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
        
        leftWorkspace = leftWorkspace.transposed()
        eigenvalues = eigenvalues.transposed()
        rightWorkspace = rightWorkspace.transposed()
        
        var leftEigenvector = ComplexMatrix<Scalar>.zeros(shape: leftWorkspace.shape)
        for row in leftWorkspace.shape.rowIndices {
            var column = 0
            while column < leftWorkspace.shape.columns {
                switch eigenvalues[column].imaginary.isZero {
                case true:
                    leftEigenvector[row, column] = Complex(leftWorkspace[row, column], 0.0)
                    column += 1
                case false:
                    leftEigenvector[row, column] = Complex(leftWorkspace[row, column], leftWorkspace[row, column + 1])
                    leftEigenvector[row, column + 1] = Complex(leftWorkspace[row, column], -leftWorkspace[row, column + 1])
                    column += 2
                }
            }
        }
        
        var rightEigenvector = ComplexMatrix<Scalar>.zeros(shape: rightWorkspace.shape)
        for row in rightWorkspace.shape.rowIndices {
            var column = 0
            while column < rightWorkspace.shape.columns {
                switch eigenvalues[column].imaginary.isZero {
                case true:
                    rightEigenvector[row, column] = Complex(rightWorkspace[row, column], 0.0)
                    column += 1
                case false:
                    rightEigenvector[row, column] = Complex(rightWorkspace[row, column], rightWorkspace[row, column + 1])
                    rightEigenvector[row, column + 1] = Complex(rightWorkspace[row, column], -rightWorkspace[row, column + 1])
                    column += 2
                }
            }
        }
        
        return Eigendecomposition(
            leftEigenvector: leftEigenvector,
            eigenvalues: eigenvalues,
            rightEigenvector: rightEigenvector
        )
    }
    
}
