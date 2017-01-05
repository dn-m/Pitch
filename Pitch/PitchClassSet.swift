//
//  PitchClassSet.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Collections

/// Unordered set of unique `PitchClass` values.
public struct PitchClassSet: NoteNumberRepresentableSet {
    
    // MARK: - Associated Types
    
    /// Type of pairs of `Element` values contained herein.
    public typealias Dyad = PitchClassDyad
    
    /// Type of interval between two `Element` values contained herein.
    public typealias Interval = PitchClassInterval
    
    /// `PitchConvertible` type contained herein.
    public typealias Element = PitchClass
    
    // MARK: - Instance Properties
    
    /// `Set` holding `PitchClass` values.
    public let set: Set<Element>
    
    /// Array of `PitchClassDyads` comprising this `PitchClassSet`.
    public lazy var dyads: [PitchClassDyad] = {
        Array(self.set)
            .subsets(cardinality: 2)
            .map { PitchClassDyad($0[0], $0[1]) }
    }()
    
    // TODO: normal form
    // TODO: prime form
}

extension PitchClassSet: AnySequenceWrapping {
    
    // MARK: - `AnySequenceWrapping`
    
    /**
     Create an `AnySequenceWrapping` with a `Sequence` of any type.
     
     In the `init` method of the conforming `struct`, set the value of this private `var` with
     the given `sequence.
     */
    public init<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        self.set = Set(sequence)
    }
}

extension PitchClassSet: ExpressibleByArrayLiteral {
    
    // MARK: - `ExpressibleByArrayLiteral`
    
    /// Create a `PitchClassSequence` with an array literal.
    public init(arrayLiteral elements: Element...) {
        self.set = Set(elements)
    }
}
