//
//  AlexandriaHRMDateTime.swift
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

import Foundation
import AlexandriaHRMCore

/**
 A date, date-time, or partial date (e.g, just year or year + month) as used in human communication. The format is
 `YYYY`, `YYYY-MM`, `YYYY-MM-DD` or `YYYY-MM-DDThh:mm:ss+zz:zz`, (e.g. `2018`, `1973-06`,
 `1905-08-23`, `2015-02-07T13:28:17-05:00`, or `2017-01-01T00:00:00.000Z.`) If hours and
 minutes are specified, a time zone shall be populated. Seconds must be provided due to schema type constraints
 but may be zero-filled and ignored at receiver discretion. Dates SHALL be valid dates. **The time "24:00" is
 not allowed**. Leap Seconds are allowed
 
 */
public struct AlexandriaHRMDateTime: AlexandriaHRMPrimitiveType {
  private var timeZoneIsUnaltered = true
  public var date: AlexandriaHRMDate
  public var time: AlexandriaHRMTime?
  
  public var timeZone: TimeZone? {
    didSet {
      timeZoneIsUnaltered = false
    }
  }
  
  public let originalTimeZoneString: String?
  
  public init(date: AlexandriaHRMDate, time: AlexandriaHRMTime? = nil, timezone: TimeZone? = nil) {
    self.init(date: date, time: time, timezone: timezone, originalTimeZoneString: nil)
  }
  
  public init(_ originalString: String) throws {
    let scanner = Scanner(string: originalString)
    let (date, time, timezone, timeZoneString) = try AlexandriaHRMDateTime.parse(from: scanner)
    self.init(date: date, time: time, timezone: timezone, originalTimeZoneString: timeZoneString)
  }
  
  private init(date: AlexandriaHRMDate, time: AlexandriaHRMTime? = nil, timezone: TimeZone? = nil, originalTimeZoneString: String? = nil) {
    self.date = date
    self.time = time
    self.timeZone = timezone
    self.originalTimeZoneString = originalTimeZoneString
  }
  
  /// Date parsing
  public static func parse(from scanner: Scanner, expectAtEnd: Bool = true) throws -> (date: AlexandriaHRMDate, time: AlexandriaHRMTime?, timezone: TimeZone?, timeZoneString: String?) {
    let originalCharactersToBeSkipped = scanner.charactersToBeSkipped
    defer { scanner.charactersToBeSkipped = originalCharactersToBeSkipped }
    scanner.charactersToBeSkipped = nil
    
    // date
    let date = try AlexandriaHRMDate.parse(from: scanner, expectAtEnd: false)
    var time: AlexandriaHRMTime?
    var timeZone: TimeZone?
    var timeZoneString: String?
    
    // time
    if scanner.scanString("T", into: nil) {
      time = try AlexandriaHRMTime.parse(from: scanner, expectAtEnd: false)
      
      // timezone
      let (secondsFromGMT, tzString) = try TimeZone.hs_parseComponents(from: scanner, expectAtEnd: true)
      timeZone = TimeZone(secondsFromGMT: secondsFromGMT)
      timeZoneString = tzString
    }
    
    let scanLocation = scanner.scanLocation
    if expectAtEnd && !scanner.isAtEnd {
      throw AlexandriaHRMDateParserError.additionalCharacters(AlexandriaHRMDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    return (date, time, timeZone, timeZoneString)
  }
}

extension AlexandriaHRMDateTime: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    try! self.init(value) // swiftlint:disable:this force_try
  }
}

// MARK: - Codable
extension AlexandriaHRMDateTime: Codable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let string = try container.decode(String.self)
    try self.init(string)
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(description)
  }
}

// MARK: - CustomStringConvertible
extension AlexandriaHRMDateTime: CustomStringConvertible {
  public var description: String {
    if let time = time, let timeZone = timeZone {
      if timeZoneIsUnaltered, let originalTimeZoneString = originalTimeZoneString {
        return "\(date.description)T\(time.description)\(originalTimeZoneString)"
      }
      return "\(date.description)T\(time.description)\(timeZone.fhirDescription)"
    }
    return date.description
  }
}

// MARK: - Equatable
extension AlexandriaHRMDateTime: Equatable {
  public static func == (leftSide: AlexandriaHRMDateTime, rightSide: AlexandriaHRMDateTime) -> Bool {
    if leftSide.date != rightSide.date {
      return false
    }
    if leftSide.time != rightSide.time {
      return false
    }
    if leftSide.timeZone != rightSide.timeZone {
      return false
    }
    return true
  }
}

// MARK: - Comparable
extension AlexandriaHRMDateTime: Comparable {
    /// This comparison will be done by taking time zones into account.
  public static func < (leftSide: AlexandriaHRMDateTime, rightSide: AlexandriaHRMDateTime) -> Bool {
    do {
      return try leftSide.compare(rightSide) == .orderedAscending
    } catch {
      print("DateTime comparison \(String(describing: leftSide)) < \(String(describing: rightSide)) raised \(String(describing: error))")
      return false
    }
  }
}

// MARK: - Extends NSDate
extension AlexandriaHRMDateTime: ExpressibleAsNSDate, ConstructibleFromNSDate {
  public func asNSDate() throws -> Date {
    let dateComponents = AlexandriaHRMDateComponents(
      year: date.year,
      month: date.month,
      day: date.day,
      hour: time?.hour,
      minute: time?.minute,
      second: time?.second,
      timeZone: timeZone)
    
    return try dateComponents.asNSDate()
  }
  
  public init(date: Date, timeZone: TimeZone = TimeZone.current) throws {
    self.timeZone = timeZone
    self.date = try AlexandriaHRMDate(date: date, timeZone: timeZone)
    self.time = try AlexandriaHRMTime(date: date, timeZone: timeZone)
    
    self.originalTimeZoneString = nil
  }
}
