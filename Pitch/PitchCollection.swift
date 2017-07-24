//
//  OrderedPitchSet.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Collections

/// Ordered collection of non-unique `Pitch` values.
public struct PitchCollection: CollectionWrapping/*: NoteNumberRepresentableCollection*/ {

    // MARK: - Associated Types
    
    /// `NoteNumberRepresentable` type of values contained herein.
    public typealias Element = Pitch
    
    /// `NoteNumberRepresentableDyad` type holding two values contained herein.
    public typealias Dyad = PitchDyad

    /// `NoteNumberRepresentableInterval` type which lies between two values contained herein.
    public typealias Interval = PitchInterval
    
    // MARK: - Instance Properties
    
    /// Array of the `Pitch` values contained herein.
    public let base: Array<Pitch>

    public init <S> (_ sequence: S) where S: Sequence, S.Iterator.Element == Pitch {
        self.base = Array(sequence)
    }

    /// Collection of `PitchInterval` values between adjacent values contained herein.
    public var intervals: PitchIntervalCollection {
        return PitchIntervalCollection(base.pairs.map(PitchInterval.init))
    }
}
