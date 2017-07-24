//
//  NoteNumberRepresentableSet.swift
//  Pitch
//
//  Created by James Bean on 12/1/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

/// Protocol definining an unordered set of unique `NoteNumberRepresentable`-conforming values.
public protocol NoteNumberRepresentableSet: NoteNumberRepresentableContainer {
    
    // MARK: - Associates Types
    
    /// The type of `NoteNumberRepresentable` values contained herein.
    associatedtype Element: NoteNumberRepresentable
    
    // MARK: - Instance Properties
    
    /// Backing store of the values contained herein.
    var set: Set<Element> { get }
}

//extension NoteNumberRepresentableSet {
//    
//    // MARK: - `Equatable`
//    
//    /// - returns: `true` if the values contained in each value are equivalent. Otherwise `false`.
//    public static func == (lhs: Self, rhs: Self) -> Bool {
//        return lhs.set == rhs.set
//    }
//}
//
//extension NoteNumberRepresentableSet {
//    
//    // MARK: - `PitchConvertibleContaining`
//    
//    /// - returns: `true` if there are no values contained herein. Otherwsie `false`.
//    public var isEmpty: Bool {
//        return Array(set).count == 0
//    }
//    
//    /// - returns: `true` if there is exactly one value contained herein. Otherwsie `false`.
//    public var isMonadic: Bool {
//        return Array(set).count == 1
//    }
//}
//
//extension NoteNumberRepresentableSet {
//    
//    // MARK: - `AnySequenceWrapping`
//    
//    /// Iterable sequence of `NoteNumberRepresentable` values held by the conforming type
//    public var sequence: AnySequence<Element> {
//        return AnySequence(set)
//    }
//}
//
//extension NoteNumberRepresentableSet {
//    
//    // MARK: - `CustomStringConvertible`
//    
//    /// Printable description
//    public var description: String { return "{\(map{ "\($0)" }.joined(separator: ","))}" }
//}
