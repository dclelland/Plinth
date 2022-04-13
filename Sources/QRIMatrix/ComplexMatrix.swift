//
//  ComplexMatrix.swift
//  QRIMatrix
//
//  Created by Daniel Clelland on 13/04/22.
//

import Foundation
import Accelerate

public typealias ComplexFloat = DSPComplex

public typealias ComplexFloatVector = DSPSplitComplex

public typealias ComplexDouble = DSPDoubleComplex

public typealias ComplexDoubleVector = DSPDoubleSplitComplex

public struct ComplexMatrix<Element: Numeric> {
    
    public var real: Matrix<Element>
    public var imaginary: Matrix<Element>
    
    public init(real: Matrix<Element>, imaginary: Matrix<Element>) {
        precondition(real.size == imaginary.size)
        self.real = real
        self.imaginary = imaginary
    }
    
}

extension ComplexMatrix {
    
    public var size: MatrixSize {
        return real.size
    }
    
}

extension ComplexMatrix {
    
    public static func zeros(size: MatrixSize) -> ComplexMatrix {
        return .init(real: .zeros(size: size), imaginary: .zeros(size: size))
    }
    
}

/*
extension ComplexMatrix where Element == Float {
    
    public subscript(row: Int, column: Int) -> ComplexFloat {
        get {
            return ComplexFloat(
                real: real[row, column],
                imag: imaginary[row, column]
            )
        }
        set {
            real[row, column] = newValue.real
            imaginary[row, column] = newValue.imag
        }
    }

    public subscript(row row: Int) -> [ComplexFloat] {
        get {
            return zip(real[row: row], imaginary[row: row]).map { real, imaginary in
                return ComplexFloat(real: real, imag: imaginary)
            }
        }
        set {
            real[row: row] = newValue.map { $0.real }
            imaginary[row: row] = newValue.map { $0.imag }
        }
    }

    public subscript(column column: Int) -> [ComplexFloat] {
        get {
            return zip(real[column: column], imaginary[column: column]).map { real, imaginary in
                return ComplexFloat(real: real, imag: imaginary)
            }
        }
        set {
            real[column: column] = newValue.map { $0.real }
            imaginary[column: column] = newValue.map { $0.imag }
        }
    }
    
}

extension ComplexMatrix: Sequence {
    
    public typealias Iterator = AnyIterator<Element>
    
    public func makeIterator() -> Iterator {
        return Iterator(elements.makeIterator())
    }
    
}

extension ComplexMatrix: Collection {
    
    public typealias Index = Int

    public var startIndex: Index {
        return elements.startIndex
    }

    public var endIndex: Index {
        return elements.endIndex
    }
    
    public func index(after index: Index) -> Index {
        return elements.index(after: index)
    }

    public subscript(_ index: Index) -> Element {
        return elements[index]
    }
    
}
*/

extension ComplexMatrix: Equatable {
    
    public static func == <Element>(lhs: ComplexMatrix<Element>, rhs: ComplexMatrix<Element>) -> Bool {
        return lhs.real == rhs.real && lhs.imaginary == rhs.imaginary
    }
    
}

extension ComplexMatrix: Hashable where Element: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(real)
        hasher.combine(imaginary)
    }
    
}

extension ComplexMatrix where Element == Float {
    
    @inlinable public mutating func withUnsafeMutableComplexVector<R>(_ body: (inout ComplexFloatVector) throws -> R) rethrows -> R {
        return try real.withUnsafeMutableBufferPointer { realPointer in
            return try imaginary.withUnsafeMutableBufferPointer { imaginaryPointer in
                var split = ComplexFloatVector(realp: realPointer.baseAddress!, imagp: imaginaryPointer.baseAddress!)
                return try body(&split)
            }
        }
    }
    
}

extension ComplexMatrix where Element == Double {
    
    @inlinable public mutating func withUnsafeMutableComplexVector<R>(_ body: (inout ComplexDoubleVector) throws -> R) rethrows -> R {
        return try real.withUnsafeMutableBufferPointer { realPointer in
            return try imaginary.withUnsafeMutableBufferPointer { imaginaryPointer in
                var split = ComplexDoubleVector(realp: realPointer.baseAddress!, imagp: imaginaryPointer.baseAddress!)
                return try body(&split)
            }
        }
    }
    
}
