//
//  FHIRKitTimeTests.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import FHIRKit
import XCTest

class FHIRKitTimeTests: XCTestCase {
  
  func timeRenderingTest() {
    let timeString = "16:20:00"
    var time = try! FHIRKitTime(timeString)
    let expectedTime = FHIRKitTime(hour: 16, minute: 20, second: 0.0)
    XCTAssertEqual(time, expectedTime)
    XCTAssertEqual(time.description, timeString)
    
    time.hour = 1
    XCTAssertEqual(time, FHIRKitTime(hour: 1, minute: 20, second: 0.0))
    XCTAssertEqual(time.description, "01:20:00")
    
    time.minute = 23
    XCTAssertEqual(time, FHIRKitTime(hour: 1, minute: 23, second: 0.0))
    XCTAssertEqual(time.description, "01:23:00")
    
    time.second = 45
    XCTAssertEqual(time, FHIRKitTime(hour: 1, minute: 23, second: 45.0))
    XCTAssertEqual(time.description, "01:23:45")
    
    time.second = 45.67
    XCTAssertEqual(time, FHIRKitTime(hour: 1, minute: 23, second: 45.67))
    XCTAssertEqual(time.description, "01:23:45.67")
  }
  
  func testWholeTimeParsing() {
    
    // whole time parsing
    let wholeTimeParseSet = [
      ("00:00:00", FHIRKitTime(hour: 0, minute: 0, second: 0.0)),
      ("01:23:45", FHIRKitTime(hour: 1, minute: 23, second: 45.0)),
      ("09:41:60.0", FHIRKitTime(hour: 9, minute: 41, second: 60.0)),
      ("11:22:33.0", FHIRKitTime(hour: 11, minute: 22, second: 33.0)),
      ("16:20:00.0", FHIRKitTime(hour: 16, minute: 20, second: 0.0)),
      ("16:20:06.9", FHIRKitTime(hour: 16, minute: 20, second: 6.9)),
      ("18:19:20.00000", FHIRKitTime(hour: 18, minute: 19, second: 20.0)),
      ("23:59:59.99", FHIRKitTime(hour: 23, minute: 59, second: 59.99)),
      ("23:59:60.0", FHIRKitTime(hour: 23, minute: 59, second: 60.0))
    ]
    
    for (timeString, expectedTime) in wholeTimeParseSet {
      do {
        let time = try FHIRKitTime(timeString)
        XCTAssertEqual(time, expectedTime)
        XCTAssertEqual(time.description, timeString)
        XCTAssertNotNil(time.originalSecondsString)
      } catch {
        XCTFail("Should succeed parsing \"\(timeString)\" but threw \(error) instead")
      }
    }
  }
  
  func testHourParsing() {
    // Hour parsing
    let hourParseSet = [
      (" 00:00:00", 0),
      (" 12:00:00", 0),
      ("T13:00:00",0),
      ("24:00:00",0),
      ("69:00:00",0)
    ]
    
    for (timeString, location) in hourParseSet {
      do {
        let time = try FHIRKitTime(timeString)
        XCTFail("Should fail to parse time string: \"\(timeString)\" but succeeded anyway. Parsed: \(time)")
      } catch FHIRKitDateParserError.invalidHour(let position) {
        let expectedPosition = FHIRKitDateParserErrorPosition(string: timeString, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw FHIRKitDateParserError.invalidHour but threw \(error) instead")
      }
    }
  }
  
  func testMinuteParsing() {
    // minute parsing
    let minuteParseSet = [
      ("12:60:00", 3),
      ("12:96:00", 3)
    ]
    
    for (timeString, location) in minuteParseSet {
      do {
        let time = try FHIRKitTime(timeString)
        XCTFail("Should fail to parse time string: \"\(timeString)\" but succeeded anyway. Parsed: \(time)")
      } catch FHIRKitDateParserError.invalidMinute(let position) {
        let expectedPosition = FHIRKitDateParserErrorPosition(string: timeString, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw FHIRKitDateParserError.invalidMinute but threw \(error) instead")
      }
    }
  }
  
  func testSecondParsing() {
    // second parsing
    let secondParseSet = [
      ("09:41:69", 6),
      ("09:41:50.", 9),
      ("09:41:60.0001", 9)
    ]
    
    for (timeString, location) in secondParseSet {
      do {
        let time = try FHIRKitTime(timeString)
        XCTFail("Should fail to parse time string: \"\(timeString)\" but succeeded anyway. Parsed: \(time)")
      } catch FHIRKitDateParserError.invalidSecond(let position) {
        let expectedPosition = FHIRKitDateParserErrorPosition(string: timeString, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw FHIRKitDateParserError.invalidSecond but threw \(error) instead")
      }
    }
  }
  
  func testSeparatorParsing() {
    let separatorParseSet = [
      ("9:00:00", 1),
      ("019:00:00", 3),
      ("09:2:30", 4),
      ("09:022:30", 6),
      ("09:41:0", 7),
      ("09:41:000", 9),
      ("09 41 50", 2),
      ("09-41-50", 2),
      ("09:41 50", 5),
      ("09:41-50", 5)
    ]
    
    for (timeString, location) in separatorParseSet {
      do {
        let time = try FHIRKitTime(timeString)
        XCTFail("Should fail to parse time string: \"\(timeString) but succeeded anyway. Parsed: \(time)")
      } catch FHIRKitDateParserError.invalidSeparator(let position) {
        let expectedPosition = FHIRKitDateParserErrorPosition(string: timeString, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw FHIRKitDateParserError.invalidSeparator but threw \(error) instead")
      }
    }
  }
  
  func testExtraCharacterParsing() {
    let extraCharsSet = [
      ("09:41:50Z", 8),
      ("09:41:50-08:00", 8),
      ("09:41:50 ", 8),
      ("09:41:50+", 8)
    ]
    
    for (timeString, location) in extraCharsSet {
      do {
        let time = try FHIRKitTime(timeString)
        XCTFail("Should fail to parse time string: \"\(timeString)\" but succeeded anyway. Parsed: \(time)")
      } catch FHIRKitDateParserError.additionalCharacters(let position) {
        let expectedPosition = FHIRKitDateParserErrorPosition(string: timeString, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw FHIRKitDateParserError.additionalCharacters but threw \(error) instead")
      }
    }
  }
  
  func testComparison() throws {
    try assertLeftToRight("13:44:00", "13:44:02", compares: .orderedAscending)
    try assertLeftToRight("13:44:01", "13:44:02", compares: .orderedAscending)
    try assertLeftToRight("13:44:01.999999", "13:44:02", compares: .orderedAscending)
    try assertLeftToRight("13:44:02", "13:44:02", compares: .orderedSame)
    try assertLeftToRight("13:44:03", "13:44:02.99999", compares: .orderedDescending)
    try assertLeftToRight("13:44:03", "13:44:02", compares: .orderedDescending)
    
    try assertLeftToRight("13:44:02", "13:45:02", compares: .orderedAscending)
    try assertLeftToRight("13:44:02", "13:44:02", compares: .orderedSame)
    try assertLeftToRight("13:44:02", "13:43:02", compares: .orderedDescending)
    
    try assertLeftToRight("13:44:02", "14:44:02", compares: .orderedAscending)
    try assertLeftToRight("13:44:02", "13:44:02", compares: .orderedSame)
    try assertLeftToRight("13:44:02", "12:44:02", compares: .orderedDescending)
  }
  
  // MARK: - Utils
  private func assertLeftToRight(_ left: String, _ right: String, compares: ComparisonResult, file: StaticString = #file, line: UInt = #line) throws {
    let leftTime = try FHIRKitTime(left)
    let rightTime = try FHIRKitTime(right)
    
    if compares == .orderedDescending {
      XCTAssertTrue(leftTime > rightTime, file: file, line: line)
    } else if compares == .orderedSame {
      XCTAssertEqual(leftTime, rightTime)
    } else {
      XCTAssertTrue(leftTime < rightTime, file: file, line: line)
    }
  }
}
