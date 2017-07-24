//
//  Interval.swift
//  Pitch
//
//  Created by James Bean on 7/24/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

public struct Interval <Element: NoteNumberRepresentable> {

    let value: Element

    init(_ dyad: Dyad<Element>) {
        self.value = dyad.higher - dyad.lower
    }
}
