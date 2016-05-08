//
//  PitchClassTests.swift
//  Pitch
//
//  Created by James Bean on 5/7/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
@testable import Pitch

class PitchClassTests: XCTestCase {

    func testPitchClass() {
        let pitch = Pitch(noteNumber: 60)
        XCTAssert(pitch.pitchClass == PitchClass(floatLiteral: 0.0))
    }
}
