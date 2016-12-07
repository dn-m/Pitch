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
        let pc1: PitchClass = 3.0
        let pc2: PitchClass = 7.0
        let pcDyad = PitchClassDyad(pc1, pc2)
        XCTAssertEqual(pcDyad.interval, 4.0)
    }
    
}
