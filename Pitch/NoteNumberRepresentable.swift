//
//  NoteNumberRepresentable.swift
//  Pitch
//
//  Created by James Bean on 12/1/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArithmeticTools

/// Protocol defining values representable by a `NoteNumber`
public protocol NoteNumberRepresentable: Comparable, Hashable {
    
    // MARK: - Instance Properties
    
    /// The `NoteNumber` representation of the instance of `NoteNumberRepresentable` type.
    var noteNumber: NoteNumber { get }
    
    // MARK: - Initializers
    
    /// Create a `NoteNumberRepresentable` value with `NoteNumber`.
    init(noteNumber: NoteNumber)
}

/// - returns: `true` if both values are representable by the same `NoteNumber`.
///            Otherwise, `false`.
public func == <T: NoteNumberRepresentable> (lhs: T, rhs: T) -> Bool {
    return lhs.noteNumber == rhs.noteNumber
}

/// - returns: `true` if the first value is less than the seconds value. Otherwise, `false`.
public func < <T: NoteNumberRepresentable> (lhs: T, rhs: T) -> Bool {
    return lhs.noteNumber < rhs.noteNumber
}

/// - returns: A `NoteNumberRepresentable` value that is the difference between the two given
///            values.
public func - <T: NoteNumberRepresentable> (lhs: T, rhs: T) -> T {
    return T(noteNumber: NoteNumber(lhs.noteNumber.value - rhs.noteNumber.value))
}

extension NoteNumberRepresentable {

    // MARK: - Hashable

    /// Hash value of a `NoteNumberRepresentable` type.
    public var hashValue: Int {
        return noteNumber.hashValue
    }
}