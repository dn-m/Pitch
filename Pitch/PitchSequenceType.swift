//
//  PitchSequenceType.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

// for now, AnySequenceType, inherit after
public protocol PitchSequenceType: AnySequenceType {
    
    /// Iterable sequence of `Pitch` values contained herein.
    var sequence: AnySequence<Pitch> { get }
}

extension PitchSequenceType {
    
    public typealias Element = Pitch
    
    /// Normal form of a `PitchSequenceType`.
    public var normalForm: PitchSequence { return PitchSequence(sequence.sort(<)) }
}


