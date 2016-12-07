//
//  PitchSetCollectionTests.swift
//  Pitch
//
//  Created by Jeremy Corren on 12/7/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools
import XCTest
@testable import Pitch

class PitchSetCollectionTests: XCTestCase {
    
    struct PitchSetSequence: AnySequenceType {
        
        typealias Element = PitchSet
        let array: [PitchSet]
        
        var sequence: AnySequence<PitchSet> {
            return AnySequence(array)
        }
        
        init <S: Sequence> (_ sequence: S) where S.Iterator.Element == Element {
            self.array = Array(sequence)
        }
        
        init(arrayLiteral elements: PitchSet...) {
            self.array = Array(elements)
        }
    }
    
    func testSeqInitArrayLiteral() {
        let pitchSet1: PitchSet = [Pitch(60), Pitch(61)]
        let pitchSet2: PitchSet = [Pitch(62), Pitch(63)]
        let _: PitchSetSequence = [pitchSet1, pitchSet2]
        let _: PitchSetCollection = [pitchSet1, pitchSet2]
    }
    
    func testIterator() {
        let pitchSet1: PitchSet = [Pitch(60), Pitch(61)]
        let pitchSet2: PitchSet = [Pitch(62), Pitch(63)]
        let pss = PitchSetSequence([pitchSet1, pitchSet2])
        let psc = PitchSetCollection(pss)
        var ite = psc.makeIterator()
        XCTAssertEqual(ite.next(), pitchSet1)
    }
}
