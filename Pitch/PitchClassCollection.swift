//
//  PitchClassCollection.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Collections
import ArithmeticTools

/// Ordered collection of `Pitch.Class` values.
public struct PitchClassCollection: CollectionWrapping/*: NoteNumberRepresentableCollection*/ {

    // MARK: - Associated Types
    
    /// `PitchConvertible`-conforming type contained herein.
    public typealias Element = Pitch.Class
    
    /// `NoteNumberRepresentableDyad` type.
    public typealias Dyad = PitchClassDyad
    
    /// `NoteNumberRepresentableInterval` type.
    public typealias Interval = PitchClassInterval
    
    // MARK: - Instance Properties
    
    /// Array of the `Pitch.Class` values contained herein.
    public let base: Array<Pitch.Class>

    public init <S> (_ sequence: S) where S: Sequence, S.Iterator.Element == Pitch.Class {
        self.base = Array(sequence)
    }
    
    /// `PitchClassSequence` with `Pitch.Class` values in reverse order.
    ///
    /// - TODO: Move up `OrderedNoteNumberRespresentableSetType` protocol hierarchy.
    public var retrograde: PitchClassCollection {
        return PitchClassCollection(reversed())
    }
    
    /// `PitchClassSequence` with `Pitch.Class` values inverted around `0`.
    public var inversion: PitchClassCollection {
        return PitchClassCollection(map { $0.inversion })
    }
    
    /// Array of `IntervalClass` values between each adjacent `Pitch.Class` herein.
    ///
    /// - TODO: Refactor up the `NoteNumberRepresentableCollection` protocol hierarchy
    public var intervals: PitchClassIntervalCollection {
        return PitchClassIntervalCollection(
            base: self.base.pairs.map(PitchClassInterval.init)
        )
    }
    
    /// Array of `PitchClassDyad` values between each combination (choose 2) herein.
    public var dyads: [PitchClassDyad] {
        return self.base
            .subsets(cardinality: 2)
            .map { PitchClassDyad($0[0], $0[1]) }
    }
}
