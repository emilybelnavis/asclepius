//
//  AlexandriaHRMTimeTests.swift
//  AlexandriaHRM
//  Module: R4
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import AlexandriaHRMCore
import R4
import XCTest

class AlexandriaHRMTimeTests: XCTestCase {
  
  func timeRenderingTest() {
    let timeString = "16:20:00"
    var time = try! AlexandriaHRMTime(timeString)
    let expectedTime = AlexandriaHRMTime(hour: 16, minute: 20, second: 0.0)
    XCTAssertEqual(time, expectedTime)
    XCTAssertEqual(time.description, timeString)
    
    time.hour = 1
    XCTAssertEqual(time, AlexandriaHRMTime(hour: 1, minute: 20, second: 0.0))
    XCTAssertEqual(time.description, "01:20:00")
    
    time.minute = 23
    XCTAssertEqual(time, AlexandriaHRMTime(hour: 1, minute: 23, second: 0.0))
    XCTAssertEqual(time.description, "01:23:00")
    
    time.second = 45
    XCTAssertEqual(time, AlexandriaHRMTime(hour: 1, minute: 23, second: 45.0))
    XCTAssertEqual(time.description, "01:23:45")
    
    time.second = 45.67
    XCTAssertEqual(time, AlexandriaHRMTime(hour: 1, minute: 23, second: 45.67))
    XCTAssertEqual(time.description, "01:23:45.67")
  }
  
  func testWholeTimeParsing() {
    
    // whole time parsing
    let wholeTimeParseSet = [
      ("00:00:00", AlexandriaHRMTime(hour: 0, minute: 0, second: 0.0)),
      ("01:23:45", AlexandriaHRMTime(hour: 1, minute: 23, second: 45.0)),
      ("09:41:60.0", AlexandriaHRMTime(hour: 9, minute: 41, second: 60.0)),
      ("11:22:33.0", AlexandriaHRMTime(hour: 11, minute: 22, second: 33.0)),
      ("16:20:00.0", AlexandriaHRMTime(hour: 16, minute: 20, second: 0.0)),
      ("16:20:06.9", AlexandriaHRMTime(hour: 16, minute: 20, second: 6.9)),
      ("18:19:20.00000", AlexandriaHRMTime(hour: 18, minute: 19, second: 20.0)),
      ("23:59:59.99", AlexandriaHRMTime(hour: 23, minute: 59, second: 59.99)),
      ("23:59:60.0", AlexandriaHRMTime(hour: 23, minute: 59, second: 60.0))
    ]
    
    for (timeString, expectedTime) in wholeTimeParseSet {
      do {
        let time = try AlexandriaHRMTime(timeString)
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
        let time = try AlexandriaHRMTime(timeString)
        XCTFail("Should fail to parse time string: \"\(timeString)\" but succeeded anyway. Parsed: \(time)")
      } catch AlexandriaHRMDateParserError.invalidHour(let position) {
        let expectedPosition = AlexandriaHRMDateParserErrorPosition(string: timeString, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw AlexandriaHRMDateParserError.invalidHour but threw \(error) instead")
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
        let time = try AlexandriaHRMTime(timeString)
        XCTFail("Should fail to parse time string: \"\(timeString)\" but succeeded anyway. Parsed: \(time)")
      } catch AlexandriaHRMDateParserError.invalidMinute(let position) {
        let expectedPosition = AlexandriaHRMDateParserErrorPosition(string: timeString, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw AlexandriaHRMDateParserError.invalidMinute but threw \(error) instead")
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
        let time = try AlexandriaHRMTime(timeString)
        XCTFail("Should fail to parse time string: \"\(timeString)\" but succeeded anyway. Parsed: \(time)")
      } catch AlexandriaHRMDateParserError.invalidSecond(let position) {
        let expectedPosition = AlexandriaHRMDateParserErrorPosition(string: timeString, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw AlexandriaHRMDateParserError.invalidSecond but threw \(error) instead")
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
        let time = try AlexandriaHRMTime(timeString)
        XCTFail("Should fail to parse time string: \"\(timeString) but succeeded anyway. Parsed: \(time)")
      } catch AlexandriaHRMDateParserError.invalidSeparator(let position) {
        let expectedPosition = AlexandriaHRMDateParserErrorPosition(string: timeString, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw AlexandriaHRMDateParserError.invalidSeparator but threw \(error) instead")
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
        let time = try AlexandriaHRMTime(timeString)
        XCTFail("Should fail to parse time string: \"\(timeString)\" but succeeded anyway. Parsed: \(time)")
      } catch AlexandriaHRMDateParserError.additionalCharacters(let position) {
        let expectedPosition = AlexandriaHRMDateParserErrorPosition(string: timeString, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw AlexandriaHRMDateParserError.additionalCharacters but threw \(error) instead")
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
    let leftTime = try AlexandriaHRMTime(left)
    let rightTime = try AlexandriaHRMTime(right)
    
    if compares == .orderedDescending {
      XCTAssertTrue(leftTime > rightTime, file: file, line: line)
    } else if compares == .orderedSame {
      XCTAssertEqual(leftTime, rightTime)
    } else {
      XCTAssertTrue(leftTime < rightTime, file: file, line: line)
    }
  }
}
