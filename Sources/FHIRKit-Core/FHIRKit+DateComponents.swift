//
//  FHIRKit+DateComponents.swift
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

public struct FHIRDateComponents: ExpressibleAsNSDate {
    
    static var calendar = Calendar(identifier: .gregorian)
    
    let year: Int
    let month: UInt8?
    let day: UInt8?
    let hour: UInt8?
    let minute: UInt8?
    let second: Decimal?
    let timeZone: TimeZone?
    
    public init(year: Int, month: UInt8? = nil, day: UInt8? = nil, hour: UInt8? = nil, minute: UInt8? = nil, second: Decimal? = nil, timeZone: TimeZone? = nil) {
        self.year = year
        self.month = month
        self.day = day
        self.hour = hour
        self.minute = minute
        self.second = second
        self.timeZone = timeZone
    }
    
    public func asNSDate() throws -> Date {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents(calendar: calendar, timeZone: timeZone ?? TimeZone(abbreviation: "GMT"), era: nil, year: year)
        if let month = month {
            dateComponents.month = Int(month)
        }
        
        if let day = day {
            dateComponents.day = Int(day)
        }
        
        if let hour = hour {
            dateComponents.hour = Int(hour)
        }
        
        if let minute = minute {
            dateComponents.minute = Int(minute)
        }
        
        guard var date = dateComponents.date else {
            throw DateExpressionError.unableToExpressAsDate(dateComponents)
        }
        
        if let second = second {
            let seconds = Double(truncating: second as NSNumber)
            date.addTimeInterval(seconds)
        }
        
        return date
    }
    
    public static func dateComponents(from date: Date, with timeZone: TimeZone) throws -> (year: Int, month: UInt8?, day: UInt8?) {
        calendar.timeZone = timeZone
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        guard let year = components.year else {
            throw DateExpressionError.unableToConstructFromDate(date, components)
        }
        return (year, components.month?.asUInt8(), components.day?.asUInt8())
    }
    
    public static func timeComponents(from date: Date, with timeZone: TimeZone) throws -> (hour: UInt8, minute: UInt8, second: Decimal) {
        calendar.timeZone = timeZone
        let components = calendar.dateComponents([.hour, .minute, .second, .nanosecond], from: date)
        guard let hourInt = components.hour,
              let minuteInt = components.minute,
              let secondsInt = components.second else {
            throw DateExpressionError.unableToConstructFromDate(date, components)
        }
        
        let hour = UInt8(hourInt)
        let minute = UInt8(minuteInt)
        
        var second: Decimal
        if let nanoseconds = components.nanosecond {
            let secondsFraction = Decimal((Double(nanoseconds) / Double(1000000000)))
            second = secondsFraction + Decimal(secondsInt)
        } else {
            second = Decimal(secondsInt)
        }
        
        return (hour, minute, second)
    }
    
    public static func components(from date: Date, with timeZone: TimeZone) throws -> (year: Int, month: UInt8, day: UInt8, hour: UInt8, minute: UInt8, second: Decimal) {
        let (year, monthComponent, dayComponent) = try dateComponents(from: date, with: timeZone)
        guard let month = monthComponent else {
            let failureComponents = DateComponents(calendar: calendar, timeZone: timeZone, era: nil, year: year, month: nil)
            throw DateExpressionError.unableToConstructFromDate(date, failureComponents)
        }
        guard let day = dayComponent else {
            let failureComponents = DateComponents(calendar: calendar, timeZone: timeZone, era: nil, year: year, month: Int(month), day: nil)
            throw DateExpressionError.unableToConstructFromDate(date, failureComponents)
        }
        let (hour, minute, second) = try timeComponents(from: date, with: timeZone)
        return (year, month, day, hour, minute, second)
    }
}

extension Int {
    fileprivate func asUInt8() -> UInt8 {
        return UInt8(self)
    }
}
