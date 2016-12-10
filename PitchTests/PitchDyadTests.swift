//
//  PitchDyadTests.swift
//  Pitch
//
//  Created by Jeremy Corren on 12/6/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
import Pitch

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
    
    func testEqualityTrue() {
        let a: PitchDyad = .init(60,62)
        let b: PitchDyad = .init(60,62)
        XCTAssert(a == b)
    }
    
    func testEqualityFalseHigherNotEqual() {
        let a: PitchDyad = .init(60,62)
        let b: PitchDyad = .init(60,63)
        XCTAssertFalse(a == b)
    }
    
    func testEqualityFalseLowerNotEqual() {
        let a: PitchDyad = .init(60,62)
        let b: PitchDyad = .init(59,62)
        XCTAssertFalse(a == b)
    }
    
    func testEqualityFalseNeitherEqual() {
        let a: PitchDyad = .init(60,63)
        let b: PitchDyad = .init(59,62)
        XCTAssertFalse(a == b)
    }
}
