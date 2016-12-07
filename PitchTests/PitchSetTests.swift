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
        var set = PitchSet(
            [
                Pitch(noteNumber: 60),
                Pitch(noteNumber: 61),
                Pitch(noteNumber: 62),
                Pitch(noteNumber: 63)
            ]
        )
        XCTAssertEqual(set.dyads.count, 6)
    }
    
    func testPitchClassSet() {
        let pitchSet: PitchSet = [Pitch(63.5), Pitch(69.25)]
        let pcs = pitchSet.pitchClassSet
        let pcs2: PitchClassSet = [3.5,9.25]
        XCTAssertEqual(pcs.set, pcs2.set)
    }
    
    func testInitPitchSetUnion() {
        let pitchSet1: PitchSet = [Pitch(60), Pitch(61)]
        let pitchSet2: PitchSet = [Pitch(62), Pitch(63)]
        let new = PitchSet(pitchSet1, pitchSet2)
        XCTAssert(new == [Pitch(60), Pitch(61), Pitch(62), Pitch(63)])
        
    }
    
    func testFormUnion() {
        let pitchSet1: PitchSet = [Pitch(60), Pitch(61)]
        let pitchSet2: PitchSet = [Pitch(62), Pitch(63)]
        let new = pitchSet1.formUnion(with: pitchSet2)
        XCTAssert(new == [Pitch(60), Pitch(61), Pitch(62), Pitch(63)])
    }
    
    func testDescription() {
        let pitchSet: PitchSet = [Pitch(61), Pitch(60)]
        XCTAssertEqual(pitchSet.description, "[\"61.0\", \"60.0\"]")
    }
    
    func testArrayLiteralConvertible() {
        let _: PitchSet = [Pitch(noteNumber: 60.0), Pitch(noteNumber: 61.0)]
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
