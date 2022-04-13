//
//  Matrix.swift
//  QRIMatrix
//
//  Created by Daniel Clelland on 30/03/22.
//

import Foundation
import Accelerate

public struct Matrix<Element: Numeric> {
    
    public internal(set) var size: MatrixSize
    public internal(set) var elements: [Element]
    
    public init(size: MatrixSize, elements: [Element]) {
        precondition(size.count == elements.count)
        self.size = size
        self.elements = elements
    }
    
    public init(size: MatrixSize, _ closure: (_ row: Int, _ column: Int) throws -> Element) rethrows {
        var elements: [Element] = []
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
    
    public init(_ element: Element) {
        self.init(size: .init(), elements: [element])
    }
    
    public init(_ elements: [Element]) {
        self.init(size: .init(columns: elements.count), elements: elements)
    }
    
}

extension Matrix {
    
    public static func zeros(size: MatrixSize) -> Matrix {
        return .init(size: size, elements: Array(repeating: .zero, count: size.count))
    }
    
}

extension Matrix {

    public subscript(row: Int, column: Int) -> Element {
        get {
            precondition(size.contains(row: row, column: column))
            return elements[size.indexFor(row: row, column: column)]
        }
        set {
            precondition(size.contains(row: row, column: column))
            elements[size.indexFor(row: row, column: column)] = newValue
        }
    }

    public subscript(row row: Int) -> [Element] {
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

    public subscript(column column: Int) -> [Element] {
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

extension Matrix: ExpressibleByIntegerLiteral where Element == IntegerLiteralType {
    
    public init(integerLiteral value: Element) {
        self.init(value)
    }
    
}

extension Matrix: ExpressibleByFloatLiteral where Element == FloatLiteralType {
    
    public init(floatLiteral value: FloatLiteralType) {
        self.init(value)
    }

}

extension Matrix: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
}

extension Matrix: Equatable {
    
    public static func == <Element>(lhs: Matrix<Element>, rhs: Matrix<Element>) -> Bool {
        return lhs.size == rhs.size && lhs.elements == rhs.elements
    }
    
}

extension Matrix: Hashable where Element: Hashable {
    
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

    public subscript(_ index: Index) -> Element {
        return elements[index]
    }
    
}

extension Matrix: AccelerateBuffer {
    
    public func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Element>) throws -> R) rethrows -> R {
        return try elements.withUnsafeBufferPointer(body)
    }
    
}

extension Matrix: AccelerateMutableBuffer {
    
    public mutating func withUnsafeMutableBufferPointer<R>(_ body: (inout UnsafeMutableBufferPointer<Element>) throws -> R) rethrows -> R {
        return try elements.withUnsafeMutableBufferPointer(body)
    }
    
}
