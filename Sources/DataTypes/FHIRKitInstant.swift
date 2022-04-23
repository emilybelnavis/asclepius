//
//  FHIRKitInstant.swift
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

import Foundation

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
public struct FHIRKitInstant: FHIRKitPrimitiveType {
  private var _timezoneIsUnaltered = true
  public var date: FHIRKitInstantDate
  public var time: FHIRKitTime
  
  public var timeZone: TimeZone {
    didSet {
      _timezoneIsUnaltered = false
    }
  }
  
  public let originalTimeZoneString: String?
  
  public init(date: FHIRKitInstantDate, time: FHIRKitTime, timezone: TimeZone) {
    self.init(date: date, time: time, timezone: timezone, originalTimeZoneString: nil)
  }
  
  public init(_ originalString: String) throws {
    let scanner = Scanner(string: originalString)
    let (date, time, timezone, timeZoneString) = try FHIRKitInstant.parse(from: scanner)
    self.init(date: date, time: time, timezone: timezone, originalTimeZoneString: timeZoneString)
  }
  
  private init(date: FHIRKitInstantDate, time: FHIRKitTime, timezone: TimeZone, originalTimeZoneString: String? = nil) {
    self.date = date
    self.time = time
    self.timeZone = timezone
    self.originalTimeZoneString = originalTimeZoneString
  }
  
  public static func parse(from scanner: Scanner, expectAtEnd: Bool = true) throws -> (date: FHIRKitInstantDate, time: FHIRKitTime, timezone: TimeZone, timeZoneString: String) {
    let originalCharacterstoBeSkipped = scanner.charactersToBeSkipped
    defer { scanner.charactersToBeSkipped = originalCharacterstoBeSkipped }
    scanner.charactersToBeSkipped = nil
    
    let date = try FHIRKitInstantDate.parse(from: scanner, expectAtEnd: false)
    guard scanner.scanString("T", into: nil) else {
      throw FHIRKitDateParserError.invalidSeparator(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanner.scanLocation))
    }
    
    let scanLocation = scanner.scanLocation
    let time = try FHIRKitTime.parse(from: scanner, expectAtEnd: false)
    let (secondsFromGMT, timeZoneString) = try TimeZone.hs_parseComponents(from: scanner, expectAtEnd: true)
    guard let timeZone = TimeZone(secondsFromGMT: secondsFromGMT) else {
      throw FHIRKitDateParserError.invalidTimeZoneHour(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    if expectAtEnd && !scanner.isAtEnd {
      throw FHIRKitDateParserError.additionalCharacters(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanner.scanLocation))
    }
    
    return (date, time, timeZone, timeZoneString)
  }
}

extension FHIRKitInstant: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    try! self.init(value) // swiftlint:disable:this force_try
  }
}

extension FHIRKitInstant: Codable {
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

extension FHIRKitInstant: CustomStringConvertible {
  public var description: String {
    if _timezoneIsUnaltered, let originalTimeZoneString = originalTimeZoneString {
      return "\(date.description)T\(time.description)\(originalTimeZoneString)"
    }
    return "\(date.description)T\(time.description)\(timeZone.fhirDescription)"
  }
}

extension FHIRKitInstant: Equatable {
  
  public static func == (leftSide: FHIRKitInstant, rightSide: FHIRKitInstant) -> Bool {
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
  
  public static func == (leftSide: FHIRKitInstant, rightSide: FHIRKitDateTime) -> Bool {
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
  
  public static func == (leftSide: FHIRKitDateTime, rightSide: FHIRKitInstant) -> Bool {
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

extension FHIRKitInstant: Comparable {
  
  public static func < (leftSide: FHIRKitInstant, rightSide: FHIRKitInstant) -> Bool {
    do {
      return try leftSide.compare(rightSide) == .orderedAscending
    } catch {
      print("Instant comparison \(String(describing: leftSide)) < \(String(describing: rightSide)) raised \(String(describing: error))")
      return false
    }
  }
  
  public static func < (leftSide: FHIRKitInstant, rightSide: FHIRKitDateTime) -> Bool {
    do {
      return try leftSide.compare(rightSide) == .orderedAscending
    } catch {
      print("Instant comparison \(String(describing: leftSide)) < \(String(describing: rightSide)) raised \(String(describing: error))")
      return false
    }
  }
  
  public static func < (leftSide: FHIRKitDateTime, rightSide: FHIRKitInstant) -> Bool {
    do {
      return try leftSide.compare(rightSide) == .orderedAscending
    } catch {
      print("Instant comparison \(String(describing: leftSide)) < \(String(describing: rightSide)) raised \(String(describing: error))")
      return false
    }
  }
}
