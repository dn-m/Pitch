//
//  PitchClassSequence.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

/**
 Ordered collection of non-unique `PitchClass` values.
 */
public struct PitchClassSequence: PitchConvertibleCollectionType {

    // MARK: - Instance Properties
    
    /// Array of the `PitchClass` values contained herein.
    public let array: Array<PitchClass>
}

extension PitchClassSequence: AnySequenceType {
    
    // MARK: - AnySequenceType
    
    /// `PitchConvertible`-conforming type contained herein.
    public typealias Element = PitchClass
    
    /**
     Create a `PitchSet` with `SequenceType` containing `Pitch` values.
     */
    public init<S: SequenceType where S.Generator.Element == Element>(_ sequence: S) {
        self.array = Array(sequence)
    }
}

extension PitchClassSequence: ArrayLiteralConvertible {
    
    // MARK: - ArrayLiteralConvertible
    
    /**
     Create a `PitchClassSequence` with an array literal.
     */
    public init(arrayLiteral elements: PitchClass...) {
        self.array = elements
    }
}
