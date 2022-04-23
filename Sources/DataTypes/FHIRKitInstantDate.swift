//
//  FHIRKitInstantDate.swift
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
 A stricter version of `FHIRKitdate` which requires month and day to be present, for use in an `Instant`
 
 http://hl7.org/fhir/datatypes.html#date
 */
public struct FHIRKitInstantDate: FHIRKitPrimitiveType {
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
    let (year, month, day) = try FHIRKitInstantDate.parseComponents(from: scanner)
    self.init(year: year, month: month, day: day)
  }
  
  public static func parseComponents(from scanner: Scanner, expectAtEnd: Bool = true) throws -> (year: Int, month: UInt8, day: UInt8) {
    let originalCharacterstoBeSkipped = scanner.charactersToBeSkipped
    defer { scanner.charactersToBeSkipped = originalCharacterstoBeSkipped }
    scanner.charactersToBeSkipped = nil
    let numbers = CharacterSet.decimalDigits
    
    // year
    var scanLocation = scanner.scanLocation
    guard let scanned = scanner.hs_scanCharacters(from: numbers), scanned.count == 4, let year = Int(scanned), year > 0 else {
      throw FHIRKitDateParserError.invalidYear(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    // month
    guard scanner.scanString("-", into: nil) else {
      throw FHIRKitDateParserError.invalidSeparator(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    scanLocation = scanner.scanLocation
    guard let scannedMonth = scanner.hs_scanCharacters(from: numbers), scannedMonth.count == 2, let month = UInt8(scannedMonth), (1...12).contains(month) else {
      throw FHIRKitDateParserError.invalidMonth(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    // day
    guard scanner.scanString("-", into: nil) else {
      throw FHIRKitDateParserError.invalidSeparator(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    scanLocation = scanner.scanLocation
    guard let scannedDay = scanner.hs_scanCharacters(from: numbers), scannedDay.count == 2, let day = UInt8(scannedDay), (1...31).contains(day) else {
      throw FHIRKitDateParserError.invalidDay(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    // finish
    scanLocation = scanner.scanLocation
    if expectAtEnd && !scanner.isAtEnd {
      throw FHIRKitDateParserError.additionalCharacters(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    return (year, month, day)
  }
  
  public static func parse(from scanner: Scanner, expectAtEnd: Bool = true) throws -> FHIRKitInstantDate {
    let (year, month, day) = try FHIRKitInstantDate.parseComponents(from: scanner, expectAtEnd: expectAtEnd)
    return self.init(year: year, month: month, day: day)
  }
}

extension FHIRKitInstantDate: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    try! self.init(value) // swiftlint:disable:this force_try
  }
}

extension FHIRKitInstantDate: Codable {
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

extension FHIRKitInstantDate: CustomStringConvertible {
  public var description: String {
    return String(format: "%04d-%02d-%02d", year, month, day)
  }
}

extension FHIRKitInstantDate: Equatable {
  public static func == (leftSide: FHIRKitInstantDate, rightSide: FHIRKitInstantDate) -> Bool {
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
  
  public static func == (leftSide: FHIRKitInstantDate, rightSide: FHIRKitDate) -> Bool {
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
  
  public static func == (leftSide: FHIRKitDate, rightSide: FHIRKitInstantDate) -> Bool {
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

extension FHIRKitInstantDate: Comparable {
  public static func < (leftSide: FHIRKitInstantDate, rightSide: FHIRKitInstantDate) -> Bool {
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
  
  public static func < (leftSide: FHIRKitInstantDate, rightSide: FHIRKitDate) -> Bool {
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
  
  public static func < (leftSide: FHIRKitDate, rightSide: FHIRKitInstantDate) -> Bool {
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

extension FHIRKitInstantDate {
  public var fhirKitDate: FHIRKitDate {
    return FHIRKitDate(year: year, month: month, day: day)
  }
}
