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
        public static let Diminished: IntervalQualityKind = .DiminishedUnison
        public static let Perfect: IntervalQualityKind = .PerfectUnison
        public static let Augmented: IntervalQualityKind = .AugmentedUnison
        
        public static var members: [IntervalQualityKind] { return [Perfect, Augmented] }
    }
    
    public struct Second {
        public static let Minor: IntervalQualityKind = .MinorSecond
        public static let Major: IntervalQualityKind = .MajorSecond
        public static let Augmented: IntervalQualityKind = .AugmentedSecond
        
        public static var members: [IntervalQualityKind] { return [Minor, Major, Augmented] }
    }
    
    public struct Third {
        public static let Diminished: IntervalQualityKind = .DiminishedThird
        public static let Minor: IntervalQualityKind = .MinorThird
        public static let Major: IntervalQualityKind = .MajorThird
        public static let Augmented: IntervalQualityKind = .AugmentedThird
        
        public static var members: [IntervalQualityKind] {
            return [Diminished, Minor, Major, Augmented]
        }
    }
    
    public struct Fourth {
        public static let Diminished: IntervalQualityKind = .DiminishedFourth
        public static let Perfect: IntervalQualityKind = .PerfectFourth
        public static let Augmented: IntervalQualityKind = .AugmentedFourth
        
        public static var members: [IntervalQualityKind] {
            return [Diminished, Perfect, Augmented]
        }
    }
    
    public struct Fifth {
        public static let Diminished: IntervalQualityKind = .DiminishedFifth
        public static let Perfect: IntervalQualityKind = .PerfectFifth
        public static let Augmented: IntervalQualityKind = .AugmentedFifth
        
        public static var members: [IntervalQualityKind] {
            return [Diminished, Perfect, Augmented]
        }
    }
    
    public struct Sixth {
        public static let Diminished: IntervalQualityKind = .DiminishedSixth
        public static let Minor: IntervalQualityKind = .MinorSixth
        public static let Major: IntervalQualityKind = .MajorSixth
        public static let Augmented: IntervalQualityKind = .AugmentedSixth
        
        public static var members: [IntervalQualityKind] {
            return [Diminished, Minor, Major, Augmented]
        }
    }
    
    public struct Seventh {
        public static let Diminished: IntervalQualityKind = .DiminishedSeventh
        public static let Minor: IntervalQualityKind = .MinorSeventh
        public static let Major: IntervalQualityKind = .MajorSeventh
        public static let Augmented: IntervalQualityKind = .AugmentedSeventh
        
        public static var members: [IntervalQualityKind] {
            return [Diminished, Minor, Major, Augmented]
        }
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
        11: [.MajorSeventh, .DiminishedUnison],
    ]
    
    public func intervalQualityKinds(withIntervalClass intervalClass: IntervalClass)
        -> [IntervalQualityKind]
    {
        return []
    }
}

public enum IntervalQualityKind: String {
    
    case DiminishedUnison = "d1"
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
}