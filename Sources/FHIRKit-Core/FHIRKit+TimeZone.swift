//
//  FHIRKit+TimeZone.swift
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

public extension TimeZone {
    
    init(_ originalString: String) throws {
        let scanner = Scanner(string: originalString)
        let (seconds, _) = try TimeZone.hs_parseComponents(from: scanner, expectAtEnd: true)
        self.init(secondsFromGMT: seconds)!
    }
    
    var fhirDescription: String {
        if secondsFromGMT() == 0 {
            return "Z"
        }
        let ahead = (secondsFromGMT() > 0)
        let seconds = abs(secondsFromGMT())
        let hours = seconds / 3600
        let minutes = (seconds - (3600 * hours)) / 60
        let prefix = ahead ? "+" : "-"
        return String(format: "\(prefix)%02d:%02d", hours, minutes)
    }
    
    static func hs_parseComponents(from scanner: Scanner, expectAtEnd: Bool = true) throws -> (secondsFromGMT: Int, timeZoneString: String) {
        let originalCharactersToBeSkipped = scanner.charactersToBeSkipped
        defer { scanner.charactersToBeSkipped = originalCharactersToBeSkipped }
        scanner.charactersToBeSkipped = nil
        
        let plusMinusZ = CharacterSet(charactersIn: "+-Z")
        var scanLocation = scanner.scanLocation
        guard let tzPrefix = scanner.hs_scanCharacters(from: plusMinusZ) else {
            throw FHIRDateParserError.invalidTimeZonePrefix(FHIRDateParserErrorPosition(string: scanner.string, location: scanLocation))
        }
        
        let secondsFromGMT: Int
        let timeZoneString: String
        if "Z" == tzPrefix {
            secondsFromGMT = 0
            timeZoneString = tzPrefix
        } else {
            let numbers = CharacterSet.decimalDigits
            scanLocation = scanner.scanLocation
            guard let hourString = scanner.hs_scanCharacters(from: numbers) else {
                throw FHIRDateParserError.invalidTimeZoneHour(FHIRDateParserErrorPosition(string: scanner.string, location: scanLocation))
            }
            guard hourString.count == 2 else {
                throw FHIRDateParserError.invalidSeparator(FHIRDateParserErrorPosition(string: scanner.string, location: scanLocation + min(2, hourString.count)))
            }
            guard let hour = Int(hourString), hour <= 14 else {
                throw FHIRDateParserError.invalidTimeZoneHour(FHIRDateParserErrorPosition(string: scanner.string, location: scanLocation))
            }
            
            scanLocation = scanner.scanLocation
            guard scanner.scanString(":", into: nil) else {
                throw FHIRDateParserError.invalidSeparator(FHIRDateParserErrorPosition(string: scanner.string, location: scanLocation))
            }
            
            scanLocation = scanner.scanLocation
            guard let minuteString = scanner.hs_scanCharacters(from: numbers) else {
                throw FHIRDateParserError.invalidTimeZoneMinute(FHIRDateParserErrorPosition(string: scanner.string, location: scanLocation))
            }
            guard minuteString.count <= 2 else {
                throw FHIRDateParserError.additionalCharacters(FHIRDateParserErrorPosition(string: scanner.string, location: scanLocation + min(2, minuteString.count)))
            }
            guard minuteString.count == 2, let minute = Int(minuteString), minute <= 59 else {
                throw FHIRDateParserError.invalidTimeZoneMinute(FHIRDateParserErrorPosition(string: scanner.string, location: scanLocation))
            }
            guard hour < 14 || minute == 0 else {
                throw FHIRDateParserError.invalidTimeZoneMinute(FHIRDateParserErrorPosition(string: scanner.string, location: scanLocation))
            }
            
            secondsFromGMT = (("-" == tzPrefix) ? -1 : 1) * ((3600 * hour) + (60 * minute))
            timeZoneString = "\(tzPrefix)\(hourString):\(minuteString)"
        }
        
        return (secondsFromGMT, timeZoneString)
    }
}
