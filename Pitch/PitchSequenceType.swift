//
//  PitchSequenceType.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

public protocol PitchSequenceType: AnySequenceType {
    
    var sequence: AnySequence<Pitch> { get }
    
    /// - returns `true` if there are no `Pitch` values contained herein. Otherwise, `false`.
    var isEmpty: Bool { get }
    
    /// - returns `true` if there is a single `Pitch` value contained herein. Otherwise `false`.
    var isMonadic: Bool { get }
}

extension PitchSequenceType {
    
    typealias Element = Pitch
    
    /// - returns: `true` if there are no `Pitch` objects herein. Otherwsie `false`.
    /// - TODO: refactor this up to `PitchSequenceType`
    public var isEmpty: Bool { return Array(sequence).count == 0 }
    
    /// - returns: `true` if there is one `Pitch` object herein. Otherwsie `false`.
    /// - TODO: refactor this up to `PitchSequenceType`
    public var isMonadic: Bool { return Array(sequence).count == 1 }
}

