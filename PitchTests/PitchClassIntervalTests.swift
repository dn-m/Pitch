//
//  PitchClassIntervalTests.swift
//  Pitch
//
//  Created by Jeremy Corren on 12/6/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
@testable import Pitch

class PitchClassIntervalTests: XCTestCase {
    
    func testInit() {
        let interval = PitchInterval(noteNumber: 2.0)
        let _ = PitchClassInterval(interval)
        let _: PitchClassInterval = 2
        let _: PitchClassInterval = 2.0
    }  
}
