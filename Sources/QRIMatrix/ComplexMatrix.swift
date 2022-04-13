//
//  ComplexMatrix.swift
//  QRIMatrix
//
//  Created by Daniel Clelland on 13/04/22.
//

import Foundation
import Accelerate

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

extension ComplexMatrix {
    
    public subscript(row: Int, column: Int) -> Complex<Element> {
        get {
            return Complex<Element>(real: real[row, column], imaginary: imaginary[row, column])
        }
        set {
            real[row, column] = newValue.real
            imaginary[row, column] = newValue.imaginary
        }
    }

    public subscript(row row: Int) -> [Complex<Element>] {
        get {
            return zip(real[row: row], imaginary[row: row]).map { real, imaginary in
                return Complex<Element>(real: real, imaginary: imaginary)
            }
        }
        set {
            real[row: row] = newValue.map { $0.real }
            imaginary[row: row] = newValue.map { $0.imaginary }
        }
    }

    public subscript(column column: Int) -> [Complex<Element>] {
        get {
            return zip(real[column: column], imaginary[column: column]).map { real, imaginary in
                return Complex<Element>(real: real, imaginary: imaginary)
            }
        }
        set {
            real[column: column] = newValue.map { $0.real }
            imaginary[column: column] = newValue.map { $0.imaginary }
        }
    }
    
}

/*
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
    
    @inlinable public mutating func withUnsafeMutableSplitComplexVector<R>(_ body: (inout DSPSplitComplex) throws -> R) rethrows -> R {
        return try real.withUnsafeMutableBufferPointer { realPointer in
            return try imaginary.withUnsafeMutableBufferPointer { imaginaryPointer in
                var split = DSPSplitComplex(realp: realPointer.baseAddress!, imagp: imaginaryPointer.baseAddress!)
                return try body(&split)
            }
        }
    }
    
}

extension ComplexMatrix where Element == Double {
    
    @inlinable public mutating func withUnsafeMutableSplitComplexVector<R>(_ body: (inout DSPDoubleSplitComplex) throws -> R) rethrows -> R {
        return try real.withUnsafeMutableBufferPointer { realPointer in
            return try imaginary.withUnsafeMutableBufferPointer { imaginaryPointer in
                var split = DSPDoubleSplitComplex(realp: realPointer.baseAddress!, imagp: imaginaryPointer.baseAddress!)
                return try body(&split)
            }
        }
    }
    
}
