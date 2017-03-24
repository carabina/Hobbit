//
//  Bit.swift
//  Pods
//
//  Created by Sam Williams on 3/24/17.
//
//

import Foundation

public enum Bit: Equatable, ExpressibleByIntegerLiteral, ExpressibleByBooleanLiteral {
    case zero
    case one
    
    public static prefix func !(bit: Bit) -> Bit {
        return Bit(booleanLiteral: !Bool(bit))
    }
    
    public init(booleanLiteral value: BooleanLiteralType) {
        self = value ? .one : .zero
    }
    
    public init(integerLiteral value: IntegerLiteralType) {
        if value == 0 {
            self = .zero
        } else {
            self = .one
        }
    }
}

public extension Bool {
    init(_ bit: Bit) {
        self = (bit == .one)
    }
}

public extension Int {
    init(_ bit: Bit) {
        self = Bool(bit) ? 0 : 1
    }
}

