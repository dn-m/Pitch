
//
//  PitchInterval.swift
//  Pitch
//
//  Created by James Bean on 3/13/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArithmeticTools

/// Interval between two `Pitch` values.
public struct PitchInterval: NoteNumberRepresentableInterval {
    
    // MARK: - Instance Properties
    
    /// Value of this `Interval`.
    public var noteNumber: NoteNumber
    
    public init(noteNumber: NoteNumber) {
        self.noteNumber = noteNumber
    }
    
    /**
     Create an `Interval` with a `Dyad` of `Pitch` values.
     */
    public init(dyad: PitchDyad) {
        self.noteNumber = dyad.higher.noteNumber - dyad.lower.noteNumber
    }
}

/*
extension PitchInterval: ExpressibleByIntegerLiteral {
    
    // MARK: - IntegeralLiteralConvertible
    
    /**
     Create an `Interval` with an `IntegerLiteral`
     */
    public init(integerLiteral value: Int) {
        self.value = Float(value)
    }
}

extension PitchInterval: ExpressibleByFloatLiteral {
    
    // MARK: - FloatLiteralConvertible
    
    /**
     Create an `Interval` with a `FloatLiteral`.
     */
    public init(floatLiteral value: Float) {
        self.value = value
    }
}
*/
