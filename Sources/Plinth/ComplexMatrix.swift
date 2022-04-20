//
//  ComplexMatrix.swift
//  Plinth
//
//  Created by Daniel Clelland on 13/04/22.
//

import Foundation
import Numerics

public struct ComplexMatrix<Scalar> where Scalar: Real {
    
    public var real: Matrix<Scalar>
    public var imaginary: Matrix<Scalar>
    
    public init(real: Matrix<Scalar>, imaginary: Matrix<Scalar>) {
        self.real = real
        self.imaginary = imaginary
        precondition(self.state == .regular)
    }
    
}

extension ComplexMatrix {
    
    public init(size: MatrixSize, elements: [Complex<Scalar>]) {
        self.init(real: .init(size: size, elements: elements.map { $0.real }), imaginary: .init(size: size, elements: elements.map { $0.imaginary }))
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
        self.init(size: .init(rows: 1, columns: 1), elements: [element])
    }
    
    public init(_ elements: [Complex<Scalar>]) {
        self.init(size: .init(rows: 1, columns: elements.count), elements: elements)
    }
    
    public init(_ elements: [[Complex<Scalar>]]) {
        self.init(size: .init(rows: elements.count, columns: elements.first?.count ?? 0), elements: Array(elements.joined()))
    }
    
}

extension ComplexMatrix {
    
    public static var empty: ComplexMatrix {
        return .init(size: .empty, elements: [])
    }
    
}

extension ComplexMatrix where Scalar: Numeric {
    
    public static func zeros(size: MatrixSize) -> ComplexMatrix {
        return .init(real: .zeros(size: size), imaginary: .zeros(size: size))
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
            return real.size == imaginary.size ? .regular : .malformed
        default:
            return .malformed
        }
    }
    
    public var size: MatrixSize {
        return MatrixSize(
            rows: Swift.min(real.size.rows, imaginary.size.rows),
            columns: Swift.min(real.size.columns, imaginary.size.columns)
        )
    }
    
    public var elements: [Complex<Scalar>] {
        return Array(self)
    }
    
}

extension ComplexMatrix {
    
    public subscript(row: Int, column: Int) -> Complex<Scalar> {
        get {
            precondition(size.contains(row: row, column: column))
            return Complex<Scalar>(real[row, column], imaginary[row, column])
        }
        set {
            precondition(size.contains(row: row, column: column))
            real[row, column] = newValue.real
            imaginary[row, column] = newValue.imaginary
        }
    }

    public subscript(row row: Int) -> [Complex<Scalar>] {
        get {
            precondition(size.contains(row: row))
            return zip(real[row: row], imaginary[row: row]).map { real, imaginary in
                return Complex<Scalar>(real, imaginary)
            }
        }
        set {
            precondition(size.contains(row: row))
            precondition(size.columns == newValue.count)
            real[row: row] = newValue.map { $0.real }
            imaginary[row: row] = newValue.map { $0.imaginary }
        }
    }

    public subscript(column column: Int) -> [Complex<Scalar>] {
        get {
            precondition(size.contains(column: column))
            return zip(real[column: column], imaginary[column: column]).map { real, imaginary in
                return Complex<Scalar>(real, imaginary)
            }
        }
        set {
            precondition(size.contains(column: column))
            precondition(size.rows == newValue.count)
            real[column: column] = newValue.map { $0.real }
            imaginary[column: column] = newValue.map { $0.imaginary }
        }
    }
    
}

extension ComplexMatrix: ExpressibleByFloatLiteral where Scalar == FloatLiteralType {

    public init(floatLiteral value: Scalar) {
        self.init(Complex<Scalar>(value))
    }

}

extension ComplexMatrix: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: [Complex<Scalar>]...) {
        self.init(elements)
    }

}

extension ComplexMatrix: CustomStringConvertible {
    
    public var description: String {
        return "\(type(of: self))(real: \(real), imaginary: \(imaginary))"
    }
    
}

extension ComplexMatrix: Equatable where Scalar: Equatable {
    
    public static func == (lhs: ComplexMatrix, rhs: ComplexMatrix) -> Bool {
        return lhs.real == rhs.real && lhs.imaginary == rhs.imaginary
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
        self.real = try container.decode(Matrix<Scalar>.self, forKey: .real)
        self.imaginary = try container.decode(Matrix<Scalar>.self, forKey: .imaginary)
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

    public subscript(_ index: Index) -> Complex<Scalar> {
        return Complex<Scalar>(real[index], imaginary[index])
    }
    
}
