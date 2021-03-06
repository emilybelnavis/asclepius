//
//  AsclepiusInstant.swift
//  Asclepius
//  Module: STU3
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
import AsclepiusCore

/**
 An instant in time in the format YYYY-MM-DDThh:mm:ss.sss+zz:zz (e.g. 2015-02-07T13:28:17.239+02:00 or
 2017-01-01T00:00:00Z). The time SHALL specified at least to the second and SHALL include a time zone.
 
 - Note: This is intended for when precisely observed times are required (typically system logs etc.), and not
 human-reported times - for those, use date or dateTime (which can be as precise as instant, but is not required to be).
 Instant is a more constrained dateTime.
 
 A caveat on `Comparable` and `Equatable`:
 
 - When using `Equatable`, the instances are compared directly, meaning all properties must be identical
 - Use `==` to compare whether two instances are identical
 - Use `a.compare(b) == .orderedSame` to compare whether two instances represent the exact same date & time
 - When using `Comparable`, the instances are converted to an absolute time respecting their timezone
 
 http://hl7.org/fhir/datatypes.html#instant
 */
public struct AsclepiusInstant: AsclepiusPrimitiveType {
  private var timeZoneIsUnaltered = true
  public var date: AsclepiusInstantDate
  public var time: AsclepiusTime
  
  public var timeZone: TimeZone {
    didSet {
      timeZoneIsUnaltered = false
    }
  }
  
  public let originalTimeZoneString: String?
  
  public init(date: AsclepiusInstantDate, time: AsclepiusTime, timezone: TimeZone) {
    self.init(date: date, time: time, timezone: timezone, originalTimeZoneString: nil)
  }
  
  public init(_ originalString: String) throws {
    let scanner = Scanner(string: originalString)
    let (date, time, timezone, timeZoneString) = try AsclepiusInstant.parse(from: scanner)
    self.init(date: date, time: time, timezone: timezone, originalTimeZoneString: timeZoneString)
  }
  
  private init(date: AsclepiusInstantDate, time: AsclepiusTime, timezone: TimeZone, originalTimeZoneString: String? = nil) {
    self.date = date
    self.time = time
    self.timeZone = timezone
    self.originalTimeZoneString = originalTimeZoneString
  }
  
  /// Date parsing
  public static func parse(from scanner: Scanner, expectAtEnd: Bool = true) throws -> (date: AsclepiusInstantDate, time: AsclepiusTime, timezone: TimeZone, timeZoneString: String) {
    let originalCharacterstoBeSkipped = scanner.charactersToBeSkipped
    defer { scanner.charactersToBeSkipped = originalCharacterstoBeSkipped }
    scanner.charactersToBeSkipped = nil
    
    let date = try AsclepiusInstantDate.parse(from: scanner, expectAtEnd: false)
    guard scanner.scanString("T", into: nil) else {
      throw AsclepiusDateParserError.invalidSeparator(AsclepiusDateParserErrorPosition(string: scanner.string, location: scanner.scanLocation))
    }
    
    let scanLocation = scanner.scanLocation
    let time = try AsclepiusTime.parse(from: scanner, expectAtEnd: false)
    let (secondsFromGMT, timeZoneString) = try TimeZone.hs_parseComponents(from: scanner, expectAtEnd: true)
    guard let timeZone = TimeZone(secondsFromGMT: secondsFromGMT) else {
      throw AsclepiusDateParserError.invalidTimeZoneHour(AsclepiusDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    if expectAtEnd && !scanner.isAtEnd {
      throw AsclepiusDateParserError.additionalCharacters(AsclepiusDateParserErrorPosition(string: scanner.string, location: scanner.scanLocation))
    }
    
    return (date, time, timeZone, timeZoneString)
  }
}

// MARK: - ExpressibleByStringLiteral
extension AsclepiusInstant: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    try! self.init(value) // swiftlint:disable:this force_try
  }
}

// MARK: - Codable
extension AsclepiusInstant: Codable {
  public init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.singleValueContainer()
    let string = try codingKeyContainer.decode(String.self)
    
    try self.init(string)
  }
  
  public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.singleValueContainer()
    try codingKeyContainer.encode(description)
  }
}

// MARK: - CustomStringConvertible
extension AsclepiusInstant: CustomStringConvertible {
  public var description: String {
    if timeZoneIsUnaltered, let originalTimeZoneString = originalTimeZoneString {
      return "\(date.description)T\(time.description)\(originalTimeZoneString)"
    }
    return "\(date.description)T\(time.description)\(timeZone.fhirDescription)"
  }
}

// MARK: - Equatable
extension AsclepiusInstant: Equatable {
  public static func == (leftSide: AsclepiusInstant, rightSide: AsclepiusInstant) -> Bool {
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
  
  public static func == (leftSide: AsclepiusInstant, rightSide: AsclepiusDateTime) -> Bool {
    if !(leftSide.date == rightSide.date) {
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
  
  public static func == (leftSide: AsclepiusDateTime, rightSide: AsclepiusInstant) -> Bool {
    if !(leftSide.date == rightSide.date) {
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
extension AsclepiusInstant: Comparable {
  
  public static func < (leftSide: AsclepiusInstant, rightSide: AsclepiusInstant) -> Bool {
    do {
      return try leftSide.compare(rightSide) == .orderedAscending
    } catch {
      print("Instant comparison \(String(describing: leftSide)) < \(String(describing: rightSide)) raised \(String(describing: error))")
      return false
    }
  }
  
  public static func < (leftSide: AsclepiusInstant, rightSide: AsclepiusDateTime) -> Bool {
    do {
      return try leftSide.compare(rightSide) == .orderedAscending
    } catch {
      print("Instant comparison \(String(describing: leftSide)) < \(String(describing: rightSide)) raised \(String(describing: error))")
      return false
    }
  }
  
  public static func < (leftSide: AsclepiusDateTime, rightSide: AsclepiusInstant) -> Bool {
    do {
      return try leftSide.compare(rightSide) == .orderedAscending
    } catch {
      print("Instant comparison \(String(describing: leftSide)) < \(String(describing: rightSide)) raised \(String(describing: error))")
      return false
    }
  }
}

// MARK: - Extends NSDate
extension AsclepiusInstant: ExpressibleAsNSDate, ConstructibleFromNSDate {
  
  public func asNSDate() throws -> Date {
    let dateComponents = AsclepiusDateComponents(
      year: date.year,
      month: date.month,
      day: date.day,
      hour: time.hour,
      minute: time.minute,
      second: time.second,
      timeZone: timeZone)
    
    return try dateComponents.asNSDate()
  }
  
  public init(date: Date, timeZone: TimeZone = TimeZone.current) throws {
    let (year, month, day, hour, minute, second) = try AsclepiusDateComponents.components(from: date, with: timeZone)
    self.date = AsclepiusInstantDate(year: year, month: month, day: day)
    self.time = AsclepiusTime(hour: hour, minute: minute, second: second)
    self.timeZone = timeZone
    self.originalTimeZoneString = nil
  }
}
