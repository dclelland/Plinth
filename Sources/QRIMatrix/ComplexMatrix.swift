//
//  ComplexMatrix.swift
//  QRIMatrix
//
//  Created by Daniel Clelland on 13/04/22.
//

import Foundation
import Accelerate

public struct ComplexMatrix<Scalar: Numeric> {
    
    public var real: Matrix<Scalar>
    public var imaginary: Matrix<Scalar>
    
    public init(real: Matrix<Scalar>, imaginary: Matrix<Scalar>) {
        precondition(real.size == imaginary.size)
        self.real = real
        self.imaginary = imaginary
    }
    
}

extension ComplexMatrix {
    
    public init(size: MatrixSize, elements: [Complex<Scalar>]) {
        precondition(size.count == elements.count)
        self.real = .init(size: size, elements: elements.map { $0.real })
        self.imaginary = .init(size: size, elements: elements.map { $0.imaginary })
    }
    
    public init(size: MatrixSize, _ closure: (_ row: Int, _ column: Int) throws -> Complex<Scalar>) rethrows {
        var elements: [Complex<Scalar>] = []
        elements.reserveCapacity(size.count)
        for row in 0..<size.rows {
            for column in 0..<size.columns {
                elements.append(try closure(row, column))
            }
        }
        self.init(size: size, elements: elements)
    }
    
}

extension ComplexMatrix {
    
    public init(_ element: Complex<Scalar>) {
        self.init(size: .init(), elements: [element])
    }
    
    public init(_ elements: [Complex<Scalar>]) {
        self.init(size: .init(columns: elements.count), elements: elements)
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
    
    public subscript(row: Int, column: Int) -> Complex<Scalar> {
        get {
            return Complex<Scalar>(real: real[row, column], imaginary: imaginary[row, column])
        }
        set {
            real[row, column] = newValue.real
            imaginary[row, column] = newValue.imaginary
        }
    }

    public subscript(row row: Int) -> [Complex<Scalar>] {
        get {
            return zip(real[row: row], imaginary[row: row]).map { real, imaginary in
                return Complex<Scalar>(real: real, imaginary: imaginary)
            }
        }
        set {
            real[row: row] = newValue.map { $0.real }
            imaginary[row: row] = newValue.map { $0.imaginary }
        }
    }

    public subscript(column column: Int) -> [Complex<Scalar>] {
        get {
            return zip(real[column: column], imaginary[column: column]).map { real, imaginary in
                return Complex<Scalar>(real: real, imaginary: imaginary)
            }
        }
        set {
            real[column: column] = newValue.map { $0.real }
            imaginary[column: column] = newValue.map { $0.imaginary }
        }
    }
    
}

extension ComplexMatrix: ExpressibleByIntegerLiteral where Scalar == IntegerLiteralType {

    public init(integerLiteral value: Scalar) {
        self.init(Complex<Scalar>(integerLiteral: value))
    }

}

extension ComplexMatrix: ExpressibleByFloatLiteral where Scalar == FloatLiteralType {

    public init(floatLiteral value: Scalar) {
        self.init(Complex<Scalar>(floatLiteral: value))
    }

}

extension ComplexMatrix: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: Complex<Scalar>...) {
        self.init(elements)
    }

}

extension ComplexMatrix: CustomStringConvertible {
    
    public var description: String {
        return "\(type(of: self))(\(size))"
    }
    
}

extension ComplexMatrix: Equatable {
    
    public static func == <Scalar>(lhs: ComplexMatrix<Scalar>, rhs: ComplexMatrix<Scalar>) -> Bool {
        return lhs.real == rhs.real && lhs.imaginary == rhs.imaginary
    }
    
}

extension ComplexMatrix: Hashable where Scalar: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(real)
        hasher.combine(imaginary)
    }
    
}

extension ComplexMatrix: Collection {
    
    public typealias Index = Int

    public var startIndex: Index {
        return 0
    }

    public var endIndex: Index {
        return size.count
    }
    
    public func index(after index: Index) -> Index {
        return index + 1
    }

    public subscript(_ index: Index) -> Complex<Scalar> {
        return Complex<Scalar>(real: real[index], imaginary: imaginary[index])
    }
    
}

extension ComplexMatrix where Scalar == Float {
    
    @inlinable public mutating func withUnsafeMutableSplitComplexVector<R>(_ body: (inout DSPSplitComplex) throws -> R) rethrows -> R {
        return try real.withUnsafeMutableBufferPointer { realPointer in
            return try imaginary.withUnsafeMutableBufferPointer { imaginaryPointer in
                var split = DSPSplitComplex(realp: realPointer.baseAddress!, imagp: imaginaryPointer.baseAddress!)
                return try body(&split)
            }
        }
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    @inlinable public mutating func withUnsafeMutableSplitComplexVector<R>(_ body: (inout DSPDoubleSplitComplex) throws -> R) rethrows -> R {
        return try real.withUnsafeMutableBufferPointer { realPointer in
            return try imaginary.withUnsafeMutableBufferPointer { imaginaryPointer in
                var split = DSPDoubleSplitComplex(realp: realPointer.baseAddress!, imagp: imaginaryPointer.baseAddress!)
                return try body(&split)
            }
        }
    }
    
}
