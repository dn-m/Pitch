//
//  Class.swift
//  Pitch
//
//  Created by James Bean on 3/13/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public struct PitchClass: FloatLiteralConvertible {
    
    public typealias FloatLiteralType = Float
    
    private let value: Float
    
    public init(floatLiteral: Float) {
        self.value = floatLiteral
    }
    
    public init(_ pitch: Pitch) {
        self.value = pitch.noteNumber % 12.0
    }
}

extension PitchClass: Comparable { }

public func == (lhs: PitchClass, rhs: PitchClass) -> Bool {
    return lhs.value == rhs.value
}

public func < (lhs: PitchClass, rhs: PitchClass) -> Bool {
    return lhs.value < rhs.value
}