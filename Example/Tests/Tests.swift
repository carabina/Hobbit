import UIKit
import XCTest
import Hobbit

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBit() {
        XCTAssertEqual(Bit.zero, 0)
        XCTAssertEqual(Bit.one, 1)
        XCTAssertEqual(!Bit.zero, Bit.one)
    }
    
    func testSingleBit() {
        var value: UInt8 = 0b00100100
        XCTAssertEqual(value[0], 0)
        XCTAssertEqual(value[1], 0)
        XCTAssertEqual(value[2], 1)
        XCTAssertEqual(value[3], 0)
        XCTAssertEqual(value[4], 0)
        XCTAssertEqual(value[5], 1)
        
        value[2] = 1
        XCTAssertEqual(value, 0b00100100)
        value[2] = 0
        XCTAssertEqual(value, 0b00100000)
        value[0] = 1
        XCTAssertEqual(value, 0b00100001)
        value[3] = 1
        XCTAssertEqual(value, 0b00101001)
        value[7] = 1
        XCTAssertEqual(value, 0b10101001)
        
        let value32: UInt32 = 0b10001000100100
        XCTAssertEqual(value32[5], 1)
    }
    
    func testRanges() {
        var value: UInt8 = 0b00100100
        XCTAssertEqual(value[2...5], 0b1001)
        XCTAssertEqual(value[2...6], 0b1001)
        
        value[2...6] = 0b11011
        XCTAssertEqual(value, 0b01101100)
    }
}
