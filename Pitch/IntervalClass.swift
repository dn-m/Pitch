//
//  IntervalClass.swift
//  Pitch
//
//  Created by James Bean on 3/13/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/// Modulo 12 representation of an `Interval` value.
public struct IntervalClass: FloatLiteralConvertible {
    
    public typealias FloatLiteralType = Float
    
    internal let value: Float
    
    public init(floatLiteral value: Float) {
        self.value = value
    }
    
    /**
     Create an `IntervalClass` with an `Interval`
     */
    public init(_ interval: Interval) {
        self.value = interval.value % 12.0
    }
}