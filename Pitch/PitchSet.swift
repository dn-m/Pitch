//
//  PitchSet.swift
//  Pitch
//
//  Created by James Bean on 3/17/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Collections

/**
 Unordered set of unique `Pitch` values.
 */
public struct PitchSet: CollectionWrapping /*: NoteNumberRepresentableSet*/ {
    
    // MARK: - Associated Types
    
    /// `PitchConvertible` type contained herein.
    public typealias Element = Pitch
    
    /// `NoteNumberRepresentableDyad` type.
    public typealias Dyad = PitchDyad
    
    /// `NoteNumberRepresentableInterval` type.
    public typealias Interval = PitchInterval
    
    // MARK: - Instance Properties
    
    /// Backing store for elements contained herein.
    public let base: Set<Element>

    public init <S> (_ sequence: S) where S: Sequence, S.Iterator.Element == Pitch {
        self.base = Set(sequence)
    }

    /**
     All unique dyads that comprise a `PitchSet`.
     
     In the case that there are less than two `Pitch` objects in a `PitchSet`,
     the `dyads` property is an empty array.
     
     **Example:**
     
     ```
     let triad: PitchSet = [
         Pitch(noteNumber: 60),
         Pitch(noteNumber: 61),
         Pitch(noteNumber: 62)
     ]
     
     triad.dyads == [
         Dyad(Pitch(noteNumber: 60), Pitch(noteNumber: 61)),
         Dyad(Pitch(noteNumber: 60), Pitch(noteNumber: 62)),
         Dyad(Pitch(noteNumber: 61), Pitch(noteNumber: 62))
     ]
     ```
     */
    public var dyads: [Dyad] {
        return Array(base)
            .subsets(cardinality: 2)
            .map { Dyad($0[0], $0[1]) }
    }
    
    /**
     Set of `PitchClass` representations of `PitchSet`.
     
     **Example:**
     
     ```
     let pitchSet: PitchSet = [Pitch(noteNumber: 63.5), Pitch(noteNumber: 69.25)]
     pitchSet.pitchClassSet // => [3.5, 9.25]
     ```
     */
    public var pitchClassSet: PitchClassSet {
        return PitchClassSet(map { $0.pitchClass })
    }
    
    /// Create a `PitchSet` by creating a union of multiple `PitchSet` values.
    public init(_ pitchSets: PitchSet...) {
        self.init(pitchSets)
    }
    
    /**
     Create a `PitchSet` with a sequence of `PitchSet` values.
     */
    public init<S: Sequence>(_ pitchSets: S) where S.Iterator.Element == PitchSet {
        if let (head, tail) = Array(pitchSets).destructured {
            self.base = tail.reduce(head.base) { $0.union($1.base) }
        } else {
            self.base = []
        }
    }

    /**
     - TODO: Move up the `PitchConvertibleSetType` protocol hierarchy.
     
     - returns: `PitchSet` with the union of this and the given `pitchSet`.
     */
    public func formUnion(with pitchSet: PitchSet) -> PitchSet {
        return PitchSet(base.union(pitchSet))
    }
}
