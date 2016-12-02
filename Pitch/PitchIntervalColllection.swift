//
//  PitchIntervalColllection.swift
//  Pitch
//
//  Created by James Bean on 12/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

/// Collection of `PitchInterval` values
public struct PitchIntervalCollection: NoteNumberRepresentableCollectionType {
    
    /// `NoteNumberRepresentable` type of dyad.
    public typealias Dyad = PitchDyad
    
    /// `NoteNumberRepresentable` type of interval.
    public typealias Interval = PitchInterval
    
    // MARK: - Instance Properties
    
    /// Backing store of elements contained herein.
    public let array: Array<Element>
}

extension PitchIntervalCollection: AnySequenceType {
    
    // MARK: - PitchIntervalCollection
    
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
    
    // MARK: - Sequence
    
    /// Make an iterator for a `PitchIntervalCollection`.
    public func makeIterator() -> AnyIterator<Element> {
        let iterator = sequence.makeIterator()
        return AnyIterator { iterator.next() }
    }
}

/// - returns: `true` if all elements in both collections are equivalent. Otherwise, `false`.
public func == (lhs: PitchIntervalCollection, rhs: PitchIntervalCollection) -> Bool {
    return lhs.sequence == rhs.sequence
}
