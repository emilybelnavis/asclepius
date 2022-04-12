//
//  FHIRKit+DateComponent-Tests.swift
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
import XCTest

class FHIRDateComponentsTests: XCTestCase {
    
    // All these were calculated in GMT
    let date0 = Date(timeIntervalSinceReferenceDate: 662733296.0) // 2022-01-01 at 12:34:56.00
    let date1 = Date(timeIntervalSinceReferenceDate: 667747470.0) // 2022-02-28 at 13:24:30.00
    let date2 = Date(timeIntervalSinceReferenceDate: 694223999.0) // 2022-12-31 at 23:59:59.00 (one second before 2023)
    let date3 = Date(timeIntervalSinceReferenceDate: 694224000.0) // 2023-01-01 at 00:00:00.00
    let date4 = Date(timeIntervalSinceReferenceDate: 694224000.5) // 2023-01-01 at 00:00:00.5 (half a second into 2023)
    let date5 = Date(timeIntervalSinceReferenceDate: 730916400.0) // 2024-02-29 at 16:20:00 (leap year 2024)
    
    var dates: Array<[String: Any]> = []
    
    override func setUp() {
        dates = [
            [
                "date": date0,
                "gmtComponents": [2022, 1, 1, 12, 34, 56.0], // 2022-01-01 12:34:56
                "estComponents": [2022, 1, 1, 7, 34, 56.0],  // 2022-01-01 07:34:56
            ],
            [
                "date": date1,
                "gmtComponents": [2022, 2, 28, 13, 24, 30.0], // 2022-02-28 13:24:30
                "estComponents": [2022, 2, 28, 8, 24, 30.0],  // 2022-02-28 6:24:30
            ],
            [
                "date": date2,
                "gmtComponents": [2022, 12, 31, 23, 59, 59.0], // 2022-12-31 23:59:59
                "estComponents": [2022, 12, 31, 18, 59, 59.0], // 2022-12-31 16:59:59
            ],
            [
                "date": date3,
                "gmtComponents": [2023,  1,  1, 0,  0, 0.0], // 2023-01-01 00:00:00
                "estComponents": [2022, 12, 31, 19, 0, 0.0], // 2022-12-31 17:00:00
            ],
            [
                "date": date4,
                "gmtComponents": [2023, 1,  1, 0,  0, 0.5],  // 2023-01-01 00:00:00.5
                "estComponents": [2022, 12, 31, 19, 0, 0.5], // 2022-12-31 17:00:00.5
            ],
            [
                "date": date5,
                "gmtComponents": [2024, 2, 29, 16, 20, 0],  // 2024-02-29 16:20:00
                "estComponents": [2024, 2, 29, 11, 20, 0],  // 2024-02-29 11:20:00
            ]
        ]
    }
    
    let gmt = TimeZone(abbreviation: "GMT")!
    let est = TimeZone(abbreviation: "EST")! // GMT-5 Toronto ;)
    
    func testAllParsing() throws {
        for i in 0..<dates.count {
            let dateObject = dates[i]
            let date = dateObject["date"] as! Date
            let gmtComponents = dateObject["gmtComponents"] as! [NSNumber]
            let estComponents = dateObject["estComponents"] as! [NSNumber]
            
            let dateComponentsGMT = try FHIRDateComponents.dateComponents(from: date, with: gmt)
            XCTAssertEqual(dateComponentsGMT.year, gmtComponents[0] as? Int, "Date number \(i) incorrect GMT year")
            XCTAssertEqual(dateComponentsGMT.month, gmtComponents[1] as? UInt8, "Date number \(i) incorrect GMT month")
            XCTAssertEqual(dateComponentsGMT.day, gmtComponents[2] as? UInt8, "Date number \(i) incorrect GMT day")
            
            let timeComponentsGMT = try FHIRDateComponents.timeComponents(from: date, with: gmt)
            XCTAssertEqual(timeComponentsGMT.hour, gmtComponents[3] as? UInt8, "Date number \(i) incorrect GMT hour")
            XCTAssertEqual(timeComponentsGMT.minute, gmtComponents[4] as? UInt8, "Date number \(i) incorrect GMT minute")
            XCTAssertEqual(timeComponentsGMT.second, gmtComponents[5].decimalValue, "Date number \(i) incorrect GMT second")
            
            let componentsGMT = try FHIRDateComponents.components(from: date, with: gmt)
            XCTAssertEqual(componentsGMT.year, gmtComponents[0] as? Int, "Date number \(i) incorrect GMT year")
            XCTAssertEqual(componentsGMT.month, gmtComponents[1] as? UInt8, "Date number \(i) incorrect GMT month")
            XCTAssertEqual(componentsGMT.day, gmtComponents[2] as? UInt8, "Date number \(i) incorrect GMT day")
            XCTAssertEqual(componentsGMT.hour, gmtComponents[3] as? UInt8, "Date number \(i) incorrect GMT hour")
            XCTAssertEqual(componentsGMT.minute, gmtComponents[4] as? UInt8, "Date number \(i) incorrect GMT minute")
            XCTAssertEqual(componentsGMT.second, gmtComponents[5].decimalValue, "Date number \(i) incorrect GMT second")
            
            let dateComponentsEST = try FHIRDateComponents.dateComponents(from: date, with: est)
            XCTAssertEqual(dateComponentsEST.year, estComponents[0] as? Int, "Date number \(i) incorrect EST year")
            XCTAssertEqual(dateComponentsEST.month, estComponents[1] as? UInt8, "Date number \(i) incorrect EST month")
            XCTAssertEqual(dateComponentsEST.day, estComponents[2] as? UInt8, "Date number \(i) incorrect EST day")
            
            let timeComponentsEST = try FHIRDateComponents.timeComponents(from: date, with: est)
            XCTAssertEqual(timeComponentsEST.hour, estComponents[3] as? UInt8, "Date number \(i) incorrect EST hour")
            XCTAssertEqual(timeComponentsEST.minute, estComponents[4] as? UInt8, "Date number \(i) incorrect EST minute")
            XCTAssertEqual(timeComponentsEST.second, estComponents[5].decimalValue, "Date number \(i) incorrect EST second")
            
            let componentsEST = try FHIRDateComponents.components(from: date, with: est)
            XCTAssertEqual(componentsEST.year, estComponents[0] as? Int, "Date number \(i) incorrect EST year")
            XCTAssertEqual(componentsEST.month, estComponents[1] as? UInt8, "Date number \(i) incorrect EST month")
            XCTAssertEqual(componentsEST.day, estComponents[2] as? UInt8, "Date number \(i) incorrect EST day")
            XCTAssertEqual(componentsEST.hour, estComponents[3] as? UInt8, "Date number \(i) incorrect EST hour")
            XCTAssertEqual(componentsEST.minute, estComponents[4] as? UInt8, "Date number \(i) incorrect EST minute")
            XCTAssertEqual(componentsEST.second, estComponents[5].decimalValue, "Date number \(i) incorrect EST second")
        }
    }
    
    func testLeapDayParsing() throws {
        let leapDayDate = try FHIRDateComponents.dateComponents(from: date5, with: gmt)
        XCTAssertEqual(2024, leapDayDate.year)
        XCTAssertEqual(2, leapDayDate.month)
        XCTAssertEqual(29, leapDayDate.day)
        
        let leapDayTime = try FHIRDateComponents.timeComponents(from: date5, with: gmt)
        XCTAssertEqual(16, leapDayTime.hour)
        XCTAssertEqual(20, leapDayTime.minute)
        XCTAssertEqual(00.0, leapDayTime.second)
        
        let leapDayComponents = try FHIRDateComponents.components(from: date5, with: gmt)
        XCTAssertEqual(2024, leapDayComponents.year)
        XCTAssertEqual(2, leapDayComponents.month)
        XCTAssertEqual(29, leapDayComponents.day)
        XCTAssertEqual(16, leapDayComponents.hour)
        XCTAssertEqual(20, leapDayComponents.minute)
        XCTAssertEqual(0.0, leapDayTime.second)
        
        let timeZoneShiftComponents = try FHIRDateComponents.components(from: date5, with: est)
        XCTAssertEqual(2024, timeZoneShiftComponents.year)
        XCTAssertEqual(2, timeZoneShiftComponents.month)
        XCTAssertEqual(29, timeZoneShiftComponents.day)
        XCTAssertEqual(11, timeZoneShiftComponents.hour) 
        XCTAssertEqual(20, timeZoneShiftComponents.minute)
        XCTAssertEqual(0.0, timeZoneShiftComponents.second)
    }
    
    func testNewYearParsing() throws {
        let happyNewYearDateComponents = try FHIRDateComponents.dateComponents(from: date4, with: gmt)
        XCTAssertEqual(2023, happyNewYearDateComponents.year)
        XCTAssertEqual(1, happyNewYearDateComponents.month)
        XCTAssertEqual(1, happyNewYearDateComponents.day)
        
        let happyNewYearTimeComponents = try FHIRDateComponents.timeComponents(from: date4, with: gmt)
        XCTAssertEqual(0, happyNewYearTimeComponents.hour)
        XCTAssertEqual(0, happyNewYearTimeComponents.minute)
        XCTAssertEqual(0.5, happyNewYearTimeComponents.second)
        
        let happyNewYearComponents = try FHIRDateComponents.components(from: date4, with: gmt)
        XCTAssertEqual(2023, happyNewYearComponents.year)
        XCTAssertEqual(1, happyNewYearComponents.month)
        XCTAssertEqual(1, happyNewYearComponents.day)
        XCTAssertEqual(0, happyNewYearComponents.hour)
        XCTAssertEqual(0, happyNewYearComponents.minute)
        XCTAssertEqual(0.5, happyNewYearComponents.second)
        
        let timeZoneSwitchComponents = try FHIRDateComponents.components(from: date4, with: est)
        XCTAssertEqual(2022, timeZoneSwitchComponents.year)
        XCTAssertEqual(12, timeZoneSwitchComponents.month)
        XCTAssertEqual(31, timeZoneSwitchComponents.day)
        XCTAssertEqual(19, timeZoneSwitchComponents.hour)
        XCTAssertEqual(0, timeZoneSwitchComponents.minute)
        XCTAssertEqual(0.5, timeZoneSwitchComponents.second)
    }
    
    func testToNSDateConversions() throws {
        for i in 0..<dates.count {
            let dateObject = dates[i]
            let date = dateObject["date"] as! Date
            let gmtComponents = dateObject["gmtComponents"] as! [NSNumber]
            let estComponents = dateObject["estComponents"] as! [NSNumber]
            let gmtFHIRComponents = FHIRDateComponents(year: gmtComponents[0] as! Int,
                                                       month: gmtComponents[1] as? UInt8,
                                                       day: gmtComponents[2] as? UInt8,
                                                       hour: gmtComponents[3] as? UInt8,
                                                       minute: gmtComponents[4] as? UInt8,
                                                       second: gmtComponents[5].decimalValue,
                                                       timeZone: TimeZone(abbreviation: "GMT")!)
            let testGMTDate = try gmtFHIRComponents.asNSDate()
            XCTAssertEqual(testGMTDate, date, "Date number \(i) GMT date conversion incorrect")
            
            let estFHIRComponents = FHIRDateComponents(year: estComponents[0] as! Int,
                                                       month: estComponents[1] as? UInt8,
                                                       day: estComponents[2] as? UInt8,
                                                       hour: estComponents[3] as? UInt8,
                                                       minute: estComponents[4] as? UInt8,
                                                       second: estComponents[5].decimalValue,
                                                       timeZone: TimeZone(abbreviation: "EST")!)
            let testESTDate = try estFHIRComponents.asNSDate()
            XCTAssertEqual(testESTDate, date, "Date number \(i) EST date conversion incorrect")
        }
    }
}
