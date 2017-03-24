//
//  BitwiseAccessible.swift
//  Pods
//
//  Created by Sam Williams on 3/24/17.
//
//

import Foundation

public protocol BitwiseAccessible: BitwiseOperations, Comparable {
    init(_ int: Int)
    static func -(lhs: Self, rhs: Self) -> Self
    static func +(lhs: Self, rhs: Self) -> Self
    static func <<(lhs: Self, rhs: Self) -> Self
    static func >>(lhs: Self, rhs: Self) -> Self
}

/**
 Easier bit accessors
 */
public extension BitwiseAccessible {
    /**
     Bit at index, lsb order
     */
    subscript(index: Self) -> Bit {
        get {
            let one = Self.init(1)
            let mask = one << index
            let result = (self & mask) >> index
            return result == one ? .one : .zero
        }
        set {
            let one = Self.init(1)
            let zero = Self.init(0)
            let new = Bool(newValue) ? one : zero
            self = (self & ~(one << index)) | (new << index)
        }
    }
    
    /**
     Bits in range as Self, lsb order
     */
    subscript(range: ClosedRange<Self>) -> Self {
        get {
            let one = Self.init(1)
            let zero = Self.init(0)
            let lsb = range.lowerBound
            let msb = range.upperBound
            return (self >> lsb) & ~(~zero << (msb - lsb + one))
        }
        set {
            let one = Self.init(1)
            let lsb = range.lowerBound
            let msb = range.upperBound
            let mask = (one << (msb - lsb + one)) - one;
            self &= ~(mask << lsb)
            self |= (newValue & mask) << lsb
        }
    }
}

extension UInt8:  BitwiseAccessible { }
extension UInt16: BitwiseAccessible { }
extension UInt32: BitwiseAccessible { }
extension UInt64: BitwiseAccessible { }
