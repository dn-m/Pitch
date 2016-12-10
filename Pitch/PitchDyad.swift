//
//  PitchDyad.swift
//  Pitch
//
//  Created by James Bean on 3/13/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import func ArithmeticTools.ordered

/**
 Collection of two `Pitch` values.
 
 - TODO: Make generic
 - TODO: Conform to `CollectionType`
 */
public struct PitchDyad: NoteNumberRepresentableDyad {
    
    public typealias Element = Pitch
    
    // MARK: - Instance properties
    
    /// Lower of two `Pitch` values.
    public let lower: Element
    
    /// Higher of two `Pitch` values.
    public let higher: Element
    
    /// `Interval` between two `Pitch` values.
    public var interval: PitchInterval {
        return .init(dyad: self)
    }
    
    // MARK: - Initializers
    
    /**
     Create a `Dyad` with two `Pitch` values. 
     
     - note: These pitches need not be ordered; they are ordered upon initialization.
     */
    public init(_ a: Element, _ b: Element) {
        (self.lower, self.higher) = ordered(a,b)
    }
}

extension PitchDyad: CustomStringConvertible {
    
    // MARK: - CustomStringConvertible
    
    /// Printed description
    public var description: String { return "\(lower), \(higher)" }
}

/**
 - returns: `true` if the values contained in each value are equivalent. Otherwise `false`.
 */
public func == (lhs: PitchDyad, rhs: PitchDyad) -> Bool {
    return lhs.lower == rhs.lower && lhs.higher == rhs.higher
}
