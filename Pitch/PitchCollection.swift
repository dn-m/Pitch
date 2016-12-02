//
//  OrderedPitchSet.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

/**
 Ordered collection of non-unique `Pitch` values.
 */
public struct PitchCollection: NoteNumberRepresentableCollectionType {

    // MARK: - Associated Types
    
    /// `NoteNumberRepresentable` type of values contained herein.
    public typealias Element = Pitch
    
    /// `NoteNumberRepresentableDyad` type holding two values contained herein.
    public typealias Dyad = PitchDyad

    /// `NoteNumberRepresentableInterval` type which lies between two values contained herein.
    public typealias Interval = PitchInterval
    
    // MARK: - Instance Properties
    
    /// Array of the `Pitch` values contained herein.
    public let array: Array<Pitch>

    /// Collection of `PitchInterval` values between adjacent values contained herein.
    public var intervals: PitchIntervalCollection {
        return PitchIntervalCollection(array.adjacentPairs?.map(PitchInterval.init) ?? [])
    }
}

extension PitchCollection: AnySequenceType {
    
    // MARK: - PitchCollection
    
    /**
     Create a `PitchCollection` with `SequenceType` containing `Pitch` values.
     */
    public init<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        self.array = Array(sequence)
    }
}

extension PitchCollection: ExpressibleByArrayLiteral {
    
    // MARK: - ArrayLiteralConvertible
    
    /**
     Create a `PitchCollection` with an array literal.
     */
    public init(arrayLiteral elements: Element...) {
        self.array = elements
    }
}

extension PitchCollection: Sequence {
    
    // MARK: - Sequence
    
    /// Make iterator for `PitchCollection`.
    public func makeIterator() -> AnyIterator<Pitch> {
        var iterator = array.makeIterator()
        return AnyIterator { iterator.next() }
    }
}

/// - returns: `true` if all values contained in both collections are equivalent. Otherwise,
///            `false`.
public func == (lhs: PitchCollection, rhs: PitchCollection) -> Bool {
    return lhs.sequence == rhs.sequence
}
