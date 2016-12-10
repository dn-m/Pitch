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
        let _ = PitchInterval(Pitch(60.0), Pitch(62.0))
        let dyad = PitchDyad(Pitch(60.0), Pitch(62.0))
        let interval = PitchInterval(dyad: dyad)
        XCTAssertEqual(interval, 2.0)
    }
    
    func testEquatable() {
        let a: PitchInterval = .init(48, 51)
        let b: PitchInterval = .init(48, 51)
        XCTAssert(a == b)
    }
}
