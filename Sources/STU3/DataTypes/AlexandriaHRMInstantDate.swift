//
//  AlexandriaHRMInstantDate.swift
//  AlexandriaHRM
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
import AlexandriaHRMCore

/**
 A stricter version of `AlexandriaHRMDate` which requires month and day to be present, for use in an `Instant`
 
 http://hl7.org/fhir/datatypes.html#date
 */
public struct AlexandriaHRMInstantDate: AlexandriaHRMPrimitiveType {
  public var year: Int
  public var month: UInt8 {
    didSet {
      if month > 12 {
        month = oldValue
      }
    }
  }
  
  public var day: UInt8 {
    didSet {
      if day > 31 {
        day = oldValue
      }
    }
  }
  
  public init(year: Int, month: UInt8, day: UInt8) {
    self.year = year
    self.month = min(month, 12)
    self.day = min(day, 31)
  }
  
  public init(_ originalString: String) throws {
    let scanner = Scanner(string: originalString)
    let (year, month, day) = try AlexandriaHRMInstantDate.parseComponents(from: scanner)
    self.init(year: year, month: month, day: day)
  }
  
  /// Parse valid "date" strings but required the month and day to be present
  /// See http://hl7.org/fhir/datatypes.html#date for more details
  public static func parseComponents(from scanner: Scanner, expectAtEnd: Bool = true) throws -> (year: Int, month: UInt8, day: UInt8) {
    let originalCharacterstoBeSkipped = scanner.charactersToBeSkipped
    defer { scanner.charactersToBeSkipped = originalCharacterstoBeSkipped }
    scanner.charactersToBeSkipped = nil
    let numbers = CharacterSet.decimalDigits
    
    // year
    var scanLocation = scanner.scanLocation
    guard let scanned = scanner.hs_scanCharacters(from: numbers), scanned.count == 4, let year = Int(scanned), year > 0 else {
      throw AlexandriaHRMDateParserError.invalidYear(AlexandriaHRMDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    // month
    guard scanner.scanString("-", into: nil) else {
      throw AlexandriaHRMDateParserError.invalidSeparator(AlexandriaHRMDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    scanLocation = scanner.scanLocation
    guard let scannedMonth = scanner.hs_scanCharacters(from: numbers), scannedMonth.count == 2, let month = UInt8(scannedMonth), (1...12).contains(month) else {
      throw AlexandriaHRMDateParserError.invalidMonth(AlexandriaHRMDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    // day
    guard scanner.scanString("-", into: nil) else {
      throw AlexandriaHRMDateParserError.invalidSeparator(AlexandriaHRMDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    scanLocation = scanner.scanLocation
    guard let scannedDay = scanner.hs_scanCharacters(from: numbers), scannedDay.count == 2, let day = UInt8(scannedDay), (1...31).contains(day) else {
      throw AlexandriaHRMDateParserError.invalidDay(AlexandriaHRMDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    // finish
    scanLocation = scanner.scanLocation
    if expectAtEnd && !scanner.isAtEnd {
      throw AlexandriaHRMDateParserError.additionalCharacters(AlexandriaHRMDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    return (year, month, day)
  }
  
  public static func parse(from scanner: Scanner, expectAtEnd: Bool = true) throws -> AlexandriaHRMInstantDate {
    let (year, month, day) = try AlexandriaHRMInstantDate.parseComponents(from: scanner, expectAtEnd: expectAtEnd)
    return self.init(year: year, month: month, day: day)
  }
}

// MARK: - ExpressibleByStringLiteral
extension AlexandriaHRMInstantDate: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    try! self.init(value) // swiftlint:disable:this force_try
  }
}

// MARK: - Codable
extension AlexandriaHRMInstantDate: Codable {
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
extension AlexandriaHRMInstantDate: CustomStringConvertible {
  public var description: String {
    return String(format: "%04d-%02d-%02d", year, month, day)
  }
}

// MARK: - Equatable
extension AlexandriaHRMInstantDate: Equatable {
  public static func == (leftSide: AlexandriaHRMInstantDate, rightSide: AlexandriaHRMInstantDate) -> Bool {
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
  
  public static func == (leftSide: AlexandriaHRMInstantDate, rightSide: AlexandriaHRMDate) -> Bool {
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
  
  public static func == (leftSide: AlexandriaHRMDate, rightSide: AlexandriaHRMInstantDate) -> Bool {
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
extension AlexandriaHRMInstantDate: Comparable {
  public static func < (leftSide: AlexandriaHRMInstantDate, rightSide: AlexandriaHRMInstantDate) -> Bool {
    if leftSide.year < rightSide.year {
      return true
    } else if leftSide.year == rightSide.year {
      if leftSide.month < rightSide.month {
        return true
      } else if leftSide.month == rightSide.month {
        return leftSide.day < rightSide.day
      }
    }
    return false
  }
  
  public static func < (leftSide: AlexandriaHRMInstantDate, rightSide: AlexandriaHRMDate) -> Bool {
    if leftSide.year < rightSide.year {
      return true
    } else if leftSide.year == rightSide.year {
      if leftSide.month < rightSide.month ?? 0 {
       return true
      } else if leftSide.month == rightSide.month {
        return leftSide.day < rightSide.day ?? 0
      }
    }
    return false
  }
  
  public static func < (leftSide: AlexandriaHRMDate, rightSide: AlexandriaHRMInstantDate) -> Bool {
    if leftSide.year < rightSide.year {
      return true
    } else if leftSide.year == rightSide.year {
      if leftSide.month ?? 0 < rightSide.month {
        return true
      } else if leftSide.month == rightSide.month {
        return leftSide.day ?? 0 < rightSide.day
      }
    }
    return false
  }
}

// MARK: - Extends self
extension AlexandriaHRMInstantDate {
  public var fhirKitDate: AlexandriaHRMDate {
    return AlexandriaHRMDate(year: year, month: month, day: day)
  }
}
