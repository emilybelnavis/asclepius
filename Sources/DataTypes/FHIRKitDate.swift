//
//  FHIRKitDate.swift
//  FHIRKit

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
 A date or partial date (year/ year + month). Format is YYYY, YYYY-MM, or YYYY-MM-DD, e.g. 2022, 2022-04,
 or 2022-04-20. There SHALL be no time zone and dates MUST be valid dates.
 
 HL7 R4 only allows years 0001 to 9999 which is what will be enforced.
 */

public struct FHIRKitDate: FHIRKitPrimitiveType {
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
    let (year, month, day) = try FHIRKitDate.parseComponents(from: scanner)
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
      throw FHIRKitDateParserError.invalidYear(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    var month: UInt8?
    var day: UInt8?
    
    if scanner.scanString("-", into: nil) {
      scanLocation = scanner.scanLocation
      guard let scanned = scanner.hs_scanCharacters(from: numbers), scanned.count == 2, let scanMonth = UInt8(scanned), (1...12).contains(scanMonth) else {
        throw FHIRKitDateParserError.invalidMonth(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
      }
      month = scanMonth
      
      if scanner.scanString("-", into: nil) {
        scanLocation = scanner.scanLocation
        guard let scanned = scanner.hs_scanCharacters(from: numbers), scanned.count == 2, let scanDay = UInt8(scanned), (1...31).contains(scanDay) else {
          throw FHIRKitDateParserError.invalidDay(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
        }
         day = scanDay
      }
    }
    
    scanLocation = scanner.scanLocation
    if expectAtEnd && !scanner.isAtEnd {
      throw FHIRKitDateParserError.additionalCharacters(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    return (year, month, day)
  }
  
  public static func parse(from scanner: Scanner, expectAtEnd: Bool = true) throws -> FHIRKitDate {
    let (year, month, day) = try FHIRKitDate.parseComponents(from: scanner, expectAtEnd: expectAtEnd)
    return self.init(year: year, month: month, day: day)
  }
}

// MARK: -

extension FHIRKitDate: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    try! self.init(value)
  }
}

extension FHIRKitDate: Codable {
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

extension FHIRKitDate: CustomStringConvertible {
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

extension FHIRKitDate: Equatable {
  public static func ==(l: FHIRKitDate, r: FHIRKitDate) -> Bool {
    if l.year != r.year {
      return false
    }
    
    if l.month != r.month {
      return false
    }
    
    if l.day != r.day {
      return false
    }
    
    return true
  }
}

extension FHIRKitDate: Comparable {
  public static func <(l: FHIRKitDate, r: FHIRKitDate) -> Bool {
    if l.year < r.year {
      return true
    } else if l.year == r.year {
      if l.month ?? 0 < r.month ?? 0 {
          return true
      } else if l.month == r.month {
      return l.day ?? 0 < r.day ?? 0
      }
    }
    
    return false
  }
}
