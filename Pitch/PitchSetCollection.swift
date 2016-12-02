//
//  PitchSetCollection.swift
//  Pitch
//
//  Created by James Bean on 6/9/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

/**
 Ordered collection of non-unique `PitchSet` values.
 */
public struct PitchSetCollection {
    
    public typealias Element = PitchSet
    
    /// `Array` holding `PitchSet` values.
    public let array: Array<PitchSet>
    
    public init<S: Sequence>(_ sequence: S) where S.Iterator.Element == PitchSet {
        self.array = Array(sequence)
    }
}

extension PitchSetCollection: Collection {
    
    // MARK: - Collection
    
    public var startIndex: Int { return 0 }
    public var endIndex: Int { return array.count }
    
    public func index(after i: Int) -> Int {
        guard i != endIndex else { fatalError("Cannot increment endIndex") }
        return i + 1
    }
    
    public subscript(index: Int) -> Element { return array[index] }
}

extension PitchSetCollection: ExpressibleByArrayLiteral {
    
    // MARK: ArrayLiteralConvertible
    
    /**
     Create a `PitchSetSequence` with an array literal.
     */
    public init(arrayLiteral elements: Element...) {
        self.array = elements
    }
}
