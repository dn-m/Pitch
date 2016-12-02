//
//  NoteNumberRepresentableContainer.swift
//  Pitch
//
//  Created by James Bean on 12/1/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

/// Protocol defining types containing `NoteNumberRepresentable` values.
public protocol NoteNumberRepresentableContainer: AnySequenceType {
    
    /// The types contained herein.
    associatedtype Element: NoteNumberRepresentable
    
    /// The type representing a dyad of the values contained herein.
    associatedtype Dyad: NoteNumberRepresentableDyad
    
    /// The type representing an interval of the values contained herein.
    associatedtype Interval: NoteNumberRepresentableInterval
    
    /// Backing store of values contained herein.
    var sequence: AnySequence<Element> { get }
}