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
        precondition(self.state == .regular)
    }
    
    public init(shape: Shape, repeating scalar: Scalar) {
        self.init(shape: shape, elements: [Scalar](repeating: scalar, count: shape.count))
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
    
    public init(_ element: Scalar) {
        self.init(shape: .init(rows: 1, columns: 1), elements: [element])
    }
    
    public init(_ elements: [Scalar]) {
        self.init(shape: .init(rows: 1, columns: elements.count), elements: elements)
    }
    
    public init(_ elements: [[Scalar]]) {
        self.init(shape: .init(rows: elements.count, columns: elements.first?.count ?? 0), elements: Array(elements.joined()))
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
        case malformed
        
    }
    
    public var state: State {
        return shape.count == elements.count ? .regular : .malformed
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
        self.init(value)
    }
    
}

extension Matrix: ExpressibleByFloatLiteral where Scalar == FloatLiteralType {
    
    public init(floatLiteral value: Scalar) {
        self.init(value)
    }

}

extension Matrix: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: [Scalar]...) {
        self.init(elements)
    }
    
}

extension Matrix: CustomStringConvertible {
    
    public var description: String {
        return "\(type(of: self))(shape: \(shape), count: \(count))"
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
    
    enum CodingKeys: String, CodingKey {
        case shape
        case elements
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.shape = try container.decode(Shape.self, forKey: .shape)
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
