//
//  PitchIntervalCollectionTests.swift
//  Pitch
//
//  Created by Jeremy Corren on 12/6/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
import ArrayTools
@testable import Pitch

class PitchIntervalCollectionTests: XCTestCase {
    
    struct PitchIntervalSequence: AnySequenceType {
        
        typealias Element = PitchInterval
        let array: [PitchInterval]
        
        var sequence: AnySequence<PitchInterval> {
            return AnySequence(array)
        }
        
        init <S: Sequence> (_ sequence: S) where S.Iterator.Element == Element {
            self.array = Array(sequence)
        }
        
        init(arrayLiteral elements: PitchInterval...) {
            self.array = Array(elements)
        }
    }
    
    func testSeqInitArrayLiteral() {
        let _: PitchIntervalSequence = [7.0, 12.0]
    }
    
    func testIterator() {
        let pis = PitchIntervalSequence([7.0,12.0])
        let pic = PitchIntervalCollection(pis)
        let ite = pic.makeIterator()
        XCTAssertEqual(ite.next(), 7.0)
    }
}
