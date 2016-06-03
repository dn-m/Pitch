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
 
 - TODO: inverse, retrograde, retrograde inverse, transposition at ...,
 
 */
public struct PitchSequence {
    
    private let pitches: Array<Pitch>
    
    // TODO: prime form
    // TODO: inverse
    // TODO: optional : retrograde inverse
    // TODO: trasposedBy()
    
    public var retrograde: PitchSequence { return PitchSequence(pitches.reverse()) }
}

extension PitchSequence: ArrayLiteralConvertible {
    
    // MARK: - ArrayLiteralConvertible
    
    /**
     Create a `PitchSequence` with an array literal.
     */
    public init(arrayLiteral elements: Pitch...) {
        self.pitches = elements
    }
}

extension PitchSequence: PitchSequenceType {
    
    // MARK: - PitchSequenceType
    
    /// Iterable sequence of `Pitch` values contained herein.
    public var sequence: AnySequence<Pitch> { return AnySequence(pitches) }
    
    /// - returns: `true` if there is one `Pitch` object herein. Otherwsie `false`.
    public var isMonadic: Bool { return count == 1 }
    
    /**
     Create a `PitchSet` with `SequenceType` containing `Pitch` values.
     */
    public init<S: SequenceType where S.Generator.Element == Pitch>(_ sequence: S) {
        self.pitches = Array(sequence)
    }
}

extension PitchSequence: CollectionType {
    
    // MARK: CollectionType
    
    // MARK: - Associated Types
    
    /// Pitch type contained here
    public typealias Element = Pitch
    
    /// Start index
    public var startIndex: Int { return 0 }
    
    /// End index
    public var endIndex: Int { return pitches.count }
    
    /**
     - returns: `Pitch` value at the given `index`.
     */
    public subscript(index: Int) -> Element { return pitches[index] }
}

extension PitchSequence: CustomStringConvertible {
    
    // MARK: - CustomStringConvertible
    
    /// Printed description of `PitchSequence`.
    public var description: String {
        return "〈\(map{ "\($0)" }.joinWithSeparator(","))〉"
    }
}
