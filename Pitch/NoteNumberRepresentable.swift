//
//  NoteNumberRepresentable.swift
//  Pitch
//
//  Created by James Bean on 12/1/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArithmeticTools

public protocol NoteNumberRepresentable: Comparable, Hashable/*, FloatWrapping*/ {
    
    var noteNumber: NoteNumber { get }
    
    init(noteNumber: NoteNumber)
}

public func - <T: NoteNumberRepresentable> (lhs: T, rhs: T) -> T {
    return T(noteNumber: NoteNumber(lhs.noteNumber.value - rhs.noteNumber.value))
}

public func == <T: NoteNumberRepresentable> (lhs: T, rhs: T) -> Bool {
    return lhs.noteNumber == rhs.noteNumber
}

public func < <T: NoteNumberRepresentable> (lhs: T, rhs: T) -> Bool {
    return lhs.noteNumber < rhs.noteNumber
}

extension NoteNumberRepresentable {
    
    public var hashValue: Int {
        return noteNumber.hashValue
    }
}
