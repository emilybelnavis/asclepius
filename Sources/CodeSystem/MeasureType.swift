//
//  MeasureType.swift
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
 The type of measure (includes codes from 2.16.840.1.113883.1.11.20368).
 
 URL: http://terminology.hl7.org/CodeSystem/measure-type
 ValueSet: http://hl7.org/fhir/ValueSet/measure-type
 */
public enum MeasureType: String, FHIRKitPrimitiveType {
  /// A measure which focuses on a process which leads to a certain outcome, meaning that a scientific basis exists
  /// for believing that the process, when executed well, will increase the probability of achieving a desired
  /// outcome.
  case process
  
  /// A measure that indicates the result of the performance (or non-performance) of a function or process.
  case outcome
  
  /// A measure that focuses on a health care provider's capacity, systems, and processes to provide high-quality
  /// care.
  case structure
  
  /// A measure that focuses on patient-reported information such as patient engagement or patient experience
  /// measures.
  case patientReportedOutcome = "patient-reported-outcome"
  
  /// A measure that combines multiple component measures in to a single quality measure.
  case composite
}
