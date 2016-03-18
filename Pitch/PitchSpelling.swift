//
//  PitchSpelling.swift
//  Pitch
//
//  Created by James Bean on 3/17/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public struct PitchSpelling {
    
    public typealias Octave = Int
    
    public enum LetterName {
        case A, B, C, D, E, F, G
    }
    
    public enum Fine: Float {
        case None = 0
        case Up = 1
        case Down = -1
    }
    
    public enum Coarse: Float {
        case Natural
        case QuarterSharp = 0.5
        case Sharp = 1
        case QuarterFlat = -0.5
        case Flat = -1
    }
    
    public let letterName: LetterName
    public let fine: Fine
    public let coarse: Coarse
    
    public init(letterName: LetterName, coarse: Coarse? = nil, fine: Fine? = nil) {
        self.letterName = letterName
        self.coarse = coarse ?? .Natural
        self.fine = fine ?? .None
    }
}