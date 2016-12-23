//
//  OrderedPitchClassIntervalSet.swift
//  Pitch
//
//  Created by James Bean on 12/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Collections


/// Ordered collection of `PitchClassInterval` types.
public struct PitchClassIntervalCollection: NoteNumberRepresentableCollection {
    
    /// `NoteNumberRepresentableDyad` type.
    public typealias Dyad = PitchClassDyad
    
    /// `NoteNumberRepresentableInterval` type.
    public typealias Interval = PitchClassInterval
    
    /// Backing store of values.
    public let array: Array<PitchClassInterval>
}

extension PitchClassIntervalCollection: AnySequenceWrapping {
    
    // MARK: - AnySequenceWrapping
    
    /// Type of `NoteNumberRepresentable` values contained herein.
    public typealias Element = PitchClassInterval
    
    /**
     Create a `PitchSet` with `SequenceType` containing `Pitch` values.
     */
    public init<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        self.array = Array(sequence)
    }
}

extension PitchClassIntervalCollection: ExpressibleByArrayLiteral {
    
    // MARK: - `ExpressibleByArrayLiteral`
    
    /// Create a `PitchClassIntervalCollection` with an array literal.
    public init(arrayLiteral elements: Element...) {
        self.array = elements
    }
}

extension PitchClassIntervalCollection: Sequence {
    
    /// Make iterator for `PitchClassIntervalCollection`.
    public func makeIterator() -> AnyIterator<Element> {
        let iterator = sequence.makeIterator()
        return AnyIterator { iterator.next() }
    }
}

/// - returns: `true` if all values in both collections are equivalent. Otherwise, `false`.
public func == (lhs: PitchClassIntervalCollection, rhs: PitchClassIntervalCollection) -> Bool {
    return lhs.sequence == rhs.sequence
}
