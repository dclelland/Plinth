//
//  ComplexMatrix.swift
//  Plinth
//
//  Created by Daniel Clelland on 13/04/22.
//

import Foundation
import Numerics

public struct ComplexMatrix<Scalar> where Scalar: Real {
    
    public typealias Matrix = Plinth.Matrix<Scalar>
    public typealias Complex = Numerics.Complex<Scalar>
    
    public var real: Matrix
    public var imaginary: Matrix
    
    public init(real: Matrix, imaginary: Matrix) {
        self.real = real
        self.imaginary = imaginary
    }
    
    public init(shape: Shape, repeating element: Complex) {
        self.init(real: .init(shape: shape, repeating: element.real), imaginary: .init(shape: shape, repeating: element.imaginary))
    }
    
    public init(shape: Shape, elements: [Complex]) {
        self.init(real: .init(shape: shape, elements: elements.map(\.real)), imaginary: .init(shape: shape, elements: elements.map(\.imaginary)))
    }
    
    public init(shape: Shape, _ closure: (_ row: Int, _ column: Int) throws -> Complex) rethrows {
        var elements: [Complex] = []
        elements.reserveCapacity(shape.count)
        for row in 0..<shape.rows {
            for column in 0..<shape.columns {
                elements.append(try closure(row, column))
            }
        }
        self.init(shape: shape, elements: elements)
    }
    
}

extension ComplexMatrix {
    
    public init(element: Complex) {
        self.init(shape: .init(rows: 1, columns: 1), elements: [element])
    }
    
    public init(row: [Complex]) {
        self.init(shape: .init(rows: 1, columns: row.count), elements: row)
    }
    
    public init(column: [Complex]) {
        self.init(shape: .init(rows: column.count, columns: 1), elements: column)
    }
    
    public init(grid: [[Complex]]) {
        self.init(shape: .init(rows: grid.count, columns: grid.first?.count ?? 0), elements: Array(grid.joined()))
    }
    
}

extension ComplexMatrix {
    
    public static var empty: ComplexMatrix {
        return .init(shape: .empty, elements: [])
    }
    
}

extension ComplexMatrix where Scalar: Numeric {
    
    public init(real: Matrix) {
        self.init(real: real, imaginary: .zeros(shape: real.shape))
    }
    
    public static func zeros(shape: Shape) -> ComplexMatrix {
        return .init(shape: shape, repeating: .zero)
    }
    
}

extension ComplexMatrix {
    
    public enum State {
        
        case regular
        case malformed(_ description: String)
        
    }
    
    public var state: State {
        switch (real.state, imaginary.state) {
        case (.malformed(let realDescription), .malformed(let imaginaryDescription)):
            return .malformed("Malformed real component: \(realDescription); Malformed imaginary component: \(imaginaryDescription)")
        case (.malformed(let description), .regular):
            return .malformed("Malformed real component: \(description)")
        case (.regular, .malformed(let description)):
            return .malformed("Malformed imaginary component: \(description)")
        case (.regular, .regular):
            guard real.shape == imaginary.shape else {
                return .malformed("Shape mismatch between real and imaginary components; \(real.shape) != \(imaginary.shape)")
            }
            
            return .regular
        }
    }
    
    public var shape: Shape {
        return Shape(
            rows: Swift.min(real.shape.rows, imaginary.shape.rows),
            columns: Swift.min(real.shape.columns, imaginary.shape.columns)
        )
    }
    
    public var elements: [Complex] {
        return Array(self)
    }
    
    public var grid: [[Complex]] {
        return shape.rowIndices.map { row in
            return Array(elements[shape.indicesFor(row: row)])
        }
    }
    
}

extension ComplexMatrix {
    
    public subscript(row: Int, column: Int) -> Complex {
        get {
            precondition(shape.contains(row: row, column: column))
            return Complex(real[row, column], imaginary[row, column])
        }
        set {
            precondition(shape.contains(row: row, column: column))
            real[row, column] = newValue.real
            imaginary[row, column] = newValue.imaginary
        }
    }
    
}

extension ComplexMatrix: ExpressibleByFloatLiteral where Scalar == FloatLiteralType {

    public init(floatLiteral value: Scalar) {
        self.init(element: Complex(value))
    }

}

extension ComplexMatrix: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: [Complex]...) {
        self.init(grid: elements)
    }

}

extension ComplexMatrix: CustomStringConvertible where Scalar: CustomStringConvertible {

    public var description: String {
        switch state {
        case .regular:
            return "[[" + grid.map { $0.map(\.description).joined(separator: ", ") }.joined(separator: "],\n [") + "]]"
        case .malformed(let description):
            return "Malformed \(type(of: self)): \(description)"
        }
    }

}

extension ComplexMatrix: Equatable where Scalar: Equatable {
    
    public static func == (left: ComplexMatrix, right: ComplexMatrix) -> Bool {
        return left.real == right.real && left.imaginary == right.imaginary
    }
    
}

extension ComplexMatrix: Hashable where Scalar: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(real)
        hasher.combine(imaginary)
    }
    
}

extension ComplexMatrix: Codable where Scalar: Codable {
    
    enum CodingKeys: String, CodingKey {
        case real
        case imaginary
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.real = try container.decode(Matrix.self, forKey: .real)
        self.imaginary = try container.decode(Matrix.self, forKey: .imaginary)
        if case .malformed(let description) = self.state {
            throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Malformed \(type(of: self)): \(description)"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if case .malformed(let description) = self.state {
            throw EncodingError.invalidValue(self, .init(codingPath: encoder.codingPath, debugDescription: "Malformed \(type(of: self)): \(description)"))
        }
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(real, forKey: .real)
        try container.encode(imaginary, forKey: .imaginary)
    }

}

extension ComplexMatrix: Collection {
    
    public typealias Index = Int

    public var startIndex: Index {
        return 0
    }

    public var endIndex: Index {
        return Swift.min(real.count, imaginary.count)
    }
    
    public func index(after index: Index) -> Index {
        return index + 1
    }

    public subscript(_ index: Index) -> Complex {
        return Complex(real[index], imaginary[index])
    }
    
}

extension ComplexMatrix: BidirectionalCollection {
    
    public func index(before index: Index) -> Index {
        return index - 1
    }
    
    public func reversed() -> ComplexMatrix {
        return ComplexMatrix(real: real.reversed(), imaginary: imaginary.reversed())
    }
    
}
