//
//  Eigendecomposition.swift
//  Plinth
//
//  Created by Daniel Clelland on 9/05/22.
//

import Foundation
import Accelerate
import Numerics

public enum EigendecompositionError<Scalar>: LocalizedError {
    
    case illegalValue(matrix: Matrix<Scalar>, code: Int32)
    case computationFailed(matrix: Matrix<Scalar>, code: Int32)
    
    public var errorDescription: String? {
        switch self {
        case .illegalValue(_, let code):
            return "Matrix eigendecomposition error: Illegal value (\(code))"
        case .computationFailed(_, let code):
            return "Matrix eigendecomposition error: Computation failed (\(code))"
        }
    }
    
}

public struct EigendecompositionComponents {
    
    internal enum Computed {
        
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
    
    internal let leftEigenvectors: Computed
    internal let rightEigenvectors: Computed
    
    public static let eigenvalues = EigendecompositionComponents(leftEigenvectors: .notComputed, rightEigenvectors: .notComputed)
    public static let leftEigenvectors = EigendecompositionComponents(leftEigenvectors: .computed, rightEigenvectors: .notComputed)
    public static let rightEigenvectors = EigendecompositionComponents(leftEigenvectors: .notComputed, rightEigenvectors: .computed)
    public static let allComponents = EigendecompositionComponents(leftEigenvectors: .computed, rightEigenvectors: .computed)
    
}

public struct Eigendecomposition<Scalar> where Scalar: Real {
    
    public let leftEigenvectors: ComplexMatrix<Scalar>
    public let eigenvalues: ComplexMatrix<Scalar>
    public let rightEigenvectors: ComplexMatrix<Scalar>
    
    internal init(leftEigenvectors: ComplexMatrix<Scalar>, eigenvalues: ComplexMatrix<Scalar>, rightEigenvectors: ComplexMatrix<Scalar>) {
        self.leftEigenvectors = leftEigenvectors
        self.eigenvalues = eigenvalues
        self.rightEigenvectors = rightEigenvectors
    }
    
    internal init(leftWorkspace: Matrix<Scalar>, eigenvalues: ComplexMatrix<Scalar>, rightWorkspace: Matrix<Scalar>) {
        self.leftEigenvectors = Self.eigenvectors(from: leftWorkspace, eigenvalues: eigenvalues)
        self.eigenvalues = eigenvalues
        self.rightEigenvectors = Self.eigenvectors(from: rightWorkspace, eigenvalues: eigenvalues)
    }
    
    private static func eigenvectors(from workspace: Matrix<Scalar>, eigenvalues: ComplexMatrix<Scalar>) -> ComplexMatrix<Scalar> {
        var eigenvectors: ComplexMatrix<Scalar> = .zeros(shape: workspace.shape)
        for row in workspace.shape.rowIndices {
            var column = 0
            while column < workspace.shape.columns {
                let eigenvalue = eigenvalues[0, column]
                switch eigenvalue.imaginary.isZero || eigenvalue.imaginary.isNaN {
                case true:
                    eigenvectors[row, column] = Complex(workspace[row, column], .zero)
                    column += 1
                case false:
                    eigenvectors[row, column] = Complex(workspace[row, column], workspace[row, column + 1])
                    eigenvectors[row, column + 1] = Complex(workspace[row, column], -workspace[row, column + 1])
                    column += 2
                }
            }
        }
        return eigenvectors
    }
    
}

extension Eigendecomposition {
    
    public enum SortOrder {
        
        case realAscending
        case realDescending
        case magnitudeAscending
        case magnitudeDescending
        
        internal func areInIncreasingOrder(_ lhs: Complex<Scalar>, _ rhs: Complex<Scalar>) -> Bool {
            switch self {
            case .realAscending:
                return lhs.real < rhs.real
            case .realDescending:
                return lhs.real > rhs.real
            case .magnitudeAscending:
                return lhs.magnitude < rhs.magnitude
            case .magnitudeDescending:
                return lhs.magnitude > rhs.magnitude
            }
        }
        
    }
    
    public func sorted(_ sortOrder: SortOrder) -> Eigendecomposition {
        return sorted(by: sortOrder.areInIncreasingOrder)
    }
    
    public func sorted(by areInIncreasingOrder: (Complex<Scalar>, Complex<Scalar>) throws -> Bool) rethrows -> Eigendecomposition {
        let sorted = try eigenvalues.enumerated().sorted { lhs, rhs in
            return try areInIncreasingOrder(lhs.element, rhs.element)
        }
        
        return Eigendecomposition(
            leftEigenvectors: .init(shape: leftEigenvectors.shape) { row, column in
                return leftEigenvectors[sorted[row].offset, column]
            },
            eigenvalues: ComplexMatrix(row: sorted.map(\.element)),
            rightEigenvectors: .init(shape: rightEigenvectors.shape) { row, column in
                return rightEigenvectors[row, sorted[column].offset]
            }
        )
    }
    
}

extension Matrix where Scalar == Float {
    
    public func eigendecomposition(computing components: EigendecompositionComponents = .allComponents) throws -> Eigendecomposition<Scalar> {
        precondition(shape.isSquare)
        
        var input = transposed()
        var length = __CLPK_integer(shape.length)
        var leftFlag = components.leftEigenvectors.flag
        var rightFlag = components.rightEigenvectors.flag

        var eigenvalues = ComplexMatrix<Scalar>.zeros(shape: .row(length: shape.length))
        var leftWorkspace = Matrix.zeros(shape: shape)
        var rightWorkspace = Matrix.zeros(shape: shape)
        
        var workspace = [Scalar]()
        var workspaceQuery = Scalar(0.0)
        var workspaceSize = __CLPK_integer(-1)
        var error = __CLPK_integer(0)
        
        withUnsafeMutablePointer(to: &length) { length in
            sgeev_(&leftFlag, &rightFlag, length, &input.elements, length, &eigenvalues.real.elements, &eigenvalues.imaginary.elements, &leftWorkspace.elements, length, &rightWorkspace.elements, length, &workspaceQuery, &workspaceSize, &error)
            
            workspace = [Scalar](repeating: .zero, count: Int(workspaceQuery))
            workspaceSize = __CLPK_integer(workspaceQuery)
            
            sgeev_(&leftFlag, &rightFlag, length, &input.elements, length, &eigenvalues.real.elements, &eigenvalues.imaginary.elements, &leftWorkspace.elements, length, &rightWorkspace.elements, length, &workspace, &workspaceSize, &error)
        }

        if error < 0 {
            throw EigendecompositionError.illegalValue(matrix: self, code: error)
        }
        
        if error > 0 {
            throw EigendecompositionError.computationFailed(matrix: self, code: error)
        }
        
        return Eigendecomposition(
            leftWorkspace: leftWorkspace.transposed(),
            eigenvalues: eigenvalues,
            rightWorkspace: rightWorkspace.transposed()
        )
    }
    
}

extension Matrix where Scalar == Double {
    
    public func eigendecomposition(computing components: EigendecompositionComponents = .allComponents) throws -> Eigendecomposition<Scalar> {
        precondition(shape.isSquare)
        
        var input = transposed()
        var length = __CLPK_integer(shape.length)
        var leftFlag = components.leftEigenvectors.flag
        var rightFlag = components.rightEigenvectors.flag

        var eigenvalues = ComplexMatrix<Scalar>.zeros(shape: .row(length: shape.length))
        var leftWorkspace = Matrix.zeros(shape: shape)
        var rightWorkspace = Matrix.zeros(shape: shape)
        
        var workspace = [Scalar]()
        var workspaceQuery = Scalar(0.0)
        var workspaceSize = __CLPK_integer(-1)
        var error = __CLPK_integer(0)
        
        withUnsafeMutablePointer(to: &length) { length in
            dgeev_(&leftFlag, &rightFlag, length, &input.elements, length, &eigenvalues.real.elements, &eigenvalues.imaginary.elements, &leftWorkspace.elements, length, &rightWorkspace.elements, length, &workspaceQuery, &workspaceSize, &error)
            
            workspace = [Scalar](repeating: .zero, count: Int(workspaceQuery))
            workspaceSize = __CLPK_integer(workspaceQuery)
            
            dgeev_(&leftFlag, &rightFlag, length, &input.elements, length, &eigenvalues.real.elements, &eigenvalues.imaginary.elements, &leftWorkspace.elements, length, &rightWorkspace.elements, length, &workspace, &workspaceSize, &error)
        }
        
        if error < 0 {
            throw EigendecompositionError.illegalValue(matrix: self, code: error)
        }
        
        if error > 0 {
            throw EigendecompositionError.computationFailed(matrix: self, code: error)
        }
        
        return Eigendecomposition(
            leftWorkspace: leftWorkspace.transposed(),
            eigenvalues: eigenvalues,
            rightWorkspace: rightWorkspace.transposed()
        )
    }
    
}
