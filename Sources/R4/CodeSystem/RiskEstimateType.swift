//
//  RiskEstimateType.swift
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
 Whether the risk estimate is dichotomous, continuous or qualitative and the specific type of risk estimate (eg
 proportion or median).
 
 URL: http://terminology.hl7.org/CodeSystem/risk-estimate-type
 ValueSet: http://hl7.org/fhir/ValueSet/risk-estimate-type
 */
public enum RiskEstimateType: String, FHIRKitPrimitiveType {
  /// dichotomous measure (present or absent) reported as a ratio compared to the denominator of 1 (A percentage is a
  /// proportion with denominator of 100).
  case proportion
  
  /// A special use case where the proportion is derived from a formula rather than derived from summary evidence.
  case derivedProportion
  
  /// continuous numerical measure reported as an average.
  case mean
  
  /// continuous numerical measure reported as the middle of the range.
  case median
  
  /// descriptive measure reported as total number of items.
  case count
  
  /// descriptive measure reported as narrative.
  case descriptive
}
