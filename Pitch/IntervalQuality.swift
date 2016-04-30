//
//  IntervalQuality.swift
//  Pitch
//
//  Created by James Bean on 4/30/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation
import EnumTools

public struct IntervalQuality: EnumTree {
    
    public typealias EnumKind = IntervalQualityKind
    public typealias EnumFamily = IntervalQuality
    
    public struct Unison {
        
    }
    
    public struct Second {
        
    }
    
    public struct Third {
        
    }
    
    public struct Fourth {
        
    }
    
    public struct Fifth {
        
    }
    
    public struct Sixth {
        
    }
    
    public struct Seventh {
        
    }
    
    private static let intervalQualityKindByIntervalClass:
        [IntervalClass: [IntervalQualityKind]] =
    [
        00: [.PerfectUnison, .AugmentedSeventh],
        01: [.MinorSecond, .AugmentedUnison],
        02: [.MajorSecond, .DiminishedThird],
        03: [.MinorThird, .AugmentedSecond],
        04: [.MajorThird, .DiminishedFourth],
        05: [.PerfectFourth, .AugmentedThird],
        06: [.DiminishedFifth, .AugmentedFourth],
        07: [.PerfectFifth, .DiminishedFifth],
        08: [.MinorSixth, .AugmentedFifth],
        09: [.MajorSixth, .DiminishedSeventh],
        10: [.MinorSeventh, .AugmentedSixth],
        11: [.MajorSeventh, .DiminishedOctave],
    ]
}

public enum IntervalQualityKind: String {
    
    case PerfectUnison = "P1"
    case AugmentedUnison = "A1"
    
    case MinorSecond = "m2"
    case MajorSecond = "M2"
    case AugmentedSecond = "A2"

    case DiminishedThird = "d3"
    case MinorThird	= "m3"
    case MajorThird	= "M3"
    case AugmentedThird = "A3"
    
    case DiminishedFourth = "d4"
    case PerfectFourth = "P4"
    case AugmentedFourth = "A4"
    
    case DiminishedFifth = "d5"
    
    case PerfectFifth = "P5"
    case AugmentedFifth = "A5"
    
    case DiminishedSixth = "d6"
    case MinorSixth = "m6"
    case MajorSixth = "M6"
    case AugmentedSixth = "A6"
    
    case DiminishedSeventh = "d7"
    case MinorSeventh = "m7"
    case MajorSeventh = "M7"
    case AugmentedSeventh = "A7"
    
    case DiminishedOctave = "d8"
    case PerfectOctave = "P8"
}