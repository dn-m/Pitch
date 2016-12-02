//
//  OrderedPitchClassIntervalSet.swift
//  Pitch
//
//  Created by James Bean on 12/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

public struct PitchClassIntervalCollection: NoteNumberRepresentableCollectionType {
    
    public let array: Array<PitchClassInterval>
}

extension PitchClassIntervalCollection: AnySequenceType {
    
    // MARK: - PitchSequenceType
    
    // MARK: - Associated Types
    
    /// `PitchConvertible` values contained herein.
    public typealias Element = PitchClassInterval
    
    /**
     Create a `PitchSet` with `SequenceType` containing `Pitch` values.
     */
    public init<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        self.array = Array(sequence)
    }
}

extension PitchClassIntervalCollection: ExpressibleByArrayLiteral {
    
    // MARK: - ArrayLiteralConvertible
    
    /**
     Create a `PitchSequence` with an array literal.
     */
    public init(arrayLiteral elements: Element...) {
        self.array = elements
    }
}

extension PitchClassIntervalCollection: Sequence {
    
    public func makeIterator() -> AnyIterator<PitchClassInterval> {
        var iterator = array.makeIterator()
        return AnyIterator { iterator.next() }
    }
}

public func == (lhs: PitchClassIntervalCollection, rhs: PitchClassIntervalCollection) -> Bool {
    return lhs.sequence == rhs.sequence
}
