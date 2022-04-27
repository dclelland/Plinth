//
//  Span.swift
//  Plinth
//
//  Created by Daniel Clelland on 27/04/22.
//

import Foundation

infix operator ..: RangeFormationPrecedence

public func .. (left: Int, right: Int) -> Span {
    return .init(startIndex: left, endIndex: right)
}

public struct Span {
    
    public var startIndex: Int
    public var endIndex: Int
    
    public init(startIndex: Int, endIndex: Int) {
        self.startIndex = startIndex
        self.endIndex = endIndex
    }
    
}

extension Span {
    
    public enum Direction {
        
        case forwards
        case backwards
        
    }
    
    public var direction: Direction {
        return startIndex <= endIndex ? .forwards : .backwards
    }
    
}

extension Span {
    
    public var count: Int {
        return abs(endIndex - startIndex) + 1
    }
    
    public var length: Int {
        switch direction {
        case .forwards:
            return count
        case .backwards:
            return -count
        }
    }
    
}

extension Span {
    
    public var lowerBound: Int {
        return min(startIndex, endIndex)
    }
    
    public var upperBound: Int {
        return max(startIndex, endIndex)
    }
    
    public var bounds: ClosedRange<Int> {
        return lowerBound...upperBound
    }
    
}

extension Span {
    
    public func reversed() -> Span {
        return endIndex..startIndex
    }
    
}

extension Span: CustomStringConvertible {
    
    public var description: String {
        return "\(startIndex)..\(endIndex)"
    }
    
}

extension Span: RangeExpression {
    
    public typealias Bound = Int
    
    public func relative<C>(to collection: C) -> Range<Bound> where C : Collection, Bound == C.Index {
        return bounds.relative(to: collection)
    }
    
    public func contains(_ element: Bound) -> Bool {
        return bounds.contains(element)
    }
    
}
