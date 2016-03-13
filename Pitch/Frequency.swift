//
//  Frequency.swift
//  Pitch
//
//  Created by James Bean on 3/12/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public typealias Frequency = Float

extension Frequency {
    
    public init(noteNumber: NoteNumber) {
        self = 440.0 * pow(2.0, (noteNumber - 69.0) / 12.0)
    }
    
    public func quantize(to resolution: Float) -> Frequency {
        fatalError()
    }
}