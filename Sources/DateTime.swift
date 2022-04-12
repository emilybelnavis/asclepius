//
//  DateTime.swift
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
 A date, date-time or partial date (e.g. just year or year + month).  If hours and minutes are specified, a time SHALL
 be populated. The format is a union of the schema types gYear, gYearMonth, date and dateTime. Seconds must be
 provided due to schema type constraints but may be zero-filled and may be ignored. Dates SHALL be valid dates.
 
 There are slight variations in permitted members, see FHIRDate's and FHIRTime's descriptions.
 
 A caveat on `Comparable` and `Equatable`:
 
 - When using `Equatable`, the instances are compared directly, meaning all properties must be identical
 - Use `==` to compare whether two instances are identical
 - Use `a.compare(b) == .orderedSame` to compare whether two instances represent the exact same date & time
 - When using `Comparable`, the instances are converted to an absolute time respecting their timezone
 
 http://hl7.org/fhir/datatypes.html#datetime
 */

public struct DateTime: FHIRKitPrimitiveType {
  private var _timeZoneIsUnaltered = true
  public var date: FHIRKitDate
  public var time: 
}
