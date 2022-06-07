//
//  Geometry.swift
//  Plinth
//
//  Created by Daniel Clelland on 5/06/22.
//

import Foundation
import Accelerate

extension Matrix where Scalar == UInt8 {
    
    public func scaled(to shape: Shape) throws -> Matrix {
        return try fmap(shape: shape) { vImageScale_Planar8(&$0, &$1, nil, vImage_Flags(kvImageNoFlags)) }
    }
    
}

extension Matrix where Scalar == Int16 {
    
    public func scaled(to shape: Shape) throws -> Matrix {
        return try fmap(shape: shape) { vImageScale_Planar16S(&$0, &$1, nil, vImage_Flags(kvImageNoFlags)) }
    }
    
}

extension Matrix where Scalar == UInt16 {
    
    public func scaled(to shape: Shape) throws -> Matrix {
        return try fmap(shape: shape) { vImageScale_Planar16U(&$0, &$1, nil, vImage_Flags(kvImageNoFlags)) }
    }
    
}

extension Matrix where Scalar == Float {
    
    public func scaled(to shape: Shape) throws -> Matrix {
        return try fmap(shape: shape) { vImageScale_PlanarF(&$0, &$1, nil, vImage_Flags(kvImageNoFlags)) }
    }
    
}
