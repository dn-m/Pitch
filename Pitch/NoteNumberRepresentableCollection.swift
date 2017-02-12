//
//  NoteNumberRepresentableCollection.swift
//  Pitch
//
//  Created by James Bean on 12/1/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Collections

/// Ordered collection of `NoteNumberRepresentable` types.
public protocol NoteNumberRepresentableCollection:
    NoteNumberRepresentableContainer,
    Collection
{
    
    // MARK: - Associated Types
    
    /// `PitchConvertible`-conforming type of values contained herein.
    associatedtype Element: NoteNumberRepresentable
    
    // MARK: - Instance Properties
    
    /// Backing store of elements contained herein.
    var array: Array<Element> { get }
}

extension NoteNumberRepresentableCollection {
    
    // MARK: - `AnySequenceWrapping`
    
    /// Iterable sequence of `NoteNumberRepresentable` values contained herein.
    public var sequence: AnySequence<Element> { return AnySequence(array) }
}

extension NoteNumberRepresentableCollection {
    
    // MARK: - `PitchConvertibleContaining`
    
    /// - returns `true` if there are no `Pitch` values contained herein. Otherwise, `false`.
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    /// - returns `true` if there is one `Pitch` value contained herein. Otherwise `false`.
    public var isMonadic: Bool {
        return array.count == 1
    }
}

extension NoteNumberRepresentableCollection {
    
    // MARK: - `Collection`
    
    /// Start index
    public var startIndex: Int { return 0 }
    
    /// End index
    public var endIndex: Int { return array.count }
    
    /// Index after the given `i`.
    public func index(after i: Int) -> Int {
        guard i != endIndex else { fatalError("Cannot increment endIndex") }
        return i + 1
    }
    
    /// - returns: Value at the given `index`.
    public subscript(index: Int) -> Element {
        return array[index]
    }
}

extension NoteNumberRepresentableCollection {
    
    // MARK: - `CustomStringConvertible`
    
    /// Printed description of `PitchConvertibleCollectionType`.
    public var description: String {
        return "〈\(map { "\($0)" }.joined(separator: ","))〉"
    }
}
