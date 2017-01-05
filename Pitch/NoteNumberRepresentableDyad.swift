//
//  NoteNumberRepresentableDyad.swift
//  Pitch
//
//  Created by James Bean on 12/1/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

/// Protocol definining a dyad (ordered pair) of `NoteNumberRepresentable` types.
public protocol NoteNumberRepresentableDyad: Equatable {
    
    // MARK: - Associated Types
    
    /// The concrete type of `NoteNumberRepresentable`-conforming values contained herein.
    associatedtype Element: NoteNumberRepresentable
    
    // MARK: - Instance Properties
    
    /// The lower of two `Element` values.
    var lower: Element { get }
    
    /// The higher of two `Element` values.
    var higher: Element { get }
    
    // MARK: - Initializers
    
    /// Create a `NoteNumberRepresentableDyad` with two values of type `Element`.
    init(_ a: Element, _ b: Element)
}

// MARK: - `Equatable`

/// - returns: `true` if the values contained in each value are equivalent. Otherwise `false`.
public func == <T: NoteNumberRepresentableDyad> (lhs: T, rhs: T) -> Bool {
    return lhs.lower == rhs.lower && lhs.higher == rhs.higher
}
