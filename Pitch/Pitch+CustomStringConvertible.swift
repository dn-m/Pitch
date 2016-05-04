//
//  Pitch+CustomStringConvertible.swift
//  Pitch
//
//  Created by James Bean on 5/4/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

extension Pitch: CustomStringConvertible {
    
    public var description: String { return "\(noteNumber)" }
}