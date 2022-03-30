//
//  Matrix.swift
//  QRIMatrix
//
//  Created by Daniel Clelland on 30/03/22.
//

import Foundation

public struct Matrix<T: Numeric> {
    
    public var rows: Int
    public var columns: Int
    
    public var cells: [T]

}

//extension Matrix: ExpressibleByArrayLiteral {
//
//}
