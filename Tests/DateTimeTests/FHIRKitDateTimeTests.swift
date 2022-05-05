//
//  FHIRKitDateTimeTests.swift
//  FHIRKit
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

import FHIRKitCore
@testable import FHIRKitCore
import R4
@testable import R4
import XCTest

class FHIRKitDateTimeTests: XCTestCase {
  func testDateTimeEquality() {
    let dateTime1: FHIRKitDateTime = "2022-04-20T12:34:45.67-05:00"
    let dateTime2: FHIRKitDateTime = "2022-04-20T12:34:45.67-05:00"
    let dateTime3: FHIRKitDateTime = "2022-04-20T10:34:45.67-07:00"
    let dateTime4: FHIRKitDateTime = "2022-04-20T12:34:45-05:00"
    let dateTime5: FHIRKitDateTime = "2022-04-20T12:34:45-07:00"
    let dateTime6: FHIRKitDateTime = "2022-04-20"
    let dateTime7: FHIRKitDateTime = "2022-04-21"
    let dateTime8: FHIRKitDateTime = "2022-04"
    
    XCTAssertEqual(dateTime1, dateTime1)
    XCTAssertEqual(dateTime1, dateTime2)
    XCTAssertNotEqual(dateTime1, dateTime3)
    XCTAssertNotEqual(dateTime1, dateTime4)
    XCTAssertNotEqual(dateTime1, dateTime5)
    XCTAssertNotEqual(dateTime1, dateTime6)
    XCTAssertNotEqual(dateTime1, dateTime7)
    XCTAssertNotEqual(dateTime1, dateTime8)
    XCTAssertNotEqual(dateTime4, dateTime5)
    XCTAssertNotEqual(dateTime6, dateTime7)
    XCTAssertNotEqual(dateTime6, dateTime8)
  }
  
  func testParsing() {
    let datePairs: [String: FHIRKitDateTime] = [
      "2022": FHIRKitDateTime(date: FHIRKitDate(year: 2022)),
      "2022-04": FHIRKitDateTime(date: FHIRKitDate(year: 2022, month: 4)),
      "2022-04-20": FHIRKitDateTime(date: FHIRKitDate(year: 2022, month: 4, day: 20)),
      "2022-04-20T06:09:42Z": FHIRKitDateTime(date: FHIRKitDate(year: 2022, month: 4, day: 20), time: FHIRKitTime(hour: 6, minute: 9, second: 42.0), timezone: TimeZone(secondsFromGMT: 0)),
      "2022-04-21T12:34:56+04:00": FHIRKitDateTime(date: FHIRKitDate(year: 2022, month: 4, day: 21), time: FHIRKitTime(hour: 12, minute: 34, second: 56.0), timezone: TimeZone(secondsFromGMT: +4 * 3600)),
      "2022-12-31T23:59:59-12:00": FHIRKitDateTime(date: FHIRKitDate(year: 2022, month: 12, day: 31), time: FHIRKitTime(hour: 23, minute: 59, second: 59.0), timezone: TimeZone(secondsFromGMT: -12 * 3600))
    ]
    
    for (datetimeString, expected) in datePairs {
      let datetime = try? FHIRKitDateTime(datetimeString)
      XCTAssertNotNil(datetime)
      XCTAssertEqual(datetime, expected)
      XCTAssertEqual(datetime?.description, datetimeString)
    }
  }
  
  // extra character parsing
  func testExtraChars() {
    let extraCharSet = [
      ("2022 ", 4),
      ("2022/04", 4),
      ("2022 04", 4),
      ("2022-04 20", 7),
      ("2022-04-20 ", 10)
    ]
    
    for (dateString, location) in extraCharSet {
      do {
        let datetime = try FHIRKitDateTime(dateString)
        XCTFail("Should fail to parse date string \"\(dateString)\" but succeeded anyway. Parsed: \(datetime)")
      } catch FHIRKitDateParserError.additionalCharacters(let position) {
        let expectedPosition = FHIRKitDateParserErrorPosition(string: dateString, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw FHIRKitDateParserError.additionalCharacters but threw \(error) instead")
      }
    }
  }
  
  func testDateTimeRendering() {
    let dateString = "2022-04-20T04:20:00Z"
    var parsedDate = try! FHIRKitDateTime(dateString)
    
    XCTAssertNotNil(parsedDate.originalTimeZoneString)
    let expectedDate = FHIRKitDateTime(date: FHIRKitDate(year: 2022, month: 4, day: 20),
                                       time: FHIRKitTime(hour: 4, minute: 20, second: 0),
                                       timezone: TimeZone(secondsFromGMT: 0))
    
    XCTAssertEqual(parsedDate, expectedDate)
    XCTAssertEqual(parsedDate.description, dateString)
    
    parsedDate.timeZone = TimeZone(secondsFromGMT: -5 * 3600)
    XCTAssertNotNil(parsedDate.originalTimeZoneString)
    XCTAssertNotEqual(parsedDate, expectedDate)
    XCTAssertEqual(parsedDate.description, "2022-04-20T04:20:00-05:00")
    XCTAssertEqual(parsedDate.timeZone, TimeZone(secondsFromGMT: -5 * 3600))
    
    FHIRKitTime.secondsFormatter.locale = Locale(identifier: "en_CA")
    parsedDate.time?.second = 6.9
    XCTAssertEqual(parsedDate.description, "2022-04-20T04:20:06.9-05:00")
  }
  
  // comparison tests
  
  /// helper function
  func assertLeftToRight(_ left: String, _ right: String, compares: ComparisonResult, file: StaticString = #file, line: UInt = #line) throws {
    let leftDate = try FHIRKitDateTime(left)
    let rightDate = try FHIRKitDateTime(right)
    XCTAssertEqual(try leftDate.compare(rightDate), compares, file: file, line: line)
  }
  
  func testComparison() throws {
    try assertLeftToRight("2022-04-20T22:33:44Z", "2022-04-20T22:33:45Z", compares: .orderedAscending)
    try assertLeftToRight("2022-04-20T22:33:44Z", "2022-04-20T21:33:44-02:00", compares: .orderedAscending)
    try assertLeftToRight("2022-04-20T22:33:44Z", "2022-04-20T23:33:45+01:00", compares: .orderedAscending)
    
    try assertLeftToRight("2022-04-20T22:33:44Z", "2022-04-20T22:33:44Z", compares: .orderedSame)
    try assertLeftToRight("2022-04-20T22:33:44Z", "2022-04-20T20:33:44-02:00", compares: .orderedSame)
    try assertLeftToRight("2022-04-20T22:33:44Z", "2022-04-20T23:33:44+01:00", compares: .orderedSame)
    
    try assertLeftToRight("2022-04-20T22:33:44Z", "2022-04-20T22:33:43Z", compares: .orderedDescending)
    try assertLeftToRight("2022-04-20T22:33:44Z", "2022-04-20T23:33:44+02:00", compares: .orderedDescending)
    try assertLeftToRight("2022-04-20T22:33:44Z", "2022-04-20T19:33:43-03:00", compares: .orderedDescending)
    
    try assertLeftToRight("2022-04-20", "2022-04-21", compares: .orderedAscending)
    try assertLeftToRight("2022-04-20", "2022-04-20", compares: .orderedSame)
    try assertLeftToRight("2022-04-20", "2022-04-19", compares: .orderedDescending)
    
    try assertLeftToRight("2022-04-20", "2022-05-20", compares: .orderedAscending)
    try assertLeftToRight("2022-04-20", "2022-04-20", compares: .orderedSame)
    try assertLeftToRight("2022-04-20", "2022-03-20", compares: .orderedDescending)
    
    try assertLeftToRight("2022-04-20", "2023-04-20", compares: .orderedAscending)
    try assertLeftToRight("2022-04-20", "2022-04-20", compares: .orderedSame)
    try assertLeftToRight("2022-04-20", "2021-04-20", compares: .orderedDescending)
  }
}
