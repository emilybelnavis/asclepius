//
//  FHIRKit+DateParserError.swift
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

public struct FHIRDateParserErrorPosition: CustomStringConvertible {
    public let string: String
    public let location: Int
    
    public init(string: String, location: Int) {
        self.string = string
        self.location = location
    }
    
    public var description: String {
        return "[\(location)] in “\(string)”"
    }
}

// MARK: - FHIRDateParserErrorPosition

extension FHIRDateParserErrorPosition: Equatable {
    public static func ==(lhs: FHIRDateParserErrorPosition, rhs: FHIRDateParserErrorPosition) -> Bool {
        if lhs.string != rhs.string {
            return false
        }
        if lhs.location != rhs.location {
            return false
        }
        return true
    }
}

// MARK: - FHIRDateParserError

public enum FHIRDateParserError: LocalizedError {
    case invalidSeparator(FHIRDateParserErrorPosition)
    case invalidYear(FHIRDateParserErrorPosition)
    case invalidMonth(FHIRDateParserErrorPosition)
    case invalidDay(FHIRDateParserErrorPosition)
    case invalidHour(FHIRDateParserErrorPosition)
    case invalidMinute(FHIRDateParserErrorPosition)
    case invalidSecond(FHIRDateParserErrorPosition)
    case invalidTimeZonePrefix(FHIRDateParserErrorPosition)
    case invalidTimeZoneHour(FHIRDateParserErrorPosition)
    case invalidTimeZoneMinute(FHIRDateParserErrorPosition)
    case additionalCharacters(FHIRDateParserErrorPosition)
    
    public var errorDescription: String? {
        switch self {
        case .invalidSeparator(let position):
            return "Invalid separator at \(position)"
        case .invalidYear(let position):
            return "Invalid year at \(position)"
        case .invalidMonth(let position):
            return "Invalid month at \(position)"
        case .invalidDay(let position):
            return "Invalid day at \(position)"
        case .invalidHour(let position):
            return "Invalid hour at \(position)"
        case .invalidMinute(let position):
            return "Invalid minute at \(position)"
        case .invalidSecond(let position):
            return "Invalid second at \(position)"
        case .invalidTimeZonePrefix(let position):
            return "Invalid time zone prefix at \(position)"
        case .invalidTimeZoneHour(let position):
            return "Invalid time zone hour at \(position)"
        case .invalidTimeZoneMinute(let position):
            return "Invalid time zone minute at \(position)"
        case .additionalCharacters(let position):
            return "Unexpected characters after \(position)"
        }
    }
    
    public var errorPosition: FHIRDateParserErrorPosition {
        switch self {
        case .invalidSeparator(let position):
            return position
        case .invalidYear(let position):
            return position
        case .invalidMonth(let position):
            return position
        case .invalidDay(let position):
            return position
        case .invalidHour(let position):
            return position
        case .invalidMinute(let position):
            return position
        case .invalidSecond(let position):
            return position
        case .invalidTimeZonePrefix(let position):
            return position
        case .invalidTimeZoneHour(let position):
            return position
        case .invalidTimeZoneMinute(let position):
            return position
        case .additionalCharacters(let position):
            return position
        }
    }
}
