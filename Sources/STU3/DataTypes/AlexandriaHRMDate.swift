//
//  AsclepiusDate.swift
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
 A date, or partial date (e.g. just year or year/month) as used in human communication. The format is YYYY,
 YYYY-MM, or YYYY-MM-DD (e.g, 2018, 1973-06, or 1905-08-23). **There SHALL be no time zone**.
 Dates SHALL be valid dates.
 */

public struct AsclepiusDate: AsclepiusPrimitiveType {
  public var year: Int
  public var month: UInt8? {
    didSet {
      if let month = month, month > 12 {
        self.month = oldValue
      }
    }
  }
  
  public var day: UInt8? {
    didSet {
      if let day = day, day > 31 {
        self.day = oldValue
      }
    }
  }
  
  public init(year: Int, month: UInt8? = nil, day: UInt8? = nil) {
    self.year = year
    if let month = month, month <= 12 {
      self.month = month
      if let day = day, day <= 31 {
        self.day = day
      }
    }
  }
  
  public init(_ originalString: String) throws {
    let scanner = Scanner(string: originalString)
    let (year, month, day) = try AsclepiusDate.parseComponents(from: scanner)
    self.init(year: year, month: month, day: day)
  }
  
  // MARK: - Parsing
  
  /**
   Parse valid "date" strings.
   See https://hl7.org/fhir/datatypes.html#date
   */
  public static func parseComponents(from scanner: Scanner, expectAtEnd: Bool = true) throws -> (year: Int, month: UInt8?, day: UInt8?) {
    let originalCharactersToBeSkipped = scanner.charactersToBeSkipped
    defer { scanner.charactersToBeSkipped = originalCharactersToBeSkipped }
    scanner.charactersToBeSkipped = nil
    let numbers = CharacterSet.decimalDigits
    
    var scanLocation = scanner.scanLocation
    guard let scanned = scanner.hs_scanCharacters(from: numbers), scanned.count == 4, let year = Int(scanned), year > 0 else {
      throw AsclepiusDateParserError.invalidYear(AsclepiusDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    var month: UInt8?
    var day: UInt8?
    
    if scanner.scanString("-", into: nil) {
      scanLocation = scanner.scanLocation
      guard let scanned = scanner.hs_scanCharacters(from: numbers), scanned.count == 2, let scanMonth = UInt8(scanned), (1...12).contains(scanMonth) else {
        throw AsclepiusDateParserError.invalidMonth(AsclepiusDateParserErrorPosition(string: scanner.string, location: scanLocation))
      }
      month = scanMonth
      
      if scanner.scanString("-", into: nil) {
        scanLocation = scanner.scanLocation
        guard let scanned = scanner.hs_scanCharacters(from: numbers), scanned.count == 2, let scanDay = UInt8(scanned), (1...31).contains(scanDay) else {
          throw AsclepiusDateParserError.invalidDay(AsclepiusDateParserErrorPosition(string: scanner.string, location: scanLocation))
        }
         day = scanDay
      }
    }
    
    scanLocation = scanner.scanLocation
    if expectAtEnd && !scanner.isAtEnd {
      throw AsclepiusDateParserError.additionalCharacters(AsclepiusDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    return (year, month, day)
  }
  
  public static func parse(from scanner: Scanner, expectAtEnd: Bool = true) throws -> AsclepiusDate {
    let (year, month, day) = try AsclepiusDate.parseComponents(from: scanner, expectAtEnd: expectAtEnd)
    return self.init(year: year, month: month, day: day)
  }
}

// MARK: - ExpressibleByStringLiteral

extension AsclepiusDate: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    try! self.init(value) // swiftlint:disable:this force_try
  }
}

// MARK: - Codable
extension AsclepiusDate: Codable {
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
extension AsclepiusDate: CustomStringConvertible {
  public var description: String {
    if let month = month {
      if let day = day {
        return String(format: "%04d-%02d-%02d", year, month, day)
      }
      return String(format: "%04d-%02d", year, month)
    }
    return String(format: "%04d", year)
  }
}

// MARK: - Equatable
extension AsclepiusDate: Equatable {
  public static func == (leftSide: AsclepiusDate, rightSide: AsclepiusDate) -> Bool {
    if leftSide.year != rightSide.year {
      return false
    }
    
    if leftSide.month != rightSide.month {
      return false
    }
    
    if leftSide.day != rightSide.day {
      return false
    }
    
    return true
  }
}

// MARK: - Comparable
extension AsclepiusDate: Comparable {
  public static func < (leftSide: AsclepiusDate, rightSide: AsclepiusDate) -> Bool {
    if leftSide.year < rightSide.year {
      return true
    } else if leftSide.year == rightSide.year {
      if leftSide.month ?? 0 < rightSide.month ?? 0 {
          return true
      } else if leftSide.month == rightSide.month {
      return leftSide.day ?? 0 < rightSide.day ?? 0
      }
    }
    
    return false
  }
}

// MARK: - Extends NSDate
extension AsclepiusDate: ExpressibleAsNSDate, ConstructibleFromNSDate {
  public func asNSDate() throws -> Date {
    let dateComponents = AsclepiusDateComponents(year: year, month: month, day: day)
    return try dateComponents.asNSDate()
  }
  
  public init(date: Date, timeZone timezone: TimeZone = TimeZone.current) throws {
    (self.year, self.month, self.day) = try AsclepiusDateComponents.dateComponents(from: date, with: timezone)
  }
}
