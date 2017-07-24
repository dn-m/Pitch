//
//  Dyad.swift
//  Pitch
//
//  Created by James Bean on 7/24/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import ArithmeticTools

public struct Dyad <Element: NoteNumberRepresentable> {

    public var interval: UnorderedInterval<Element> {
        return UnorderedInterval(lower, higher)
    }

    public let lower: Element
    public let higher: Element

    public init(_ a: Element, _ b: Element) {
        (lower, higher) = ordered(a, b)
    }

    public init(_ elements: [Element]) {
        assert(elements.count == 2)
        let (a,b) = (elements[0], elements[1])
        self.init(a,b)
    }
}

extension Dyad: Equatable {

    // MARK: - `Equatable`

    /// - returns: `true` if the values contained in each value are equivalent. Otherwise `false`.
    public static func == (lhs: Dyad, rhs: Dyad) -> Bool {
        return lhs.lower == rhs.lower && lhs.higher == rhs.higher
    }
}

extension Dyad: CustomStringConvertible {

    public var description: String {
        return "(\(lower), \(higher))"
    }
}
