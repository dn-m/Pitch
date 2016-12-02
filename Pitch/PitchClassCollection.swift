//
//  PitchClassCollection.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools
import ArithmeticTools


/// Ordered collection of non-unique `PitchClass` values.
///
/// - TODO: Rename to `PitchClassCollection` (the contents are not unique!)
public struct PitchClassCollection: NoteNumberRepresentableCollectionType {

    // MARK: - Instance Properties
    
    /// Array of the `PitchClass` values contained herein.
    public let array: Array<PitchClass>
    
    /// `PitchClassSequence` with `PitchClass` values in reverse order.
    ///
    /// - TODO: Move up `OrderedNoteNumberRespresentableSetType`
    public var retrograde: PitchClassCollection {
        return PitchClassCollection(reversed())
    }
    
    /// `PitchClassSequence` with `PitchClass` values inverted around `0`.
    public var inversion: PitchClassCollection {
        return PitchClassCollection(map { $0.inversion })
    }
    
    /**
     Array of `IntervalClass` values between each adjacent `PitchClass` herein.

     - TODO: Refactor up the `PitchConvertibleCollectionType` protocol hierarchy
     */
    public lazy var intervals: OrderedPitchClassIntervalSet? = {
        
        guard let intervals = self.array
            .lazy
            .adjacentPairs?
            .map(PitchClassDyad.init)
            .map(PitchClassInterval.init)
        else {
            return nil
        }

        return OrderedPitchClassIntervalSet(intervals)
    }()
    
    /** 
     Array of `PitchClassDyad` values between each combination (choose 2) herein.
     */
    public lazy var dyads: [PitchClassDyad]? = {
        
        return self.array
            .subsets(withCardinality: 2)?
            .map { PitchClassDyad($0[0], $0[1]) }
    }()
}

extension PitchClassCollection: AnySequenceType {
    
    // MARK: - AnySequenceType
    
    /// `PitchConvertible`-conforming type contained herein.
    public typealias Element = PitchClass
    
    /**
     Create a `PitchSet` with `SequenceType` containing `Pitch` values.
     */
    public init<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        self.array = Array(sequence)
    }
}

extension PitchClassCollection: ExpressibleByArrayLiteral {
    
    // MARK: - ArrayLiteralConvertible
    
    /**
     Create a `PitchClassSequence` with an array literal.
     */
    public init(arrayLiteral elements: PitchClass...) {
        self.array = elements
    }
}

public func == (lhs: PitchClassCollection, rhs: PitchClassCollection) -> Bool {
    return lhs.sequence == rhs.sequence
}

extension PitchClassCollection: Sequence {
    
    public func makeIterator() -> AnyIterator<PitchClass> {
        var iterator = array.makeIterator()
        return AnyIterator {
            return iterator.next()
        }
    }
}

// TODO: Move up to `ArrayTools`.
private func flipped <T> (pair: (T, T)) -> (T, T) {
    return (pair.1, pair.0)
}
