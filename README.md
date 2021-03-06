# Hobbit

[![Version](https://img.shields.io/cocoapods/v/Hobbit.svg?style=flat)](http://cocoapods.org/pods/Hobbit)
[![License](https://img.shields.io/cocoapods/l/Hobbit.svg?style=flat)](http://cocoapods.org/pods/Hobbit)
[![Platform](https://img.shields.io/cocoapods/p/Hobbit.svg?style=flat)](http://cocoapods.org/pods/Hobbit)

This is a simple library for making it easier to access bits and bytes.

## Installation

Hobbit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Hobbit"
```

## Bit access

Access individual bits and ranges of bits (lsb order) by subscripting any type that conforms to `BitwiseAccessible` (by default, UInt8 through UInt64).

Individual bits:

```swift
let value: UInt8 = 0b00000100
value[0]              // 0
value[1]              // 0
value[2]              // 1
value[3] = 1          // value is now 0b00001100
```

Ranges:
```swift
let value: UInt8 = 0b00000100
value[1...2]          // 0b10
value[2...4] = 0b111  // value is now 0b00011100
```

## Reading bytes from Data

Use a `DataReader` to read sequential `UInt`s and `String`s from a `Data` instance. Returned values will be nil if the requested data type can't be read.

```swift
let reader = DataReader(data: someData)
guard let id = reader.readUInt8() else { return }
guard let name = reader.readString(bytes: 3, encoding: .nonLossyASCII) else { return }
```

## License

Hobbit is available under the MIT license. See the LICENSE file for more info.
