//
//  PitchClassInterval.swift
//  Pitch
//
//  Created by James Bean on 3/13/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

/** 
 Modulo 12 representation of an `Interval` value.
 */
public struct PitchClassInterval: NoteNumberRepresentableInterval {
    
    // MARK: - Instance Properties
    
    /// Value of this `IntervalClass`.
    public var noteNumber: NoteNumber
    
    // MARK: - Initializers
    
    public init(noteNumber: NoteNumber) {
        self.noteNumber = noteNumber
    }
    
    /**
     Create an `IntervalClass` with an `Interval`.
     */
    public init(_ interval: PitchInterval) {
        self.noteNumber = NoteNumber(
            interval.noteNumber.value.truncatingRemainder(dividingBy: 12.0)
        )
    }
    
    public init(dyad: PitchClassDyad) {
        self.noteNumber = dyad.higher.noteNumber - dyad.lower.noteNumber
    }
}

extension PitchClassInterval: ExpressibleByIntegerLiteral {
    
    // MARK: - IntegerLiteralConvertible
    
    /**
     Create an `IntervalClass` with an `IntegerLiteral`.
     */
    public init(integerLiteral value: Int) {
        self.noteNumber = NoteNumber(Float(value))
    }
}

extension PitchClassInterval: ExpressibleByFloatLiteral {
    
    // MARK: - FloatLiteralConvertible
    
    /**
     Create an `IntervalClass` with a `FloatLiteral`.
     */
    public init(floatLiteral value: Float) {
        self.noteNumber = NoteNumber(value)
    }
}
