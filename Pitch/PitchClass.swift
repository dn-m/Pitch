//
//  Class.swift
//  Pitch
//
//  Created by James Bean on 3/13/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArithmeticTools

public struct PitchClass: FloatWrapping {
    
    public let value: Float
    
    public init(floatLiteral: Float) {
        self.value = floatLiteral
    }
    
    public init(integerLiteral value: Int) {
        self.value = Float(value)
    }
    
    public init(_ pitch: Pitch) {
        self.value = pitch.noteNumber.value % 12.0
    }
}
