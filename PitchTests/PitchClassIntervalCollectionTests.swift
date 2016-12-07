//
//  PitchClassIntervalCollectionTests.swift
//  Pitch
//
//  Created by Jeremy Corren on 12/6/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
import ArrayTools
@testable import Pitch

class PitchClassIntervalCollectionTests: XCTestCase {
    
    struct PitchClassIntervalSequence: AnySequenceType {
        
        typealias Element = PitchClassInterval
        let array: [PitchClassInterval]
        
        var sequence: AnySequence<PitchClassInterval> {
            return AnySequence(array)
        }
        
        init <S: Sequence> (_ sequence: S) where S.Iterator.Element == Element {
            self.array = Array(sequence)
        }
        
        init(arrayLiteral elements: PitchClassInterval...) {
            self.array = Array(elements)
        }
    }
    
    func testSeqInitArrayLiteral() {
        let _: PitchClassIntervalSequence = [2.0,3.0]
    }
    
    func testIterator() {
        let pcis = PitchClassIntervalSequence([2.0,3.0])
        let pcic = PitchClassIntervalCollection(pcis)
        let ite = pcic.makeIterator()
        XCTAssertEqual(ite.next(), 2.0)
    }
}
