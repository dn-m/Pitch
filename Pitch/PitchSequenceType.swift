//
//  PitchSequenceType.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

protocol PitchSequenceType: AnySequenceType {
    
    var sequence: AnySequence<Pitch> { get }
}

extension PitchSequenceType {
    
    typealias Element = Pitch
}

