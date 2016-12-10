//
//  NoteNumberRepresentableInterval.swift
//  Pitch
//
//  Created by James Bean on 12/1/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/// Protocol definining an interval between two `NoteNumberRepresentable` types
public protocol NoteNumberRepresentableInterval: NoteNumberRepresentable {
    
    // MARK: - Associated Types
    
    /// Type of `NoteNumberRepresentable` values between which this interval lies.
    associatedtype Element: NoteNumberRepresentable
    
    // MARK: - Initializers
    
    /// Create a `NoteNumberRepresentableInterval` with two values of type `Element`.
    init(_ a: Element, _ b: Element)
}

