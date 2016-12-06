//
//  PitchIntervalTests.swift
//  Pitch
//
//  Created by Jeremy Corren on 12/6/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
@testable import Pitch

class PitchIntervalTests: XCTestCase {
    
    func testInit() {
        let _ = PitchInterval(noteNumber: 12.0)
        let _: PitchInterval = 12
        let _: PitchInterval = 12.0
    }
    
    func testInitWithDyad() {
        let pitch1 = Pitch(60.0)
        let pitch2 = Pitch(62.0)
        let _ = PitchInterval(pitch1, pitch2)
        
        let dyad = PitchDyad(pitch1, pitch2)
        let interval = PitchInterval(dyad: dyad)
        XCTAssertEqual(interval, 2.0)
    } 
}
