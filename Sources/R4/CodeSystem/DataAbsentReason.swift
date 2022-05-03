//
//  DataAbsentReason.swift
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
 Used to specify why the normally expected content of the data element is missing.
 
 URL: http://terminology.hl7.org/CodeSystem/data-absent-reason
 ValueSet: http://hl7.org/fhir/ValueSet/data-absent-reason
 */
public enum DataAbsentReason: String, FHIRKitPrimitiveType {
  /// The value is expected to exist but is not known.
  case unknown
  
  /// The source was asked but does not know the value.
  case askedUnknown = "asked-unknown"

  /// There is reason to expect (from the workflow) that the value may become known.
  case tempUnknown = "temp-unknown"
  
  /// The workflow didn't lead to this value being known.
  case notAsked = "not-asked"
  
  /// The source was asked but declined to answer.
  case askedDeclined = "asked-declined"
  
  /// The information is not available due to security, privacy or related reasons.
  case masked
  
  /// There is no proper value for this element (e.g. last menstrual period for a male).
  case notApplicable = "not-applicable"

  /// The source system wasn't capable of supporting this element.
  case unsupported
  
  /// The content of the data is represented in the resource narrative.
  case asText = "as-text"
  
  /// Some system or workflow process error means that the information is not available.
  case error
  
  /// The numeric value is undefined or unrepresentable due to a floating point processing error.
  case notANumber = "not-a-number"
  
  /// The numeric value is excessively low and unrepresentable due to a floating point processing error.
  case negativeInfinity = "negative-infinity"
  
  /// The numeric value is excessively high and unrepresentable due to a floating point processing error.
  case positiveInfinity = "positive-infinity"
  
  /// The value is not available because the observation procedure (test, etc.) was not performed.
  case notPerformed = "not-performed"
  
  /// The value is not permitted in this context (e.g. due to profiles, or the base data types).
  case notPermitted = "not-permitted"
}
