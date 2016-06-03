//
//  PitchConvertibleContaining.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

/**
 The highest level protocol for any PitchConvertible containing structure.
 
 Currently for things like:
 - PitchSequence
 - PitchSet
 - PitchClassSequence
 - PitchClassSet
 - IntervalSequence
 - IntervalSet
 */
public protocol PitchConvertibleContaining: AnySequenceType {
 
    // MARK: - Associated Types
    
    /// The `PitchConvertible` type element contained herein.
    associatedtype Element = PitchConvertible
    
    /// Iterable sequence of `Pitch` values contained herein.
    var sequence: AnySequence<Element> { get }
    
    /// - returns `true` if there are no `Pitch` values contained herein. Otherwise, `false`.
    var isEmpty: Bool { get }
    
    /// - returns `true` if there is one `Pitch` value contained herein. Otherwise `false`.
    var isMonadic: Bool { get }
}
