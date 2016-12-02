//
//  PitchClassDyad.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import func ArithmeticTools.ordered

public struct PitchClassDyad: NoteNumberRepresentableDyad {
    
    public typealias Element = PitchClass
    
    public let lower: Element
    
    public let higher: Element
    
    var interval: PitchInterval {
        return PitchInterval(noteNumber: higher.noteNumber - lower.noteNumber)
    }
    
    public init(_ a: Element, _ b: Element) {
        let (lower, higher) = ordered(a,b)
        self.lower = lower
        self.higher = higher
    }
}
