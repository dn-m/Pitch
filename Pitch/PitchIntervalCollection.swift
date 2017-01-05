//
//  PitchIntervalColllection.swift
//  Pitch
//
//  Created by James Bean on 12/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Collections

/// Collection of `PitchInterval` values
public struct PitchIntervalCollection: NoteNumberRepresentableCollection {
    
    /// `NoteNumberRepresentableDyad` type.
    public typealias Dyad = PitchDyad
    
    /// `NoteNumberRepresentableInterval` type.
    public typealias Interval = PitchInterval
    
    // MARK: - Instance Properties
    
    /// Backing store of elements contained herein.
    public let array: Array<Element>
}

extension PitchIntervalCollection: AnySequenceWrapping {
    
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
    
    // MARK: - `ExpressibleByArrayLiteral`
    
    /// Create a `PitchSequence` with an array literal.
    public init(arrayLiteral elements: Element...) {
        self.array = elements
    }
}

extension PitchIntervalCollection: Sequence {
    
    // MARK: - `Sequence`
    
    /// Make an iterator for a `PitchIntervalCollection`.
    public func makeIterator() -> AnyIterator<Element> {
        let iterator = sequence.makeIterator()
        return AnyIterator { iterator.next() }
    }
}
