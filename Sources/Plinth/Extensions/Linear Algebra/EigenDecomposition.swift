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
    
    public func eigenDecomposition() -> EigenDecomposition<Scalar> {
        fatalError()
    }
    
}

extension Matrix where Scalar == Double {
    
    public func eigenDecomposition() -> EigenDecomposition<Scalar> {
        fatalError()
        
//        guard lhs.rows == lhs.columns else {
//            throw EigenDecompositionError.matrixNotSquare
//        }
//
//        // dgeev_ needs column-major matrices, so transpose lhs.
//        var matrixGrid: [__CLPK_doublereal] = transpose(lhs).grid
//        var matrixRowCount = __CLPK_integer(lhs.rows)
//        let matrixColCount = matrixRowCount
//        var eigenValueCount = matrixRowCount
//        var leftEigenVectorCount = matrixRowCount
//        var rightEigenVectorCount = matrixRowCount
//
//        var workspaceQuery: Double = 0.0
//        var workspaceSize = __CLPK_integer(-1)
//        var error: __CLPK_integer = 0
//
//        var eigenValueRealParts = [Double](repeating: 0, count: Int(eigenValueCount))
//        var eigenValueImaginaryParts = [Double](repeating: 0, count: Int(eigenValueCount))
//        var leftEigenVectorWork = [Double](repeating: 0, count: Int(leftEigenVectorCount * matrixColCount))
//        var rightEigenVectorWork = [Double](repeating: 0, count: Int(rightEigenVectorCount * matrixColCount))
//
//        var decompositionJobVL: [CChar] = [0x56, 0x00] // "V" (compute)
//        var decompositionJobVR: [CChar] = [0x56, 0x00] // "V" (compute)
//        // Call dgeev to find out how much workspace to allocate
//        dgeev_(&decompositionJobVL, &decompositionJobVR, &matrixRowCount, &matrixGrid, &eigenValueCount, &eigenValueRealParts, &eigenValueImaginaryParts, &leftEigenVectorWork, &leftEigenVectorCount, &rightEigenVectorWork, &rightEigenVectorCount, &workspaceQuery, &workspaceSize, &error)
//        if error != 0 {
//            throw EigenDecompositionError.matrixNotDecomposable
//        }
//
//        // Allocate the workspace and call dgeev again to do the actual decomposition
//        var workspace = [Double](repeating: 0.0, count: Int(workspaceQuery))
//        workspaceSize = __CLPK_integer(workspaceQuery)
//        dgeev_(&decompositionJobVL, &decompositionJobVR, &matrixRowCount, &matrixGrid, &eigenValueCount, &eigenValueRealParts, &eigenValueImaginaryParts, &leftEigenVectorWork, &leftEigenVectorCount, &rightEigenVectorWork, &rightEigenVectorCount, &workspace, &workspaceSize, &error)
//        if error != 0 {
//            throw EigenDecompositionError.matrixNotDecomposable
//        }
//
//        return MatrixEigenDecompositionResult<Double>(rowCount: lhs.rows, eigenValueRealParts: eigenValueRealParts, eigenValueImaginaryParts: eigenValueImaginaryParts, leftEigenVectorWork: leftEigenVectorWork, rightEigenVectorWork: rightEigenVectorWork)
    }
    
}
