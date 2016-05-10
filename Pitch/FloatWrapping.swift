//
//  FloatWrapping.swift
//  Pitch
//
//  Created by James Bean on 5/9/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public protocol FloatWrapping: FloatLiteralConvertible, Comparable, Hashable {

    associatedtype FloatLiteralType = Float
    var value: Float { get }
}

extension FloatWrapping where FloatLiteralType == Float {
    
    public init(value: Float) {
        self.init(floatLiteral: value)
    }
    
    public var hashValue: Int { return value.hashValue }
}

public func == <T: FloatWrapping>(lhs: T, rhs: T) -> Bool {
    return lhs.value == rhs.value
}

public func < <T: FloatWrapping>(lhs: T, rhs: T) -> Bool {
    return lhs.value < rhs.value
}
