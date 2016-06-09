//
//  PitchSetSequence.swift
//  Pitch
//
//  Created by James Bean on 6/9/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

/**
 Ordered collection of non-unique `PitchSet` values.
 */
public struct PitchSetSequence {
    
     /// `Array` holding `PitchSet` values.
    public let array: Array<PitchSet>
}

extension PitchSetSequence: AnySequenceType {
    
    // MARK: - AnySequenceType
    
    public typealias Element = PitchSet
    
    /// Interable sequence of `PitchSet` values contained herein.
    public var sequence: AnySequence<Element> { return AnySequence(array) }
    
    
    /**
     Create a `PitchSetSequence` with a sequence of `PitchSet` values.
     */
    public init<S: SequenceType where S.Generator.Element == Element>(_ sequence: S) {
        self.array = Array(sequence)
    }
}


extension PitchSetSequence: ArrayLiteralConvertible {
    
    // MARK: ArrayLiteralConvertible
    
    /**
     Create a `PitchSetSequence` with an array literal.
     */
    public init(arrayLiteral elements: Element...) {
        self.array = elements
    }
}

public func == (lhs: PitchSetSequence, rhs: PitchSetSequence) -> Bool {
    return lhs.array == rhs.array
}