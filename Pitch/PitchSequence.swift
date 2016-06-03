//
//  PitchSequence.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

/**
 Ordered collection of non-unique `Pitch` values.
 */
public struct PitchSequence: PitchSequenceType {
    
    private let pitches: Array<Pitch>
    
    /// Iterable sequence of `Pitch` values contained herein.
    public var sequence: AnySequence<Pitch> { return AnySequence(pitches) }
    
    /**
     Create a `PitchSet` with `SequenceType` containing `Pitch` values.
     */
    public init<S: SequenceType where S.Generator.Element == Pitch>(sequence: S) {
        self.pitches = Array(sequence)
    }
}
