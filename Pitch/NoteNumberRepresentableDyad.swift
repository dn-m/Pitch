//
//  NoteNumberRepresentableDyad.swift
//  Pitch
//
//  Created by James Bean on 12/1/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import func ArithmeticTools.ordered

public protocol NoteNumberRepresentableDyad {
    
    associatedtype Element: NoteNumberRepresentable
    
    var lower: Element { get }
    var higher: Element { get }
    
    init(_ a: Element, _ b: Element)
}
