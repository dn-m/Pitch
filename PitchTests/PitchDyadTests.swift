//
//  PitchDyadTests.swift
//  Pitch
//
//  Created by Jeremy Corren on 12/6/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
@testable import Pitch

class PitchDyadTests: XCTestCase {
    
    func testInitOrdered() {
        let dyad = PitchDyad(Pitch(60.0), Pitch(62.0))
        XCTAssertEqual(dyad.lower, 60.0)
        XCTAssertEqual(dyad.higher, 62.0)
    }
    
    func testInterval() {
        let dyad = PitchDyad(Pitch(60.0), Pitch(62.0))
        XCTAssertEqual(dyad.interval, 2.0)
    }
    
    func testDescription() {
        let dyad = PitchDyad(Pitch(60.0), Pitch(62.0))
        XCTAssertEqual(dyad.description, "60.0, 62.0")
    }
    
    func testEquality() {
        let dyad1 = PitchDyad(Pitch(60.0), Pitch(62.0))
        let dyad2 = PitchDyad(Pitch(60.0), Pitch(62.0))
        XCTAssert(dyad1 == dyad2)
    }
}
