//
//  FHIRKitTime.swift
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
 A time during the day, in the format hh:mm:ss. There is no date specified. Seconds must be provided due to schema type
 constraints but may be zero-filled and may be ignored at receiver discretion. The time "24:00" SHALL NOT be used. A
 time zone SHALL NOT be present. Times can be converted to a Duration since midnight.
 
 While DSTU-2 did not allow "60" seconds (the leap second), this is allowed in R4 and we're gonna allow it here, too.
 
 http://hl7.org/fhir/datatypes.html#time
 */
public struct FHIRKitTime: FHIRKitPrimitiveType {
  private var _secondsAreUnaltered = true
  
  public var hour: UInt8 {
    didSet {
      if hour > 23 {
        hour = 23
      }
    }
  }
  
  public var minute: UInt8 {
    didSet {
      if minute > 59 {
        minute = 59
      }
    }
  }
  
  public var second: Decimal {
    didSet {
      if second > 60 {
        second = 60.0
      }
      _secondsAreUnaltered = false
    }
  }
  
  public let originalSecondsString: String?
  
  /**
   Preferred initializer. Hour is capped at 23, minute at 59 and second is capped at 60.0. If you supply higher
   values they will independently be set to that maximum value.
   */
  public init(hour: UInt8, minute: UInt8, second: Decimal) {
    self.init(hour: hour, minute: minute, second: second, originalSecondsString: nil)
  }
  
  public init(_ originalString: String) throws {
    let scanner = Scanner(string: originalString)
    let (hour, minute, second, originalSecondsString) = try FHIRKitTime.parseComponents(from: scanner)
    self.init(hour: hour, minute: minute, second: second, originalSecondsString: originalSecondsString)
  }
  
  /**
   Designated, private initializer. Hour is capped at 23, minute at 59 and second is capped at 60.0. If you supply
   higher values they will independently be set to that maximum value.
   */
  private init(hour: UInt8, minute: UInt8, second: Decimal, originalSecondsString: String? = nil) {
    self.hour = (hour <= 23) ? hour : 23
    self.minute = (minute <= 59) ? minute : 59
    self.second = (second <= 60.0) ? second : 60.0
    self.originalSecondsString = originalSecondsString
  }
  
  // MARK: Parsing
  // swiftlint:disable cyclomatic_complexity
  public static func parseComponents(from scanner: Scanner, expectAtEnd: Bool = true) throws -> (hour: UInt8, minute: UInt8, second: Decimal, originalSecondsString: String) {
    let originalCharactersToBeSkipped = scanner.charactersToBeSkipped
    defer { scanner.charactersToBeSkipped = originalCharactersToBeSkipped }
    scanner.charactersToBeSkipped = nil
    let numbers = CharacterSet.decimalDigits
    
    // hours
    var scanLocation = scanner.scanLocation
    guard let hourString = scanner.hs_scanCharacters(from: numbers) else {
      throw FHIRKitDateParserError.invalidHour(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    guard hourString.count == 2 else {
      throw FHIRKitDateParserError.invalidSeparator(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation + hourString.count))
    }
    guard let hour = UInt8(hourString), hour <= 23 else {
      throw FHIRKitDateParserError.invalidHour(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    scanLocation = scanner.scanLocation
    guard scanner.scanString(":", into: nil) else {
      throw FHIRKitDateParserError.invalidSeparator(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
      // Minutes
    scanLocation = scanner.scanLocation
    guard let minuteString = scanner.hs_scanCharacters(from: numbers) else {
      throw FHIRKitDateParserError.invalidMinute(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    guard minuteString.count == 2 else {
      throw FHIRKitDateParserError.invalidSeparator(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation + minuteString.count))
    }
    guard let minute = UInt8(minuteString), minute <= 59 else {
      throw FHIRKitDateParserError.invalidMinute(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    scanLocation = scanner.scanLocation
    guard scanner.scanString(":", into: nil) else {
      throw FHIRKitDateParserError.invalidSeparator(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
      // Seconds
    scanLocation = scanner.scanLocation
    guard let fullSecondString = scanner.hs_scanCharacters(from: numbers) else {
      throw FHIRKitDateParserError.invalidSecond(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    guard fullSecondString.count == 2 else {
      throw FHIRKitDateParserError.invalidSeparator(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation + fullSecondString.count))
    }
    guard let scanSecondAlone = Int(fullSecondString), scanSecondAlone <= 60 else {
      throw FHIRKitDateParserError.invalidSecond(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    let secondString: String
    scanLocation = scanner.scanLocation
    if scanner.scanString(".", into: nil) {
      scanLocation = scanner.scanLocation
      guard let subSecondString = scanner.hs_scanCharacters(from: numbers) else {
        throw FHIRKitDateParserError.invalidSecond(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
      }
      secondString = "\(fullSecondString).\(subSecondString)"
    } else {
      secondString = fullSecondString
    }
    guard let second = Decimal(string: secondString), second <= 60.0 else {
      throw FHIRKitDateParserError.invalidSecond(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    // End
    scanLocation = scanner.scanLocation
    if expectAtEnd && !scanner.isAtEnd {    // it's OK if we don't `expectAtEnd` but the scanner actually is
      throw FHIRKitDateParserError.additionalCharacters(FHIRKitDateParserErrorPosition(string: scanner.string, location: scanLocation))
    }
    
    return (hour, minute, second, secondString)
  }
  
  public static func parse(from scanner: Scanner, expectAtEnd: Bool = true) throws -> FHIRKitTime {
    let (hour, minute, second, originalSecondsString) = try FHIRKitTime.parseComponents(from: scanner, expectAtEnd: expectAtEnd)
    return self.init(hour: hour, minute: minute, second: second, originalSecondsString: originalSecondsString)
  }
}

// MARK: -

extension FHIRKitTime: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    try! self.init(value) // swiftlint:disable:this force_try
  }
}

// MARK: - Codable
extension FHIRKitTime: Codable {
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

extension FHIRKitTime: CustomStringConvertible {
  static let secondsFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.allowsFloats = true
    formatter.decimalSeparator = "."
    formatter.maximumIntegerDigits = 2
    formatter.minimumIntegerDigits = 2
    formatter.alwaysShowsDecimalSeparator = false
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 15
    
    return formatter
  }()
  
  public var description: String {
    if _secondsAreUnaltered, let originalSecondsString = originalSecondsString {
      return String(format: "%02d:%02d:\(originalSecondsString)", hour, minute)
    }
    return String(format: "%02d:%02d:\(FHIRKitTime.secondsFormatter.string(for: second) ?? "00")", hour, minute)
  }
}

extension FHIRKitTime: Equatable {
  public static func == (leftSide: FHIRKitTime, rightSide: FHIRKitTime) -> Bool {
    if leftSide.hour != rightSide.hour {
      return false
    }
    
    if leftSide.minute != rightSide.minute {
      return false
    }
    
    if leftSide.second != rightSide.second {
      return false
    }
    
    return true
  }
}

extension FHIRKitTime: Comparable {
  public static func < (leftSide: FHIRKitTime, rightSide: FHIRKitTime) -> Bool {
    if leftSide.hour < rightSide.hour {
      return true
    } else if leftSide.hour == rightSide.hour {
      if leftSide.minute < rightSide.minute {
        return true
      } else if leftSide.minute == rightSide.minute {
        return leftSide.second < rightSide.second
      }
    }
    return false
  }
}
