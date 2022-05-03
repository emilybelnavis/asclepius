//
//  MeasureImprovementNotation.swift
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
 Observation values that indicate what change in a measurement value or score is indicative of an improvement in the
 measured item or scored issue.
 
 URL: http://terminology.hl7.org/CodeSystem/measure-improvement-notation
 ValueSet: http://hl7.org/fhir/ValueSet/measure-improvement-notation
 */
public enum MeasureImprovementNotation: String, FHIRKitPrimitiveType {
  /// Improvement is indicated as an increase in the score or measurement (e.g. Higher score indicates better
  /// quality).
  case increase
  
  /// Improvement is indicated as a decrease in the score or measurement (e.g. Lower score indicates better quality).
  case decrease
}
