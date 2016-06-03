//
//  PitchClassSequence.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

public struct PitchClassSequence: PitchConvertibleCollectionType {

    /// Array of the `PitchClass` values contained herein.
    public let array: Array<PitchClass>
}

extension PitchClassSequence: AnySequenceType {
    
    public typealias Element = PitchClass
    
    /// Iterable sequence of `Pitch` values contained herein.
    public var sequence: AnySequence<Element> { return AnySequence(array) }
    
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
