//
//  Matrix.swift
//  QRIMatrix
//
//  Created by Daniel Clelland on 30/03/22.
//

import Foundation
import Accelerate

public struct Matrix<Scalar> {
    
    public let size: MatrixSize
    
    @usableFromInline internal var elements: [Scalar]
    
    public init(size: MatrixSize, elements: [Scalar]) {
        self.size = size
        self.elements = elements
        precondition(self.state == .regular)
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
        self.init(size: .init(rows: 1, columns: 1), elements: [element])
    }
    
    public init(_ elements: [Scalar]) {
        self.init(size: .init(rows: 1, columns: elements.count), elements: elements)
    }
    
}

extension Matrix {
    
    public static var empty: Matrix {
        return .init(size: .empty, elements: [])
    }
    
}
    
extension Matrix where Scalar: Numeric {
    
    public static func zeros(size: MatrixSize) -> Matrix {
        return .init(size: size, elements: Array(repeating: .zero, count: size.count))
    }
    
}

extension Matrix {
    
    public enum State {
        
        case regular
        case malformed
        
    }
    
    public var state: State {
        return size.count == elements.count ? .regular : .malformed
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
            precondition(size.contains(row: row))
            return Array(elements[size.indicesFor(row: row)])
        }
        set {
            precondition(size.contains(row: row))
            precondition(size.columns == newValue.count)
            elements.replaceSubrange(size.indicesFor(row: row), with: newValue)
        }
    }

    public subscript(column column: Int) -> [Scalar] {
        get {
            precondition(size.contains(column: column))
            return size.rowIndices.map { row in
                return elements[size.indexFor(row: row, column: column)]
            }
        }
        set {
            precondition(size.contains(column: column))
            precondition(size.rows == newValue.count)
            for row in size.rowIndices {
                elements[size.indexFor(row: row, column: column)] = newValue[row]
            }
        }
    }
    
}

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
        return "\(type(of: self))(size: \(size), count: \(count))"
    }
    
}

extension Matrix: Equatable where Scalar: Equatable {
    
    public static func == (lhs: Matrix, rhs: Matrix) -> Bool {
        return lhs.size == rhs.size && lhs.elements == rhs.elements
    }
    
}

extension Matrix: Hashable where Scalar: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(size)
        hasher.combine(elements)
    }
    
}

extension Matrix: Codable where Scalar: Codable {
    
    enum CodingKeys: String, CodingKey {
        case size
        case elements
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.size = try container.decode(MatrixSize.self, forKey: .size)
        self.elements = try container.decode([Scalar].self, forKey: .elements)
        if self.state == .malformed {
            throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Malformed matrix: \(self)"))
        }
    }

}

extension Matrix: Collection {
    
    public typealias Index = Int

    public var startIndex: Index {
        return 0
    }

    public var endIndex: Index {
        return elements.count
    }
    
    public func index(after index: Index) -> Index {
        return index + 1
    }

    public subscript(_ index: Index) -> Scalar {
        return elements[index]
    }
    
}

extension Matrix: AccelerateBuffer {
    
    @inlinable public func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Scalar>) throws -> R) rethrows -> R {
        return try elements.withUnsafeBufferPointer(body)
    }
    
}

extension Matrix: AccelerateMutableBuffer {
    
    @inlinable public mutating func withUnsafeMutableBufferPointer<R>(_ body: (inout UnsafeMutableBufferPointer<Scalar>) throws -> R) rethrows -> R {
        return try elements.withUnsafeMutableBufferPointer(body)
    }
    
}
