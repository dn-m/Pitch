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
    RandomAccessCollectionWrapping
{
    
    // MARK: - Associated Types
    
    /// `PitchConvertible`-conforming type of values contained herein.
    associatedtype Element: NoteNumberRepresentable
    
    // MARK: - Instance Properties
    
    /// Backing store of elements contained herein.
    var base: Array<Element> { get }
}
