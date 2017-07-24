//
//  OrderedPitchClassIntervalSet.swift
//  Pitch
//
//  Created by James Bean on 12/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Collections


/// Ordered collection of `PitchClassInterval` types.
public struct PitchClassIntervalCollection/*: NoteNumberRepresentableCollection*/ {
    
    /// `NoteNumberRepresentableDyad` type.
    public typealias Dyad = PitchClassDyad
    
    /// `NoteNumberRepresentableInterval` type.
    public typealias Interval = PitchClassInterval
    
    /// Backing store of values.
    public let base: Array<PitchClassInterval>
}
