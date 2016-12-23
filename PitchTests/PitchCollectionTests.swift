//
//  PitchCollectionTests.swift
//  Pitch
//
//  Created by Jeremy Corren on 12/6/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
import Collections
@testable import Pitch

class PitchCollectionTests: XCTestCase{
    
    struct PitchSequence: AnySequenceWrapping {

        typealias Element = Pitch
        let array: [Pitch]
        
        var sequence: AnySequence<Pitch> {
            return AnySequence(array)
        }
        
        init <S: Sequence> (_ sequence: S) where S.Iterator.Element == Element {
            self.array = Array(sequence)
        }
        
        init(arrayLiteral elements: Pitch...) {
            self.array = Array(elements)
        }
    }
    
    func testSeqInitArrayLiteral() {
        let _: PitchSequence = [60.0,62.0,65.0]
    }

    func testIterator() {
        let ps = PitchSequence([60.0,62.0,65.0])
        let collection = PitchCollection(ps)
        let ite = collection.makeIterator()
        XCTAssertEqual(ite.next(), 60.0)
    }
    
    func testIsEmpty() {
        let collection: PitchCollection = []
        XCTAssert(collection.isEmpty)
    }
    
    func testIsMonadic() {
        let collection: PitchCollection = [Pitch(60.0)]
        XCTAssert(collection.isMonadic)
    }
    
    func testIntervals() {
        let collection: PitchCollection = [Pitch(60.0), Pitch(62.0), Pitch(65.0)]
        let intervals = collection.intervals
        XCTAssertEqual(intervals, [2.0, 3.0])
    }
    
    func testDescription() {
        let collection: PitchCollection = [Pitch(60.0), Pitch(62.0)]
        XCTAssertEqual(collection.description, "〈60.0,62.0〉")
    }
    
    func testEquality() {
        let collection1: PitchCollection = [Pitch(60.0),Pitch(62.0)]
        let collection2: PitchCollection = [Pitch(60.0),Pitch(62.0)]
        XCTAssert(collection1 == collection2)
    }
}
