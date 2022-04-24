//
//  FHIRKitDateTime.swift
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

public struct FHIRKitDateTime: FHIRKitPrimitiveType {
  private var _timeZoneIsUnaltered = true
  public var date: FHIRKitDate
  public var time: FHIRKitTime?
  
  public var timeZone: TimeZone? {
    didSet {
      _timeZoneIsUnaltered = false
    }
  }
  
  public let originalTimeZoneString: String?
  
  public init(date: FHIRKitDate, time: FHIRKitTime? = nil, timezone: TimeZone? = nil) {
    self.init(date: date, time: time, timezone: timezone, originalTimeZoneString: nil)
  }
  
  public init(_ originalString: String) throws {
    let scanner = Scanner(string: originalString)
    let (date, time, timezone, timeZoneString) = try FHIRKitDateTime.parse(from: scanner)
    self.init(date: date, time: time, timezone: timezone, originalTimeZoneString: timeZoneString)
  }
  
  private init(date: FHIRKitDate, time: FHIRKitTime? = nil, timezone: TimeZone? = nil, originalTimeZoneString: String? = nil) {
    self.date = date
    self.time = time
    self.timeZone = timezone
    self.originalTimeZoneString = originalTimeZoneString
  }
  
  public static func parse(from scanner: Scanner, expectAtEnd: Bool = true) throws -> (date: FHIRKitDate, time: FHIRKitTime?, timezone: TimeZone?, timeZoneString: String?) {
    let originalCharactersToBeSkipped = scanner.charactersToBeSkipped
    defer { scanner.charactersToBeSkipped = originalCharactersToBeSkipped }
    scanner.charactersToBeSkipped = nil
    
    // date
    let date = try FHIRKitDate.parse(from: scanner, expectAtEnd: false)
    var time: FHIRKitTime?
    var timeZone: TimeZone?
    var timeZoneString: String?
    
    // time
    if scanner.scanString("T", into: nil) {
      time = try FHIRKitTime.parse(from: scanner, expectAtEnd: false)
      
      // timezone
      let (secondsFromGMT, tzString) = try TimeZone.hs_parseComponents(from: scanner, expectAtEnd: true)
      timeZone = TimeZone(secondsFromGMT: secondsFromGMT)
      timeZoneString = tzString
    }
    
    let scanLocation = scanner.scanLocation
    if expectAtEnd && !scanner.isAtEnd {
      throw FHIRKitDateParserError.additionalCharacters(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    return (date, time, timeZone, timeZoneString)
  }
}

extension FHIRKitDateTime: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    try! self.init(value) // swiftlint:disable:this force_try
  }
}

// MARK: - Codable
extension FHIRKitDateTime: Codable {
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

extension FHIRKitDateTime: CustomStringConvertible {
  public var description: String {
    if let time = time, let timeZone = timeZone {
      if _timeZoneIsUnaltered, let originalTimeZoneString = originalTimeZoneString {
        return "\(date.description)T\(time.description)\(originalTimeZoneString)"
      }
      return "\(date.description)T\(time.description)\(timeZone.fhirDescription)"
    }
    return date.description
  }
}

extension FHIRKitDateTime: Equatable {
  
  public static func == (leftSide: FHIRKitDateTime, rightSide: FHIRKitDateTime) -> Bool {
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

extension FHIRKitDateTime: Comparable {
    /// This comparison will be done by taking time zones into account.
  public static func < (leftSide: FHIRKitDateTime, rightSide: FHIRKitDateTime) -> Bool {
    do {
      return try leftSide.compare(rightSide) == .orderedAscending
    } catch {
      print("DateTime comparison \(String(describing: leftSide)) < \(String(describing: rightSide)) raised \(String(describing: error))")
      return false
    }
  }
}
