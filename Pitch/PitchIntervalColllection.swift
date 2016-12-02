//
//  PitchIntervalColllection.swift
//  Pitch
//
//  Created by James Bean on 12/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

public struct PitchIntervalCollection: NoteNumberRepresentableCollectionType {
    
    public typealias Dyad = PitchDyad
    
    public typealias Interval = PitchInterval
    
    public let array: Array<Element>
}

extension PitchIntervalCollection: AnySequenceType {
    
    // MARK: - PitchSequenceType
    
    // MARK: - Associated Types
    
    /// `PitchConvertible` values contained herein.
    public typealias Element = PitchInterval
    
    /**
     Create a `PitchSet` with `SequenceType` containing `Pitch` values.
     */
    public init<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        self.array = Array(sequence)
    }
}

extension PitchIntervalCollection: ExpressibleByArrayLiteral {
    
    // MARK: - ArrayLiteralConvertible
    
    /**
     Create a `PitchSequence` with an array literal.
     */
    public init(arrayLiteral elements: Element...) {
        self.array = elements
    }
}

extension PitchIntervalCollection: Sequence {
    
    public func makeIterator() -> AnyIterator<Element> {
        let iterator = sequence.makeIterator()
        return AnyIterator { iterator.next() }
    }
}
 
public func == (lhs: PitchIntervalCollection, rhs: PitchIntervalCollection) -> Bool {
    return lhs.sequence == rhs.sequence
}
