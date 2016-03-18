//
//  PitchSpelling.swift
//  Pitch
//
//  Created by James Bean on 3/17/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/**
 Spelled representation of a `Pitch`.
 */
public struct PitchSpelling {
    
    /**
     Letter name component of a `PitchSpelling`
     */
    public enum LetterName {
        
        /// A.
        case A
        
        /// B.
        case B
        
        /// C.
        case C
        
        /// D.
        case D
        
        /// E.
        case E
        
        /// F.
        case F
        
        /// G.
        case G
    }
    
    /**
     Fine resolution component of a `PitchSpelling`. 
        Analogous to an up or down arrow of an accidental.
     
     - note: In 48-EDO, represents 1/8th-tone adjustment. 
        May be useful for other cases (e.g., -14c adjustment for 5th partial, etc.).
     */
    public enum Fine: Float {
        
        /// None.
        case None = 0
        
        /// Up.
        case Up = 1
        
        /// Down.
        case Down = -1
    }
    
    /**
     Coarse resolution component of a `PitchSpelling`.
        Analogous to the body of an accidental.
     */
    public enum Coarse: Float {
        
        /// Natural.
        case Natural
        
        /// QuarterSharp.
        case QuarterSharp = 0.5
        
        /// Sharp.
        case Sharp = 1
        
        /// QuarterFlat.
        case QuarterFlat = -0.5
        
        /// Flat.
        case Flat = -1
    }
    
    /// LetterName of a `PitchSpelling`.
    public let letterName: LetterName
    
    /// Fine resolution of a `PitchSpelling`
    public let fine: Fine
    
    /// Coarse resolution of a `PitchSpelling`.
    public let coarse: Coarse
    
    /**
     Create a `PitchSpelling`.
     */
    public init(letterName: LetterName, coarse: Coarse? = nil, fine: Fine? = nil) {
        self.letterName = letterName
        self.coarse = coarse ?? .Natural
        self.fine = fine ?? .None
    }
}
