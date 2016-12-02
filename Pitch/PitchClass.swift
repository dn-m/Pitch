//
//  Class.swift
//  Pitch
//
//  Created by James Bean on 3/13/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArithmeticTools

/**
 Modulo 12 representation of `noteNumber` of `Pitch`.
 */
public struct PitchClass: NoteNumberRepresentable {
    
    // MARK: - Instance Properties
    
    /// Inversion of `PitchClass`.
    public var inversion: PitchClass {
        return PitchClass(12 - noteNumber.value)
    }
    
    public var value: Float {
        return noteNumber.value
    }
    
    /// Value of `PitchClass`.
    public var noteNumber: NoteNumber
    
    public init(noteNumber: NoteNumber) {
        self.noteNumber = noteNumber
    }
}

extension PitchClass: ExpressibleByIntegerLiteral {
    
    // MARK: - IntegerLiteralConvertible
    
    /**
     Create a `PitchClass` with an `IntegerLiteralType`.
     
     **Example:**
     
     ```
     let pitchClass = 49 // => 1.0
     ```
     */
    public init(integerLiteral value: Int) {
        self.noteNumber = NoteNumber(Float(value).truncatingRemainder(dividingBy: 12.0))
    }
}

extension PitchClass: ExpressibleByFloatLiteral {
    
    // MARK: - IntegerLiterlConvertible
    
    /**
     Create a `PitchClass` with a `FloatLiteralType`.
     
     **Example:**
     
     ```
     let pitchClass = 49.5 // => 1.5
     ```
     */
    public init(floatLiteral: Float) {
        self.noteNumber = NoteNumber(floatLiteral.truncatingRemainder(dividingBy: 12.0))
    }
}

extension PitchClass: PitchConvertible {
    
    // MARK: - PitchConvertible
    
    /**
     Create a `PitchClass` with a `Pitch` object.
     
     **Example:**
     
     ```
     let pitch = Pitch(noteNumber: 65.5)
     PitchClass(pitch) // => 5.5
     ```
     */
    public init(_ pitch: Pitch) {
        self.noteNumber = NoteNumber(
            pitch.noteNumber.value.truncatingRemainder(dividingBy: 12.0)
        )
    }
}
