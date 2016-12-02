//
//  OrderedPitchClassIntervalSet.swift
//  Pitch
//
//  Created by James Bean on 12/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

public struct OrderedPitchClassIntervalSet: NoteNumberRepresentableCollectionType {
    
    public let array: Array<PitchClassInterval>
}

extension OrderedPitchClassIntervalSet: AnySequenceType {
    
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

extension OrderedPitchClassIntervalSet: ExpressibleByArrayLiteral {
    
    // MARK: - ArrayLiteralConvertible
    
    /**
     Create a `PitchSequence` with an array literal.
     */
    public init(arrayLiteral elements: Element...) {
        self.array = elements
    }
}

extension OrderedPitchClassIntervalSet: Sequence {
    
    public func makeIterator() -> AnyIterator<PitchClassInterval> {
        var iterator = array.makeIterator()
        return AnyIterator { iterator.next() }
    }
}

public func == (lhs: OrderedPitchClassIntervalSet, rhs: OrderedPitchClassIntervalSet) -> Bool {
    return lhs.sequence == rhs.sequence
}
