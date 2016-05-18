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

    func testInitWithNothing() {
        let _ = PitchSet()
    }
    
    func testInitWithOnePitchVariadic() {
        let _ = PitchSet(Pitch(noteNumber: 60))
    }
    
    func testInitWithArray() {
        let _ = PitchSet(pitches: [Pitch(noteNumber: 60), Pitch(noteNumber: 61)])
    }
    
    func testIterate() {
        let set = PitchSet(pitches: [Pitch(noteNumber: 60), Pitch(noteNumber: 61)])
        let expected = [Pitch(noteNumber: 60), Pitch(noteNumber: 61)]
        XCTAssertEqual(Set(set.map { $0 }), Set(expected))
    }
    
    func testDyads() {
        let set = PitchSet(
            pitches: [
                Pitch(noteNumber: 60),
                Pitch(noteNumber: 61),
                Pitch(noteNumber: 62),
                Pitch(noteNumber: 63)
            ]
        )
        XCTAssertEqual(set.dyads.count, 6)
    }
    
    func testArrayLiteralConvertible() {
        let _: PitchSet = [Pitch(noteNumber: 60), Pitch(noteNumber: 61)]
    }
}