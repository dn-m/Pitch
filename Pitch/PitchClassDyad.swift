//
//  PitchClassDyad.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import func ArithmeticTools.ordered

/// Ordered pair of `Pitch.Class` values.
public struct PitchClassDyad: NoteNumberRepresentableDyad {
    
    // MARK: - Associated Types
    
    /// Type of `NoteNumberRepresentable` value contained herein.
    public typealias Element = Pitch.Class
    
    // MARK: - Instance Properties
    
    /// Interval between the two `Pitch.Class` values contained herein.
    var interval: PitchInterval {
        return PitchInterval(noteNumber: higher.noteNumber - lower.noteNumber)
    }
    
    /// Lower of two `Pitch.Class` values contained herein.
    public let lower: Element
    
    /// Higher of two `Pitch.Class` values contained herein.
    public let higher: Element
    
    // MARK: - Initializers
    
    /// Create a `PitchClassDyad` with two values of type `Element`.
    public init(_ a: Element, _ b: Element) {
        let (lower, higher) = ordered(a,b)
        self.lower = lower
        self.higher = higher
    }
}
