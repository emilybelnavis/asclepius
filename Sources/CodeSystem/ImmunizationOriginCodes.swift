//
//  ImmunizationOriginCodes.swift
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
 The value set to instantiate this attribute should be drawn from a terminologically robust code system that consists of
 or contains concepts to support describing the source of the data when the report of the immunization event is not
 based on information from the person, entity or organization who administered the vaccine. This value set is provided
 as a suggestive example.
 
 URL: http://terminology.hl7.org/CodeSystem/immunization-origin
 */
public enum ImmunizationOriginCodes: String, FHIRKitPrimitiveType {
  /// The data for the immunization event originated with another provider.
  case provider
  
  /// The data for the immunization event originated with a written record for the patient.
  case record
  
  /// The data for the immunization event originated from the recollection of the patient or parent/guardian of the
  /// patient.
  case recall
  
  /// The data for the immunization event originated with a school record for the patient.
  case school
  
  /// The data for the immunization event originated with an immunization information system (IIS) or registry
  /// operating within the jurisdiction.
  case jurisdiction
}
