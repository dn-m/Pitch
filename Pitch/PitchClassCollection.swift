//
//  PitchClassCollection.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Collections
import ArithmeticTools

/// Ordered collection of `PitchClass` values.
public struct PitchClassCollection: NoteNumberRepresentableCollection {

    // MARK: - Associated Types
    
    /// `PitchConvertible`-conforming type contained herein.
    public typealias Element = PitchClass
    
    /// `NoteNumberRepresentableDyad` type.
    public typealias Dyad = PitchClassDyad
    
    /// `NoteNumberRepresentableInterval` type.
    public typealias Interval = PitchClassInterval
    
    // MARK: - Instance Properties
    
    /// Array of the `PitchClass` values contained herein.
    public let array: Array<PitchClass>
    
    /// `PitchClassSequence` with `PitchClass` values in reverse order.
    ///
    /// - TODO: Move up `OrderedNoteNumberRespresentableSetType` protocol hierarchy.
    public var retrograde: PitchClassCollection {
        return PitchClassCollection(array.reversed())
    }
    
    /// `PitchClassSequence` with `PitchClass` values inverted around `0`.
    public var inversion: PitchClassCollection {
        return PitchClassCollection(map { $0.inversion })
    }
    
    /// Array of `IntervalClass` values between each adjacent `PitchClass` herein.
    ///
    /// - TODO: Refactor up the `NoteNumberRepresentableCollection` protocol hierarchy
    public lazy var intervals: PitchClassIntervalCollection = {
        return PitchClassIntervalCollection(
            self.array.adjacentPairs?.map(PitchClassInterval.init) ?? []
        )
    }()
    
    /// Array of `PitchClassDyad` values between each combination (choose 2) herein.
    public lazy var dyads: [PitchClassDyad] = {
        
        return self.array
            .subsets(cardinality: 2)
            .map { PitchClassDyad($0[0], $0[1]) }
    }()
}

extension PitchClassCollection: AnySequenceWrapping {
    
    // MARK: - `PitchCollection`
    
    /// Create a `PitchCollection` with `SequenceType` containing `Pitch` values.
    public init<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        self.array = Array(sequence)
    }
}

extension PitchClassCollection: Collection {
        
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
    public subscript(index: Int) -> PitchClass { return array[index] }
}

extension PitchClassCollection: ExpressibleByArrayLiteral {
    
    // MARK: - `ExpressibleByArrayLiteral`
    
    /// Create a `PitchClassSequence` with an array literal.
    public init(arrayLiteral elements: PitchClass...) {
        self.array = elements
    }
}
