//
//  CompositeMeasureScoring.swift
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
 The composite scoring method of the measure.
 
 URL: http://terminology.hl7.org/CodeSystem/composite-measure-scoring
 ValueSet: http://hl7.org/fhir/ValueSet/composite-measure-scoring
 */
public enum CompositeMeasureScoring: String, FHIRKitPrimitiveType {
  /// Opportunity scoring combines the scores from component measures by combining the numerators
  /// and denominators for each component
  case opportunity
  
  /// All-or-nothing scoring includes an individual in the numerator of the composite measure if they are in
  /// the numerators of all the component measures in which they are the denominator
  case allOrNothing = "all-or-nothing"
  
  /// Linear scoring gives an individual a score based on the number of numerators in which they appear
  case linear
  
  /// Weighted scoring gives an individual a score based on a weighted factor for each component
  /// numerator in which they appear
  case weighted
}
