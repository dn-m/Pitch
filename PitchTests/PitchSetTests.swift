//
//  PitchSetTests.swift
//  Pitch
//
//  Created by James Bean on 5/17/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
@testable import Pitch

class PitchSetTests: XCTestCase {

    func testDyads() {
        var set: PitchSet = [60, 61, 62, 63]
        XCTAssertEqual(set.dyads.count, 6)
    }
    
    func testIsMonadic() {
        let pitchSet: PitchSet = [60]
        XCTAssert(pitchSet.isMonadic)
    }
    
    func testPitchClassSet() {
        let pitchSet: PitchSet = [63.5, 69.25]
        let pcs = pitchSet.pitchClassSet
        let pcs2: PitchClassSet = [3.5,9.25]
        XCTAssertEqual(pcs.set, pcs2.set)
    }
    
    func testInitPitchSetUnion() {
        let pitchSet1: PitchSet = [60, 61]
        let pitchSet2: PitchSet = [62, 63]
        let new = PitchSet(pitchSet1, pitchSet2)
        XCTAssertEqual(new, [60, 61, 62, 63])
    }
    
    func testFormUnion() {
        let pitchSet1: PitchSet = [60, 61]
        let pitchSet2: PitchSet = [62, 63]
        let new = pitchSet1.formUnion(with: pitchSet2)
        XCTAssertEqual(new, [60, 61, 62, 63])
    }
    
    func testArrayLiteralConvertible() {
        let _: PitchSet = [60.0, 61.0]
    }
    
    func testInitWithPitchSetsEmpty() {
        let pitchSets: [PitchSet] = []
        let pitchSet = PitchSet(pitchSets)
        XCTAssert(pitchSet.isEmpty)
    }
    
    func testInitWithPitchSetsSingle() {
        let pitchSets = [PitchSet([60])]
        let pitchSet = PitchSet(pitchSets)
        XCTAssertEqual(pitchSet, PitchSet([60]))
    }
    
    func testInitWithPitchSetsMultipleOverlapping() {
        let pitchSets = [PitchSet([60]), PitchSet([60,61]), PitchSet([65])]
        let pitchSet = PitchSet(pitchSets)
        XCTAssertEqual(pitchSet, PitchSet([60,61,65]))
    }
}
