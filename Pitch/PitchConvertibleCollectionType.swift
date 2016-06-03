//
//  PitchConvertibleCollectionType.swift
//  Pitch
//
//  Created by James Bean on 6/3/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import ArrayTools

public protocol PitchConvertibleCollectionType: PitchConvertibleContaining, CollectionType {
    
    associatedtype Element
    
    var array: Array<Element> { get }
}

extension PitchConvertibleCollectionType {
    
    public var isEmpty: Bool { return array.isEmpty }
    public var isMonadic: Bool { return array.count == 1 }
}

extension PitchConvertibleCollectionType {
    
    // MARK: CollectionType
    
    // MARK: - Associated Types
    
    /// Pitch type contained here
    
    /// Start index
    public var startIndex: Int { return 0 }
    
    /// End index
    public var endIndex: Int { return array.count }
    
    /**
     - returns: `Pitch` value at the given `index`.
     */
    public subscript(index: Int) -> Element { return array[index] }
}