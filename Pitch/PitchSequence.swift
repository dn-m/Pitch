//
//  PitchSequence.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

public struct PitchSequence: PitchSequenceType {
    
    private let pitches: Array<Pitch>
    
    public var sequence: AnySequence<Pitch> { return AnySequence(pitches) }
    
    public init<S: SequenceType where S.Generator.Element == Pitch>(sequence: S) {
        self.pitches = Array(sequence)
    }
}
