//
//  ObservationDataType.swift
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

/**
 Permitted data type for observation value.
 
 URL: http://hl7.org/fhir/permitted-data-type
 ValueSet: http://hl7.org/fhir/ValueSet/permitted-data-type
 */
public enum ObservationDataType: String, FHIRKitPrimitiveType {
  /// A measured amount.
  case quantity = "Quantity"
  
  /// A coded concept from a reference terminology and/or text.
  case codeableConcept = "CodeableConcept"
  
  /// A sequence of Unicode characters.
  case string
  
  /// true or false.
  case boolean
  
  /// A signed integer.
  case integer
  
  /// A set of values bounded by low and high.
  case range = "Range"
  
  /// A ratio of two Quantity values - a numerator and a denominator.
  case ratio = "Ratio"
  
  /// A series of measurements taken by a device.
  case sampledData = "SampledData"
  
  /// A time during the day, in the format hh:mm:ss.
  case time
  
  /// A date, date-time or partial date (e.g. just year or year + month) as used in human communication.
  case dateTime
  
  /// A time range defined by start and end date/time.
  case period = "Period"
}
