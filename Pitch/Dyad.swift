//
//  Dyad.swift
//  Pitch
//
//  Created by James Bean on 7/24/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

public struct Dyad <Element: NoteNumberRepresentable> {

    let higher: Element
    let lower: Element

    init(_ lower: Element, _ higher: Element) {
        self.lower = lower
        self.higher = higher
    }
}
