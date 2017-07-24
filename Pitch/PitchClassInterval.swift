//
//  PitchClassInterval.swift
//  Pitch
//
//  Created by James Bean on 3/13/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

/// Interval between two `Pitch.Class` values.
public struct PitchClassInterval: NoteNumberRepresentableInterval {
    
    // MARK: - Associated Types
    
    /// `NoteNumberRepresentable` type of values between which this interval lies.
    public typealias Element = Pitch.Class
    
    // MARK: - Instance Properties
    
    /// `NoteNumber` representation of this `PitchClassInterval`.
    public var noteNumber: NoteNumber
    
    // MARK: - Initializers
    
    /// Create a `PitchClassInterval` with a given `noteNumber`.
    public init(noteNumber: NoteNumber) {
        self.noteNumber = noteNumber
    }
    
    /// Create a `PitchClassInterval` with a `PitchInterval`.
    public init(_ interval: PitchInterval) {
        self.noteNumber = NoteNumber(
            interval.noteNumber.value.truncatingRemainder(dividingBy: 12.0)
        )
    }
    
    /// Create a `PitchClassInterval` with a `PitchClassDyad`.
    public init(dyad: PitchClassDyad) {
        self.noteNumber = dyad.higher.noteNumber - dyad.lower.noteNumber
    }
    
    /// Create a `PitchClassInterval` with two `Pitch.Class` types.
    public init(_ a: Pitch.Class, _ b: Pitch.Class) {
        self.init(dyad: PitchClassDyad(a,b))
    }
}
//
//extension PitchClassInterval: ExpressibleByIntegerLiteral {
//    
//    // MARK: - `ExpressibleByIntegerLiteral`
//    
//    /// Create an `IntervalClass` with an `IntegerLiteral`.
//    public init(integerLiteral value: Int) {
//        self.init(noteNumber: NoteNumber(Float(value)))
//    }
//}
//
//extension PitchClassInterval: ExpressibleByFloatLiteral {
//    
//    // MARK: - `ExpressibleByFloatLiteral`
//    
//    /// Create an `IntervalClass` with a `FloatLiteral`.
//    public init(floatLiteral value: Float) {
//        self.init(noteNumber: NoteNumber(value))
//    }
//}
