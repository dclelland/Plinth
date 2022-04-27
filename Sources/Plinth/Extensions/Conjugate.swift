//
//  Conjugate.swift
//  Plinth
//
//  Created by Daniel Clelland on 27/04/22.
//

import Foundation
import Accelerate

extension ComplexMatrix where Scalar == Float {
    
    public func conjugate() -> ComplexMatrix {
        return fmap { vDSP.conjugate($0, count: shape.count, result: &$1) }
    }
    
}

extension ComplexMatrix where Scalar == Double {
    
    public func conjugate() -> ComplexMatrix {
        return fmap { vDSP.conjugate($0, count: shape.count, result: &$1) }
    }
    
}
