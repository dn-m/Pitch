//
//  PitchConvertibleSetType.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

/**
 Protocol definining an unordered set of unique `PitchConvterible`-conforming values.
 */
public protocol PitchConvertibleSetType: PitchConvertibleContaining {
    
    /// The `PitchConvertible` type contained herein.
    associatedtype Element: PitchConvertible
    
    /// `Set` holding `PitchConvertible`-conforming values.
    var set: Set<Element> { get }
}

extension PitchConvertibleSetType {
    
    /// - returns: `true` if there are no `Pitch` objects herein. Otherwsie `false`.
    public var isEmpty: Bool { return Array(set).count == 0 }

    /// - returns: `true` if there is one `Pitch` object herein. Otherwsie `false`.
    public var isMonadic: Bool { return Array(set).count == 1 }
    
    /// Iterable sequence of `PitchConvertible` values held by the conforming object.
    public var sequence: AnySequence<Element> { return AnySequence(set) }
    
    /// Printable description
    public var description: String { return "{\(map{ "\($0)" }.joinWithSeparator(","))}" }
}
