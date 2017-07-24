//
//  PitchIntervalColllection.swift
//  Pitch
//
//  Created by James Bean on 12/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Collections

/// Collection of `PitchInterval` values
public struct PitchIntervalCollection/*: NoteNumberRepresentableCollection*/ {

    /// `NoteNumberRepresentableDyad` type.
    public typealias Dyad = PitchDyad
    
    /// `NoteNumberRepresentableInterval` type.
    public typealias Interval = PitchInterval
    
    // MARK: - Instance Properties
    
    /// Backing store of elements contained herein.
    public let base: Array<PitchInterval>

    public init <S> (_ sequence: S) where S: Sequence, S.Iterator.Element == PitchInterval {
        self.base = Array(sequence)
    }
}
