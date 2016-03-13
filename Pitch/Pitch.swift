//
//  Pitch.swift
//  Pitch
//
//  Created by James Bean on 3/12/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public struct Pitch: PitchType {
    
    public struct Dyad {
        public let lower: Pitch
        public let higher: Pitch
    }
    
    public struct Verticality {
        public var pitches: [Pitch]
    }
    
    public var interval: PitchType
    
    public let noteNumber: NoteNumber
    public let frequency: Frequency
    
    public let pitchClass: PitchType
    
    public init(noteNumber: NoteNumber) {
        self.noteNumber = noteNumber
        // TODO: calculate freq
        fatalError()
    }
    
    public init(frequency: Frequency) {
        self.frequency = frequency
        // TODO: calculate notenumber
        fatalError()
    }
}