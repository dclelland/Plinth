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
        precondition(self.state == .regular)
    }
    
}

extension ComplexMatrix {
    
    public init(shape: Shape, elements: [Complex]) {
        self.init(real: .init(shape: shape, elements: elements.map { $0.real }), imaginary: .init(shape: shape, elements: elements.map { $0.imaginary }))
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
    
    public init(_ element: Complex) {
        self.init(shape: .init(rows: 1, columns: 1), elements: [element])
    }
    
    public init(_ elements: [Complex]) {
        self.init(shape: .init(rows: 1, columns: elements.count), elements: elements)
    }
    
    public init(_ elements: [[Complex]]) {
        self.init(shape: .init(rows: elements.count, columns: elements.first?.count ?? 0), elements: Array(elements.joined()))
    }
    
}

extension ComplexMatrix {
    
    public static var empty: ComplexMatrix {
        return .init(shape: .empty, elements: [])
    }
    
}

extension ComplexMatrix where Scalar: Numeric {
    
    public static func zeros(shape: Shape) -> ComplexMatrix {
        return .init(real: .zeros(shape: shape), imaginary: .zeros(shape: shape))
    }
    
}

extension ComplexMatrix {
    
    public enum State {
        
        case regular
        case malformed
        
    }
    
    public var state: State {
        switch (real.state, imaginary.state) {
        case (.regular, .regular):
            return real.shape == imaginary.shape ? .regular : .malformed
        default:
            return .malformed
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

    public subscript(row row: Int) -> [Complex] {
        get {
            precondition(shape.contains(row: row))
            return zip(real[row: row], imaginary[row: row]).map { real, imaginary in
                return Complex(real, imaginary)
            }
        }
        set {
            precondition(shape.contains(row: row))
            precondition(shape.columns == newValue.count)
            real[row: row] = newValue.map { $0.real }
            imaginary[row: row] = newValue.map { $0.imaginary }
        }
    }

    public subscript(column column: Int) -> [Complex] {
        get {
            precondition(shape.contains(column: column))
            return zip(real[column: column], imaginary[column: column]).map { real, imaginary in
                return Complex(real, imaginary)
            }
        }
        set {
            precondition(shape.contains(column: column))
            precondition(shape.rows == newValue.count)
            real[column: column] = newValue.map { $0.real }
            imaginary[column: column] = newValue.map { $0.imaginary }
        }
    }
    
}

extension ComplexMatrix: ExpressibleByFloatLiteral where Scalar == FloatLiteralType {

    public init(floatLiteral value: Scalar) {
        self.init(Complex(value))
    }

}

extension ComplexMatrix: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: [Complex]...) {
        self.init(elements)
    }

}

extension ComplexMatrix: CustomStringConvertible {
    
    public var description: String {
        return "\(type(of: self))(real: \(real), imaginary: \(imaginary))"
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
        if self.state == .malformed {
            throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Malformed matrix: \(self)"))
        }
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
