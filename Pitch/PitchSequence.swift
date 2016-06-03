//
//  PitchSequence.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

/**
 Ordered collection of non-unique `Pitch` values.
 */
public struct PitchSequence: PitchConvertibleCollectionType {
    
    public typealias Element = Pitch
    
    public let array: Array<Pitch>
    
    // TODO: prime form
    // TODO: inverse
    // TODO: optional : retrograde inverse
    // TODO: trasposedBy()
    
    public var retrograde: PitchSequence { return PitchSequence(array.reverse()) }
}

extension PitchSequence: ArrayLiteralConvertible {
    
    // MARK: - ArrayLiteralConvertible
    
    /**
     Create a `PitchSequence` with an array literal.
     */
    public init(arrayLiteral elements: Element...) {
        self.array = elements
    }
}

extension PitchSequence: PitchSequenceType {
    
    // MARK: - PitchSequenceType
    
    /**
     Create a `PitchSet` with `SequenceType` containing `Pitch` values.
     */
    public init<S: SequenceType where S.Generator.Element == Pitch>(_ sequence: S) {
        self.array = Array(sequence)
    }
}

