//
//  PitchClassSet.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Collections

/// Unordered set of unique `Pitch.Class` values.
public struct PitchClassSet/*: NoteNumberRepresentableSet*/ {
    
    // MARK: - Associated Types
    
    /// Type of pairs of `Element` values contained herein.
    public typealias Dyad = PitchClassDyad
    
    /// Type of interval between two `Element` values contained herein.
    public typealias Interval = PitchClassInterval
    
    /// `PitchConvertible` type contained herein.
    public typealias Element = Pitch.Class

    /// Array of `PitchClassDyads` comprising this `PitchClassSet`.
    public var dyads: [PitchClassDyad] {
        return Array(base)
            .subsets(cardinality: 2)
            .map { PitchClassDyad($0[0], $0[1]) }
    }
    
    // MARK: - Instance Properties
    
    /// `Set` holding `Pitch.Class` values.
    public let base: Set<Element>
    
    public init <S> (_ sequence: S) where S: Sequence, S.Iterator.Element == Pitch.Class {
        self.base = Set(sequence)
    }
    
    // TODO: normal form
    // TODO: prime form
}
