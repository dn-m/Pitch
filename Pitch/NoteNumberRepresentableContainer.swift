//
//  NoteNumberRepresentableContainer.swift
//  Pitch
//
//  Created by James Bean on 12/1/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools


public protocol NoteNumberRepresentableContainer: AnySequenceType {
    
    associatedtype Element: NoteNumberRepresentable
    
    var sequence: AnySequence<Element> { get }
}

extension NoteNumberRepresentableContainer {
    
    
}
