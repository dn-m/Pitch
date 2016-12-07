//
//  PitchClassSequencesTests.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
import ArrayTools
@testable import Pitch

class PitchClassCollectionTests: XCTestCase {

    struct PitchClassSequence: AnySequenceType {
        
        typealias Element = PitchClass
        let array: [PitchClass]
        
        var sequence: AnySequence<PitchClass> {
            return AnySequence(array)
        }
        
        init <S: Sequence> (_ sequence: S) where S.Iterator.Element == Element {
            self.array = Array(sequence)
        }
        
        init(arrayLiteral elements: PitchClass...) {
            self.array = Array(elements)
        }
    }
    
    func testSeqInitArrayLiteral() {
        let _: PitchClassSequence = [60.0,62.0,65.0]
    }
    
    func testIterator() {
        let pcs = PitchClassSequence([60.0, 62.0, 64.0])
        let pcc = PitchClassCollection(pcs)
        let ite = pcc.makeIterator()
        XCTAssertEqual(ite.next(), 0)
    }
    
    func testInitArrayliteral() {
        let _: PitchClassCollection = [0,1,6]
    }
    
    func testIntervals() {
        var pcc: PitchClassCollection = [0,1,6]
        XCTAssertEqual(pcc.intervals, [1,5])
    }
    
    func testRetrograde() {
        let pcc: PitchClassCollection = [6,7,8,9,2]
        XCTAssertEqual(pcc.retrograde, [2,9,8,7,6])
    }
    
    func testInversion() {
        let pcc: PitchClassCollection = [6,7,8,9,2]
        XCTAssertEqual(pcc.inversion, [6,5,4,3,10])
    }
}
