//
//  AlexandriaHRMInstantTests.swift
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

class AlexandriaHRMInstantTests: XCTestCase {
  func testInstantDateParsing() {
    let datePairs: [String: AlexandriaHRMInstant] = [
      "2022-04-20T04:20:00Z": AlexandriaHRMInstant(date: AlexandriaHRMInstantDate(year: 2022, month: 4, day: 20), time: AlexandriaHRMTime(hour: 4, minute: 20, second: 0.0), timezone: TimeZone(secondsFromGMT: 0)!),
      "2022-04-20T04:20:00-00:00": AlexandriaHRMInstant(date: AlexandriaHRMInstantDate(year: 2022, month: 4, day: 20), time: AlexandriaHRMTime(hour: 4, minute: 20, second: 0.0), timezone: TimeZone(secondsFromGMT: 0)!),
      "2022-04-20T04:20:06.9-05:00": AlexandriaHRMInstant(date: AlexandriaHRMInstantDate(year: 2022, month: 4, day: 20), time: AlexandriaHRMTime(hour: 4, minute: 20, second: 6.9), timezone: TimeZone(secondsFromGMT: -5 * 3600)!),
      "2022-04-20T16:20:06.9+12:00": AlexandriaHRMInstant(date: AlexandriaHRMInstantDate(year: 2022, month: 4, day: 20), time: AlexandriaHRMTime(hour: 16, minute: 20, second: 6.9), timezone: TimeZone(secondsFromGMT: +12 * 3600)!)
    ]
    
    for (instantDateString, expected) in datePairs {
      let instantDate = try? AlexandriaHRMInstant(instantDateString)
      XCTAssertNotNil(instantDate)
      XCTAssertEqual(instantDate, expected)
      XCTAssertEqual(instantDate?.description, instantDateString)
    }
  }
  
  func testInstantDateErrorHandling() {
    let badInstantDateStringSet: [String: Int] = [
      "2022": 0,
      "2022-04": 5,
      "2022-04-20": 10,
      "2022-04-20T": 11,
      "2022-04-20T04": 13,
      "2022-04-20T04:20": 16,
      "2022-04-20T04:20:00": 19,
      "2022T04:20:00Z": 0,
      "2022-04T04:20:00Z": 5
    ]
    
    for (dateString, errorLocation) in badInstantDateStringSet {
      do {
        let instantDate = try AlexandriaHRMInstant(dateString)
        XCTFail("Should fail to parse InstantDateString: \"\(dateString)\" but succeeded anyway. Parsed: \(instantDate)")
      } catch {
        guard let parserError = error as? AlexandriaHRMDateParserError else {
          XCTFail("Should have thrown AlexandriaHRMDateParserError but threw \(error) instead")
          continue
        }
        
        XCTAssertEqual(parserError.errorPosition.location, errorLocation)
      }
    }
  }
  
  func testInstantDateRendering() {
    let instantDateString = "2022-04-20T04:20:00Z"
    var parsedInstantDateString = try! AlexandriaHRMInstant(instantDateString)
    let expectedInstantDateString = AlexandriaHRMInstant(date: AlexandriaHRMInstantDate(year: 2022, month: 4, day: 20), time: AlexandriaHRMTime(hour: 4, minute: 20, second: 0.0), timezone: TimeZone(secondsFromGMT: 0)!)
    XCTAssertEqual(parsedInstantDateString, expectedInstantDateString)
    XCTAssertEqual(parsedInstantDateString.description, instantDateString)
    
    
    parsedInstantDateString.timeZone = TimeZone(secondsFromGMT: -5 * 3600)!
    XCTAssertNotEqual(parsedInstantDateString, expectedInstantDateString)
    XCTAssertEqual(parsedInstantDateString.description, "2022-04-20T04:20:00-05:00")
  }
  
  func testEquality() {
    let dateString1 = "2022-04-20T04:20:00Z"
    let dateString2 = "2022-04-20T04:20:06.009Z"
    let dateString3 = "2022-04-20T02:20:00-02:00"
    let instant1 = try! AlexandriaHRMInstant(dateString1)
    let instant2 = try! AlexandriaHRMInstant(dateString2)
    let instant3 = try! AlexandriaHRMInstant(dateString3)
    let dateTime1 = try! AlexandriaHRMDateTime(dateString1)
    let dateTime2 = try! AlexandriaHRMDateTime(dateString2)
    let dateTime3 = try! AlexandriaHRMDateTime(dateString3)
    
    XCTAssertTrue(instant1 == instant1)
    XCTAssertNotEqual(instant1, instant2)
    XCTAssertNotEqual(instant1, instant3)
    
    XCTAssertTrue(instant1 == dateTime1)
    XCTAssertTrue(instant2 == dateTime2)
    XCTAssertTrue(instant3 == dateTime3)
    
    XCTAssertEqual(try instant1.asNSDate(), try instant3.asNSDate())
  }
  
  // comparison test helper function
  private func assertLeftToRight(_ left: String, _ right: String, compares: ComparisonResult, file: StaticString = #file, line: UInt = #line) throws {
    let leftInstant = try AlexandriaHRMInstant(left)
    let rightInstant = try AlexandriaHRMInstant(right)
    
    XCTAssertEqual(try leftInstant.compare(rightInstant), compares, file: file, line: line)
  }
  
  func testComparison() throws {
    try assertLeftToRight("2022-04-20T16:20:00Z", "2022-04-20T16:20:01Z", compares: .orderedAscending)
    try assertLeftToRight("2022-04-20T16:20:00Z", "2022-04-20T14:20:01-02:00", compares: .orderedAscending)
    try assertLeftToRight("2022-04-20T16:20:00Z", "2022-04-20T17:20:01+01:00", compares: .orderedAscending)
    
    try assertLeftToRight("2022-04-20T16:20:00Z", "2022-04-20T16:20:00Z", compares: .orderedSame)
    try assertLeftToRight("2022-04-20T16:20:00Z", "2022-04-20T14:20:00-02:00", compares: .orderedSame)
    try assertLeftToRight("2022-04-20T16:20:00Z", "2022-04-20T17:20:00+01:00", compares: .orderedSame)

    try assertLeftToRight("2022-04-20T16:20:00Z", "2022-04-20T04:20:00Z", compares: .orderedDescending)
    try assertLeftToRight("2022-04-20T16:20:00Z", "2022-04-20T06:20:00+02:00", compares: .orderedDescending)
    try assertLeftToRight("2022-04-20T16:20:00Z", "2022-04-20T07:20:00-03:00", compares: .orderedDescending)
  }
}
