//
//  Eigendecomposition.swift
//  Plinth
//
//  Created by Daniel Clelland on 9/05/22.
//

import Foundation
import Accelerate
import Numerics

public struct EigendecompositionOptions {
    
    public enum Computed {
        
        case computed
        case notComputed
        
        internal var flag: [CChar] {
            switch self {
            case .computed:
                return [0x56, 0x00]
            case .notComputed:
                return [0x4E, 0x00]
            }
        }
        
    }
    
    public let leftEigenvector: Computed
    public let rightEigenvector: Computed
    
    public static let eigenvalues = EigendecompositionOptions(leftEigenvector: .notComputed, rightEigenvector: .notComputed)
    public static let leftEigenvector = EigendecompositionOptions(leftEigenvector: .computed, rightEigenvector: .notComputed)
    public static let rightEigenvector = EigendecompositionOptions(leftEigenvector: .notComputed, rightEigenvector: .computed)
    public static let full = EigendecompositionOptions(leftEigenvector: .computed, rightEigenvector: .computed)
    
}

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

extension Matrix where Scalar == Float {
    
    public func eigendecomposition(_ options: EigendecompositionOptions = .full) -> Eigendecomposition<Scalar> {
        precondition(shape.isSquare)
        
        var input = transposed()
        var length = __CLPK_integer(shape.length)
        var leftComputed = options.leftEigenvector.flag
        var rightComputed = options.rightEigenvector.flag

        var eigenvalues = ComplexMatrix<Scalar>.zeros(shape: .row(length: shape.length))
        var leftWorkspace = Matrix.zeros(shape: shape)
        var rightWorkspace = Matrix.zeros(shape: shape)
        
        var workspace = [Scalar]()
        var workspaceQuery = Scalar(0.0)
        var workspaceSize = __CLPK_integer(-1)
        var error = __CLPK_integer(0)
        
        withUnsafeMutablePointer(to: &length) { length in
            sgeev_(&leftComputed, &rightComputed, length, &input.elements, length, &eigenvalues.real.elements, &eigenvalues.imaginary.elements, &leftWorkspace.elements, length, &rightWorkspace.elements, length, &workspaceQuery, &workspaceSize, &error)
            
            workspace = [Scalar](repeating: .zero, count: Int(workspaceQuery))
            workspaceSize = __CLPK_integer(workspaceQuery)
            
            sgeev_(&leftComputed, &rightComputed, length, &input.elements, length, &eigenvalues.real.elements, &eigenvalues.imaginary.elements, &leftWorkspace.elements, length, &rightWorkspace.elements, length, &workspace, &workspaceSize, &error)
        }
        
        precondition(error == 0)
        
        return Eigendecomposition(
            leftWorkspace: leftWorkspace.transposed(),
            eigenvalues: eigenvalues.transposed(),
            rightWorkspace: rightWorkspace.transposed()
        )
    }
    
}

extension Matrix where Scalar == Double {
    
    public func eigendecomposition(_ options: EigendecompositionOptions = .full) -> Eigendecomposition<Scalar> {
        precondition(shape.isSquare)
        
        var input = transposed()
        var length = __CLPK_integer(shape.length)
        var leftComputed = options.leftEigenvector.flag
        var rightComputed = options.rightEigenvector.flag

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
