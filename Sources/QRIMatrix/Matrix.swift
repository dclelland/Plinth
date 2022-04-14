//
//  Matrix.swift
//  QRIMatrix
//
//  Created by Daniel Clelland on 30/03/22.
//

import Foundation
import Accelerate

public struct Matrix<Scalar: Numeric> {
    
    public internal(set) var size: MatrixSize
    public internal(set) var elements: [Scalar]
    
    public init(size: MatrixSize, elements: [Scalar]) {
        precondition(size.count == elements.count)
        self.size = size
        self.elements = elements
    }
    
    public init(size: MatrixSize, _ closure: (_ row: Int, _ column: Int) throws -> Scalar) rethrows {
        var elements: [Scalar] = []
        elements.reserveCapacity(size.count)
        for row in 0..<size.rows {
            for column in 0..<size.columns {
                elements.append(try closure(row, column))
            }
        }
        self.init(size: size, elements: elements)
    }

}

extension Matrix {
    
    public init(_ element: Scalar) {
        self.init(size: .init(), elements: [element])
    }
    
    public init(_ elements: [Scalar]) {
        self.init(size: .init(columns: elements.count), elements: elements)
    }
    
}

extension Matrix {
    
    public static func zeros(size: MatrixSize) -> Matrix {
        return .init(size: size, elements: Array(repeating: .zero, count: size.count))
    }
    
}

extension Matrix {

    public subscript(row: Int, column: Int) -> Scalar {
        get {
            precondition(size.contains(row: row, column: column))
            return elements[size.indexFor(row: row, column: column)]
        }
        set {
            precondition(size.contains(row: row, column: column))
            elements[size.indexFor(row: row, column: column)] = newValue
        }
    }

    public subscript(row row: Int) -> [Scalar] {
        get {
            assert(size.contains(row: row))
            return Array(elements[size.indicesFor(row: row)])
        }
        set {
            assert(size.contains(row: row))
            assert(size.columns == newValue.count)
            elements.replaceSubrange(size.indicesFor(row: row), with: newValue)
        }
    }

    public subscript(column column: Int) -> [Scalar] {
        get {
            return size.rowIndices.map { row in
                return elements[size.indexFor(row: row, column: column)]
            }
        }
        set {
            assert(size.contains(column: column))
            assert(size.rows == newValue.count)
            size.rowIndices.forEach { row in
                elements[size.indexFor(row: row, column: column)] = newValue[row]
            }
        }
    }
    
}

/*
infix operator <*>

public func <*> <Scalar>(closure: ([Scalar]) -> [Scalar], matrix: Matrix<Scalar>) -> Matrix<Scalar> {
    return Matrix<Scalar>(size: matrix.size, elements: closure(matrix.elements))
}

public func <*> <Scalar>(closure: ([Scalar], [Scalar]) -> [Scalar], matrices: (Matrix<Scalar>, Matrix<Scalar>)) -> Matrix<Scalar> {
    return Matrix<Scalar>(size: matrices.0.size, elements: closure(matrices.0.elements, matrices.1.elements))
}

extension Matrix {

    // TODO: Perhaps use an infix operator here...? What would the Haskell equivalent be...?
    public func apply(_ closure: ([Scalar]) -> [Scalar]) -> Matrix<Scalar> {
        return Matrix<Scalar>(size: size, elements: closure(elements))
    }
//
//    public func apply(_ argument: Matrix<Scalar>) -> (([Scalar]) -> [Scalar]) -> Matrix<Scalar> {
//        return { closure in
//
//        }
//    }

}
 */

extension Matrix: ExpressibleByIntegerLiteral where Scalar == IntegerLiteralType {
    
    public init(integerLiteral value: Scalar) {
        self.init(value)
    }
    
}

extension Matrix: ExpressibleByFloatLiteral where Scalar == FloatLiteralType {
    
    public init(floatLiteral value: Scalar) {
        self.init(value)
    }

}

extension Matrix: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Scalar...) {
        self.init(elements)
    }
    
}

extension Matrix: CustomStringConvertible {
    
    public var description: String {
        return "\(type(of: self))(\(size))"
    }
    
}

extension Matrix: Equatable {
    
    public static func == <Scalar>(lhs: Matrix<Scalar>, rhs: Matrix<Scalar>) -> Bool {
        return lhs.size == rhs.size && lhs.elements == rhs.elements
    }
    
}

extension Matrix: Hashable where Scalar: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(size)
        hasher.combine(elements)
    }
    
}

extension Matrix: Collection {
    
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

    public subscript(_ index: Index) -> Scalar {
        return elements[index]
    }
    
}

extension Matrix: AccelerateBuffer {
    
    public func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Scalar>) throws -> R) rethrows -> R {
        return try elements.withUnsafeBufferPointer(body)
    }
    
}

extension Matrix: AccelerateMutableBuffer {
    
    public mutating func withUnsafeMutableBufferPointer<R>(_ body: (inout UnsafeMutableBufferPointer<Scalar>) throws -> R) rethrows -> R {
        return try elements.withUnsafeMutableBufferPointer(body)
    }
    
}
