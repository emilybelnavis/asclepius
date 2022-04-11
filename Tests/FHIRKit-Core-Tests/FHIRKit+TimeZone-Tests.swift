//
//  FHIRKit+TimeZone-Tests.swift
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

import FHIRKit
import Foundation
import XCTest

class TimeZoneTests: XCTestCase {
    
    func testRendering() {
        var timezone = TimeZone(secondsFromGMT: 0)
        XCTAssertNotNil(timezone)
        XCTAssertEqual(timezone?.fhirDescription, "Z")
        
        timezone = TimeZone(secondsFromGMT: -7200)
        XCTAssertNotNil(timezone)
        XCTAssertEqual(timezone?.fhirDescription, "-02:00")
        
        timezone = TimeZone(secondsFromGMT: 7200)
        XCTAssertNotNil(timezone)
        XCTAssertEqual(timezone?.fhirDescription, "+02:00")
    }
    
    func testParsing() {
        let successes = [
            ("Z", 0),
            ("+00:00", 0),
            ("+00:22", 1320),
            ("+09:00", 32_400),
            ("-00:00", 0),
            ("-02:45", -9900),
            ("-11:00", -39_600),
        ]
        
        for (string, expectedSeconds) in successes {
            do {
                let timezone = try TimeZone(string)
                XCTAssertEqual(timezone, TimeZone(secondsFromGMT: expectedSeconds))
                if timezone.secondsFromGMT() != 0 {         // We'll always return "Z" in this case, so can't test with +00:00 and co
                    XCTAssertEqual(string, timezone.fhirDescription)
                }
            } catch {
                XCTFail("Should succeed parsing \"\(string)\" but threw: \(error)")
            }
        }
        
        // Prefix Failures
        let prefixThrowers = [
            ("", 0),
            ("A", 0),
            ("U", 0),
            ("11:00", 0),
            (" 09:00", 0),
        ]
        for (string, location) in prefixThrowers {
            do {
                let timezone = try TimeZone(string)
                XCTFail("Should fail to parse \"\(string)\" but succeeded, parsed \(timezone)")
            } catch FHIRDateParserError.invalidTimeZonePrefix(let position) {
                let expectedPosition = FHIRDateParserErrorPosition(string: string, location: location)
                XCTAssertEqual(position, expectedPosition)
            } catch {
                XCTFail("Should throw FHIRDateParserError.invalidTimeZonePrefix but threw \(error)")
            }
        }
        
        // Hour Failures
        let hourThrowers = [
            ("+19:00", 1),
            ("-15:00", 1),
        ]
        for (string, location) in hourThrowers {
            do {
                let timezone = try TimeZone(string)
                XCTFail("Should fail to parse \"\(string)\" but succeeded, parsed \(timezone)")
            } catch FHIRDateParserError.invalidTimeZoneHour(let position) {
                let expectedPosition = FHIRDateParserErrorPosition(string: string, location: location)
                XCTAssertEqual(position, expectedPosition)
            } catch {
                XCTFail("Should throw FHIRDateParserError.invalidTimeZoneHour but threw \(error)")
            }
        }
        
        // Minute Failures
        let minuteThrowers = [
            ("+01:0", 4),
            ("+14:01", 4),
            ("+07:60", 4),
            ("+05:92", 4),
            ("-05:60", 4),
            ("-03:85", 4),
        ]
        for (string, location) in minuteThrowers {
            do {
                let timezone = try TimeZone(string)
                XCTFail("Should fail to parse \"\(string)\" but succeeded, parsed \(timezone)")
            } catch FHIRDateParserError.invalidTimeZoneMinute(let position) {
                let expectedPosition = FHIRDateParserErrorPosition(string: string, location: location)
                XCTAssertEqual(position, expectedPosition)
            } catch {
                XCTFail("Should throw FHIRDateParserError.invalidTimeZoneMinute but threw \(error)")
            }
        }
        
        // Separator Failures
        let separatorThrowers = [
            ("+9", 2),
            ("+09", 3),
            ("+2:30", 2),
            ("+011:00", 3),
            ("+0120", 3),
            ("-04", 3),
            ("-0400", 3),
            ("-1500", 3),
        ]
        for (string, location) in separatorThrowers {
            do {
                let timezone = try TimeZone(string)
                XCTFail("Should fail to parse \"\(string)\" but succeeded, parsed \(timezone)")
            } catch FHIRDateParserError.invalidSeparator(let position) {
                let expectedPosition = FHIRDateParserErrorPosition(string: string, location: location)
                XCTAssertEqual(position, expectedPosition)
            } catch {
                XCTFail("Should throw FHIRDateParserError.invalidSeparator but threw \(error)")
            }
        }
        
        // Extra Failures
        let extraThrowers = [
            ("+03:000", 6),
            ("-00:010", 6),
        ]
        for (string, location) in extraThrowers {
            do {
                let timezone = try TimeZone(string)
                XCTFail("Should fail to parse \"\(string)\" but succeeded, parsed \(timezone)")
            } catch FHIRDateParserError.additionalCharacters(let position) {
                let expectedPosition = FHIRDateParserErrorPosition(string: string, location: location)
                XCTAssertEqual(position, expectedPosition)
            } catch {
                XCTFail("Should throw FHIRDateParserError.additionalCharacters but threw \(error)")
            }
        }
    }
}
