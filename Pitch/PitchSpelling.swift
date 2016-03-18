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
    
    public let fine: Fine
    public let coarse: Coarse
    public let octave: Int?
    
    public init(fine: Fine, coarse: Coarse, octave: Octave? = nil) {
        self.fine = fine
        self.coarse = coarse
        self.octave = octave
    }
}