//
//  NoteNumber.swift
//  Pitch
//
//  Created by James Bean on 3/12/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/**
 MIDI equivalent nn. 60.0 = middle-c.
 */
public struct NoteNumber: FloatLiteralConvertible {
    
    public typealias FloatLiteralType = Float
    
    internal let value: Float

    public init(floatLiteral value: Float) {
        self.value = value
    }
    
    /**
     Create a `NoteNumber` with `Frequency` value.
     */
    public init(frequency: Frequency) {
        self.value = 69.0 + (12.0 * (log(frequency.value / 440.0)/log(2.0)))
    }
 
    /**
     - `1`: quantize to a half-tone
     - `0.5`: quantize to a quarter-tone
     - `0.25`: quantize to an eighth-tone
     
     - returns: `NoteNumber` that is quantized to the desired `resolution`.
     */
    public func quantized(to resolution: Float) -> NoteNumber {
        return NoteNumber(floatLiteral: round(value / resolution) * resolution)
    }
}

extension NoteNumber: Comparable { }

public func == (lhs: NoteNumber, rhs: NoteNumber) -> Bool {
    return lhs.value == rhs.value
}

public func < (lhs: NoteNumber, rhs: NoteNumber) -> Bool {
    return lhs.value < rhs.value
}