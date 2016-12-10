//
//  PitchClassDyadTests.swift
//  Pitch
//
//  Created by Jeremy Corren on 12/7/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
@testable import Pitch

class PitchClassDyadTests: XCTestCase {

    func testInterval() {
        let pcDyad = PitchClassDyad(PitchClass(3.0), PitchClass(7.0))
        XCTAssertEqual(pcDyad.interval, 4.0)
    }
    
    func testEquality() {
        let a = PitchClassDyad(3,7)
        let b = PitchClassDyad(3,7)
        XCTAssertEqual(a, b)
    }
}
