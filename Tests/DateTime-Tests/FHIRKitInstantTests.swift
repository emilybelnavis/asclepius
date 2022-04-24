//
//  FHIRKitInstantTests.swift
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

class FHIRKitInstantTests: XCTestCase {
  func testInstantDateParsing() {
    let datePairs: [String: FHIRKitInstant] = [
      "2022-04-20T04:20:00Z": FHIRKitInstant(date: FHIRKitInstantDate(year: 2022, month: 4, day: 20), time: FHIRKitTime(hour: 4, minute: 20, second: 0.0), timezone: TimeZone(secondsFromGMT: 0)!),
      "2022-04-20T04:20:00-00:00": FHIRKitInstant(date: FHIRKitInstantDate(year: 2022, month: 4, day: 20), time: FHIRKitTime(hour: 4, minute: 20, second: 0.0), timezone: TimeZone(secondsFromGMT: 0)!),
      "2022-04-20T04:20:06.9-05:00": FHIRKitInstant(date: FHIRKitInstantDate(year: 2022, month: 4, day: 20), time: FHIRKitTime(hour: 4, minute: 20, second: 6.9), timezone: TimeZone(secondsFromGMT: -5 * 3600)!),
      "2022-04-20T16:20:06.9+12:00": FHIRKitInstant(date: FHIRKitInstantDate(year: 2022, month: 4, day: 20), time: FHIRKitTime(hour: 16, minute: 20, second: 6.9), timezone: TimeZone(secondsFromGMT: +12 * 3600)!)
    ]
    
    for (instantDateString, expected) in datePairs {
      let instantDate = try? FHIRKitInstant(instantDateString)
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
        let instantDate = try FHIRKitInstant(dateString)
        XCTFail("Should fail to parse InstantDateString: \"\(dateString)\" but succeeded anyway. Parsed: \(instantDate)")
      } catch {
        guard let parserError = error as? FHIRKitDateParserError else {
          XCTFail("Should have thrown FHIRKitDateParserError but threw \(error) instead")
          continue
        }
        
        XCTAssertEqual(parserError.errorPosition.location, errorLocation)
      }
    }
  }
  
  func testInstantDateRendering() {
    let instantDateString = "2022-04-20T04:20:00Z"
    var parsedInstantDateString = try! FHIRKitInstant(instantDateString)
    let expectedInstantDateString = FHIRKitInstant(date: FHIRKitInstantDate(year: 2022, month: 4, day: 20), time: FHIRKitTime(hour: 4, minute: 20, second: 0.0), timezone: TimeZone(secondsFromGMT: 0)!)
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
    let instant1 = try! FHIRKitInstant(dateString1)
    let instant2 = try! FHIRKitInstant(dateString2)
    let instant3 = try! FHIRKitInstant(dateString3)
    let dateTime1 = try! FHIRKitDateTime(dateString1)
    let dateTime2 = try! FHIRKitDateTime(dateString2)
    let dateTime3 = try! FHIRKitDateTime(dateString3)
    
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
    let leftInstant = try FHIRKitInstant(left)
    let rightInstant = try FHIRKitInstant(right)
    
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
