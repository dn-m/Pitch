
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
    
    // MARK: - Associated Types
    
    public typealias Element = Pitch
    
    // MARK: - Instance Properties
    
    /// Value of this `Interval`.
    public var noteNumber: NoteNumber
  
    // MARK: - Initializers
    
    /// Create a `PitchInterval` with a given `noteNumber`.
    public init(noteNumber: NoteNumber) {
        self.noteNumber = noteNumber
    }
    
    /// Create a `PitchInterval` with a `Dyad` of `Pitch` values.
    public init(dyad: PitchDyad) {
        self.noteNumber = dyad.higher.noteNumber - dyad.lower.noteNumber
    }
    
    /// Create a `PitchInterval` with two values of type `Element`.
    public init(_ a: Element, _ b: Element) {
        self.init(dyad: PitchDyad(a,b))
    }
}

extension PitchInterval: ExpressibleByIntegerLiteral {
    
    // MARK: - IntegerLiteralConvertible
    
    /**
     Create an `PitchInterval` with an `IntegerLiteral`.
     */
    public init(integerLiteral value: Int) {
        self.init(noteNumber: NoteNumber(Float(value)))
    }
}

extension PitchInterval: ExpressibleByFloatLiteral {
    
    // MARK: - FloatLiteralConvertible
    
    /**
     Create an `PitchInterval` with a `FloatLiteral`.
     */
    public init(floatLiteral value: Float) {
        self.init(noteNumber: NoteNumber(value))
    }
}
