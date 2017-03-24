//
//  DataReader.swift
//  Pods
//
//  Created by Sam Williams on 3/23/17.
//


import Foundation

public protocol MultibyteInteger {
    init(bigEndian value: Self)
    init(littleEndian value: Self)
}

public enum ByteOrder {
    case littleEndian
    case bigEndian
}

extension UInt16: MultibyteInteger { }
extension UInt32: MultibyteInteger { }
extension UInt64: MultibyteInteger { }

public struct DataReader {
    public var data: Data
    public var cursor = 0
    public var byteOrder = ByteOrder.bigEndian
    
    public init(data: Data) {
        self.data = data
    }
    
    public mutating func reset() {
        cursor = 0
    }
    
    public mutating func readData(bytes: Int) -> Data? {
        guard data.count >= cursor + bytes else { return nil }
        
        let result = data.subdata(in: cursor..<cursor + bytes)
        cursor += bytes
        return result
    }

    public mutating func readString(bytes: Int, encoding: String.Encoding = .nonLossyASCII) -> String? {
        guard let resultData = readData(bytes: bytes) else { return nil }
        return String(bytes: resultData, encoding: encoding)
    }

    public mutating func readUInt8() -> UInt8? {
        guard let resultData = readData(bytes: 1) else { return nil }
        return resultData[0]
    }

    public mutating func readUnsignedInteger<T: MultibyteInteger>() -> T? {
        guard let resultData = readData(bytes: MemoryLayout<T>.size) else { return nil }
        let content: T = resultData.withUnsafeBytes( { $0.pointee })
        switch self.byteOrder {
        case .bigEndian:
            return T.init(bigEndian: content)
        case .littleEndian:
            return T.init(littleEndian: content)
        }
    }

    public mutating func readUInt16() -> UInt16? { return self.readUnsignedInteger() }
    public mutating func readUInt32() -> UInt32? { return self.readUnsignedInteger() }
    public mutating func readUInt64() -> UInt64? { return self.readUnsignedInteger() }
}
