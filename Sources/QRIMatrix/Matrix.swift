//
//  Matrix.swift
//  QRIMatrix
//
//  Created by Daniel Clelland on 30/03/22.
//

import Foundation

public struct Matrix<T: Numeric> {
    
    public var size: MatrixSize
    public var elements: [T]
    
    public init(size: MatrixSize, elements: [T]) {
        precondition(size.count == elements.count)
        self.size = size
        self.elements = elements
    }

}

extension Matrix {
    
    public init(_ element: T) {
        self.init(size: .init(), elements: [element])
    }
    
    public init(_ elements: [T]) {
        self.init(size: .init(columns: elements.count), elements: elements)
    }
    
//    public init(_ elements: [[T]]) {
//        let allElementsEqual = elements.reduce(true, { $0 && $1.count == elements.first?.count })
//        precondition(allElementsEqual)
//        self.init(size: Size(rows: elements.first?.count ?? 0, columns: elements.count), elements: elements.joined())
//    }
    
}

//extension Sequence where Element: Sequence {
//
//    var allElementsEqual: Bool {
//        guard let first = self.first else {
//            return false
//        }
//
//        return reduce(true) { partialResult, element in
//            return partialResult && element.count == first.count
//        }
//    }
//
//}

let test = Matrix<Double>(size: .init(rows: 3, columns: 3), elements: [1, 2, 3, 4, 5, 6])

extension Matrix: ExpressibleByIntegerLiteral where T == IntegerLiteralType {
    
    public init(integerLiteral value: T) {
        self.init(value)
    }
    
}

extension Matrix: ExpressibleByFloatLiteral where T == FloatLiteralType {
    
    public init(floatLiteral value: FloatLiteralType) {
        self.init(value)
    }

}

extension Matrix: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
    
}
