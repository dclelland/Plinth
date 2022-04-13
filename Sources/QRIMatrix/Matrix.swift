//
//  Matrix.swift
//  QRIMatrix
//
//  Created by Daniel Clelland on 30/03/22.
//

import Foundation

public struct Matrix<Element: Numeric> {
    
    public var size: MatrixSize
    public var elements: [Element]
    
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
            assert(size.contains(row: row, column: column))
            return elements[(row * size.columns) + column]
        }
        set {
            assert(size.contains(row: row, column: column))
            elements[(row * size.columns) + column] = newValue
        }
    }

    public subscript(row row: Int) -> [Element] {
        get {
            assert(size.contains(row: row))
            let startIndex = row * size.columns
            let endIndex = row * size.columns + size.columns
            return Array(elements[startIndex..<endIndex])
        }
        set {
            assert(size.contains(row: row))
            assert(newValue.count == size.columns)
            let startIndex = row * size.columns
            let endIndex = row * size.columns + size.columns
            elements.replaceSubrange(startIndex..<endIndex, with: newValue)
        }
    }

    public subscript(column column: Int) -> [Element] {
        get {
            assert(size.contains(column: column))
            var result = [Element](repeating: .zero, count: size.rows)
            for i in 0..<size.rows {
                let index = i * size.columns + column
                result[i] = elements[index]
            }
            return result
        }
        set {
            assert(size.contains(column: column))
            assert(newValue.count == size.rows)
            for i in 0..<size.rows {
                let index = i * size.columns + column
                elements[index] = newValue[i]
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
