//
//  NoteNumber.swift
//  Pitch
//
//  Created by James Bean on 3/12/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public typealias NoteNumber = Float

extension NoteNumber {
    
    public init(frequency: Frequency) {
        self = frequency // update
    }
    
    public func quantize(to resolution: Float) {
        fatalError()
    }
}