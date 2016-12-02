//
//  NoteNumberRepresentableSetType.swift
//  Pitch
//
//  Created by James Bean on 12/1/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/// Protocol definining an unordered set of unique `NoteNumberRepresentable`-conforming values.
public protocol NoteNumberRepresentableSetType: NoteNumberRepresentableContainer {
    
    // MARK: - Associates Types
    
    /// The type of `NoteNumberRepresentable` values contained herein.
    associatedtype Element: NoteNumberRepresentable
    
    // MARK: - Instance Properties
    
    /// Backing store of the values contained herein.
    var set: Set<Element> { get }
}

extension NoteNumberRepresentableSetType {
    
    // MARK: - PitchConvertibleContaining
    
    /// - returns: `true` if there are no values contained herein. Otherwsie `false`.
    public var isEmpty: Bool {
        return Array(set).count == 0
    }
    
    /// - returns: `true` if there is exactly one value contained herein. Otherwsie `false`.
    public var isMonadic: Bool {
        return Array(set).count == 1
    }
}

extension NoteNumberRepresentableSetType {
    
    // MARK: - AnySequenceType
    
    /// Iterable sequence of `NoteNumberRepresentable` values held by the conforming type
    public var sequence: AnySequence<Element> { return AnySequence(set) }
}

extension NoteNumberRepresentableSetType {
    
    // MARK: - CustomStringConvertible
    
    /// Printable description
    public var description: String { return "{\(map{ "\($0)" }.joined(separator: ","))}" }
}
