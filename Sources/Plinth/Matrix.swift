//
//  Matrix.swift
//  Plinth
//
//  Created by Daniel Clelland on 30/03/22.
//

import Foundation
import Accelerate

public struct Matrix<Scalar> {
    
    public let shape: Shape
    public var elements: [Scalar]
    
    public init(shape: Shape, elements: [Scalar]) {
        self.shape = shape
        self.elements = elements
    }
    
    public init(shape: Shape, repeating element: Scalar) {
        self.init(shape: shape, elements: [Scalar](repeating: element, count: shape.count))
    }
    
    public init(shape: Shape, _ closure: @autoclosure () throws -> Scalar) rethrows {
        var elements: [Scalar] = []
        elements.reserveCapacity(shape.count)
        for _ in 0..<shape.count {
            elements.append(try closure())
        }
        self.init(shape: shape, elements: elements)
    }
    
    public init(shape: Shape, _ closure: (_ row: Int, _ column: Int) throws -> Scalar) rethrows {
        var elements: [Scalar] = []
        elements.reserveCapacity(shape.count)
        for row in 0..<shape.rows {
            for column in 0..<shape.columns {
                elements.append(try closure(row, column))
            }
        }
        self.init(shape: shape, elements: elements)
    }

}

extension Matrix {
    
    public init(element: Scalar) {
        self.init(shape: .square(length: 1), elements: [element])
    }
    
    public init(row: [Scalar]) {
        self.init(shape: .row(length: row.count), elements: row)
    }
    
    public init(column: [Scalar]) {
        self.init(shape: .column(length: column.count), elements: column)
    }
    
    public init(grid: [[Scalar]]) {
        self.init(shape: .init(rows: grid.count, columns: grid.first?.count ?? 0), elements: Array(grid.joined()))
    }
    
}

extension Matrix {
    
    public static var empty: Matrix {
        return .init(shape: .empty, elements: [])
    }
    
}
    
extension Matrix where Scalar: Numeric {
    
    public static func zeros(shape: Shape) -> Matrix {
        return .init(shape: shape, repeating: .zero)
    }
    
}

extension Matrix {
    
    public enum State {
        
        case regular
        case malformed(_ malformation: Malformation)
        
    }
    
    public enum Malformation: CustomStringConvertible {
        
        case shapeIsEmpty
        case shapeMismatch(shape: Shape, count: Int)
        
        public var description: String {
            switch self {
            case .shapeIsEmpty:
                return "Shape is empty"
            case .shapeMismatch(let shape, let count):
                return "Mismatched shape and elements; \(shape) != \(count)"
            }
        }
        
    }
    
    public var state: State {
        guard shape.isEmpty == false else {
            return .malformed(.shapeIsEmpty)
        }
        
        guard shape.count == elements.count else {
            return .malformed(.shapeMismatch(shape: shape, count: elements.count))
        }
        
        return .regular
    }
    
}

extension Matrix {
    
    public var grid: [[Scalar]] {
        return shape.rowIndices.map { row in
            return Array(elements[shape.indicesFor(row: row)])
        }
    }
    
}

extension Matrix {

    public subscript(row: Int, column: Int) -> Scalar {
        get {
            precondition(shape.contains(row: row, column: column))
            return elements[shape.indexFor(row: row, column: column)]
        }
        set {
            precondition(shape.contains(row: row, column: column))
            elements[shape.indexFor(row: row, column: column)] = newValue
        }
    }
    
}

extension Matrix: ExpressibleByIntegerLiteral where Scalar == IntegerLiteralType {
    
    public init(integerLiteral value: Scalar) {
        self.init(element: value)
    }
    
}

extension Matrix: ExpressibleByFloatLiteral where Scalar == FloatLiteralType {
    
    public init(floatLiteral value: Scalar) {
        self.init(element: value)
    }

}

extension Matrix: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: [Scalar]...) {
        self.init(grid: elements)
    }
    
}

extension Matrix: CustomStringConvertible where Scalar: CustomStringConvertible {
    
    public var description: String {
        switch state {
        case .regular:
            return "[[" + grid.map { $0.map(\.description).joined(separator: ", ") }.joined(separator: "],\n [") + "]]"
        case .malformed(let description):
            return "Malformed \(type(of: self)): \(description)"
        }
    }
    
}

extension Matrix: Equatable where Scalar: Equatable {
    
    public static func == (left: Matrix, right: Matrix) -> Bool {
        return left.shape == right.shape && left.elements == right.elements
    }
    
}

extension Matrix: Hashable where Scalar: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(shape)
        hasher.combine(elements)
    }
    
}

extension Matrix: Codable where Scalar: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(grid: try container.decode([[Scalar]].self))
        if case .malformed(let malformation) = self.state {
            throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Malformed \(type(of: self)): \(malformation)"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if case .malformed(let malformation) = self.state {
            throw EncodingError.invalidValue(self, .init(codingPath: encoder.codingPath, debugDescription: "Malformed \(type(of: self)): \(malformation)"))
        }
        var container = encoder.singleValueContainer()
        try container.encode(grid)
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

extension Matrix: BidirectionalCollection {
    
    public func index(before index: Index) -> Index {
        return index - 1
    }
    
    public func reversed() -> Matrix {
        return fmap { $0.reversed() }
    }
    
}

extension Matrix: AccelerateBuffer {
    
    @inlinable public func withUnsafeBufferPointer<Result>(_ body: (UnsafeBufferPointer<Scalar>) throws -> Result) rethrows -> Result {
        return try elements.withUnsafeBufferPointer(body)
    }
    
}

extension Matrix: AccelerateMutableBuffer {
    
    @inlinable public mutating func withUnsafeMutableBufferPointer<Result>(_ body: (inout UnsafeMutableBufferPointer<Scalar>) throws -> Result) rethrows -> Result {
        return try elements.withUnsafeMutableBufferPointer(body)
    }
    
}
