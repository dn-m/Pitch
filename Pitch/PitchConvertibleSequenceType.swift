//
//  PitchConvertibleSequenceType.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

//public protocol PitchConvertibleSequenceType: AnySequenceType, PitchConvertibleContaining {
//    
//    
//}

//
//extension PitchConvertibleSequenceType {
//    
//    // MARK: - PitchSequenceType
//    
//    /// Iterable sequence of `Pitch` values contained herein.
//    public var sequence: AnySequence<Pitch> { return AnySequence(pitches) }
//    
//    /// - returns: `true` if there is one `Pitch` object herein. Otherwsie `false`.
//    public var isMonadic: Bool { return count == 1 }
//    
//    /**
//     Create a `PitchSet` with `SequenceType` containing `Pitch` values.
//     */
//    public init<S: SequenceType where S.Generator.Element == Pitch>(_ sequence: S) {
//        self.pitches = Array(sequence)
//    }
//}
