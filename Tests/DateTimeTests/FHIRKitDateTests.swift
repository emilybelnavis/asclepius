//
//  FHIRKitDateTests.swift
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
import R4
import XCTest

class FHIRKitDateTests: XCTestCase {
  
  func testRendering() {
    let string = "2019-10-08"
    var fhirdate = try! FHIRKitDate(string)
    let expected = FHIRKitDate(year: 2019, month: 10, day: 08)
    XCTAssertEqual(fhirdate, expected)
    XCTAssertEqual(fhirdate.description, string)
    
    fhirdate.year = 181
    XCTAssertEqual(fhirdate.description, "0181-10-08")
  }
  
  func testParsing() {
    let successes = [
      ("2019", FHIRKitDate(year: 2019)),
      ("3019-12", FHIRKitDate(year: 3019, month: 12)),
      ("0019-12-29", FHIRKitDate(year: 19, month: 12, day: 29))
    ]
    
    for (string, expectedDate) in successes {
      do {
        let fhirdate = try FHIRKitDate(string)
        XCTAssertEqual(fhirdate, expectedDate)
        XCTAssertEqual(string, fhirdate.description)
      } catch {
        XCTFail("Should succeed parsing \"\(string)\" but threw: \(error)")
      }
    }
    
      // Year
    let yearThrowers = [
      ("19", 0),
      (" 2019", 0),
      ("-2019-05-22", 0),
      ("Y2019", 0),
      ("0000-10-05", 0),
      ("12019-10-05", 0)
    ]
    for (string, location) in yearThrowers {
      do {
        let fhirdate = try FHIRKitDate(string)
        XCTFail("Should fail to parse \"\(string)\" but succeeded, parsed \(fhirdate)")
      } catch FHIRKitDateParserError.invalidYear(let position) {
        let expectedPosition = FHIRKitDateParserErrorPosition(string: string, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw FHIRKitDateParserError.invalidYear but threw \(error)")
      }
    }
    
      // Month
    let monthThrowers = [
      ("2019-", 5),
      ("2019-00", 5),
      ("2019-19", 5),
      ("2019--12", 5),
      ("2019-00", 5)
    ]
    for (string, location) in monthThrowers {
      do {
        let fhirdate = try FHIRKitDate(string)
        XCTFail("Should fail to parse \"\(string)\" but succeeded, parsed \(fhirdate)")
      } catch FHIRKitDateParserError.invalidMonth(let position) {
        let expectedPosition = FHIRKitDateParserErrorPosition(string: string, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw FHIRKitDateParserError.invalidMonth but threw \(error)")
      }
    }
    
      // Day
    let dayThrowers = [
      ("2019-11-", 8),
      ("2019-11-2", 8),
      ("2019-11-00", 8),
      ("2019-11-34", 8)
    ]
    for (string, location) in dayThrowers {
      do {
        let fhirdate = try FHIRKitDate(string)
        XCTFail("Should fail to parse \"\(string)\" but succeeded, parsed \(fhirdate)")
      } catch FHIRKitDateParserError.invalidDay(let position) {
        let expectedPosition = FHIRKitDateParserErrorPosition(string: string, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw FHIRKitDateParserError.invalidDay but threw \(error)")
      }
    }
    
      // Extra characters
    let extraThrowers = [
      ("2019 ", 4),
      ("2019T", 4),
      ("2019/12", 4),
      ("2019 19", 4),
      ("2019-11 23", 7),
      ("2019-11-23T", 10),
      ("2019-11-23 ", 10),
      ("2019-11-23T14:22:30Z", 10)
    ]
    for (string, location) in extraThrowers {
      do {
        let fhirdate = try FHIRKitDate(string)
        XCTFail("Should fail to parse \"\(string)\" but succeeded, parsed \(fhirdate)")
      } catch FHIRKitDateParserError.additionalCharacters(let position) {
        let expectedPosition = FHIRKitDateParserErrorPosition(string: string, location: location)
        XCTAssertEqual(position, expectedPosition)
      } catch {
        XCTFail("Should throw FHIRKitDateParserError.additionalCharacters but threw \(error)")
      }
    }
  }
  
  func testComparison() throws {
    try assertLeftToRight("2021-01-07", "2021-01-08", compares: .orderedAscending)
    try assertLeftToRight("2021-01-07", "2021-01-07", compares: .orderedSame)
    try assertLeftToRight("2021-01-07", "2021-01-06", compares: .orderedDescending)
    
    try assertLeftToRight("2021-02", "2021-03", compares: .orderedAscending)
    try assertLeftToRight("2021-02", "2021-02", compares: .orderedSame)
    try assertLeftToRight("2021-02", "2021-01", compares: .orderedDescending)
    
    try assertLeftToRight("2021", "2022", compares: .orderedAscending)
    try assertLeftToRight("2021", "2021", compares: .orderedSame)
    try assertLeftToRight("2021", "2020", compares: .orderedDescending)
    
    try assertLeftToRight("2021-01-07", "2021-01", compares: .orderedDescending)
    try assertLeftToRight("2021-01-07", "2021", compares: .orderedDescending)
    try assertLeftToRight("2021-01", "2021-01-06", compares: .orderedAscending)
    try assertLeftToRight("2021", "2021-01-06", compares: .orderedAscending)
    try assertLeftToRight("2020-12-31", "2021-01-01", compares: .orderedAscending)
  }
  
    // MARK: - Tools
  
  private func assertLeftToRight(_ left: String, _ right: String, compares: ComparisonResult, file: StaticString = #file, line: UInt = #line) throws {
    let leftDate = try FHIRKitDate(left)
    let rightDate = try FHIRKitDate(right)
    if compares == .orderedDescending {
      XCTAssertTrue(leftDate > rightDate, file: file, line: line)
    } else if compares == .orderedSame {
      XCTAssertEqual(leftDate, rightDate, file: file, line: line)
    } else {
      XCTAssertTrue(leftDate < rightDate, file: file, line: line)
    }
  }
}
