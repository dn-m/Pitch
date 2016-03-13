//
//  PitchType.swift
//  Pitch
//
//  Created by James Bean on 3/12/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public protocol PitchType {
    
    var noteNumber: NoteNumber { get }
    var frequency: Frequency { get }
}