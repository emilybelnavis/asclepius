//
//  EffectEstimateType.swift
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
 Whether the effect estimate is an absolute effect estimate (absolute difference) or a relative effect estimate
 (relative difference), and the specific type of effect estimate (eg relative risk or median difference).
 
 URL: http://terminology.hl7.org/CodeSystem/effect-estimate-type
 ValueSet: http://hl7.org/fhir/ValueSet/effect-estimate-type
 */
public enum EffectEstimateType: String, FHIRKitPrimitiveType {
  /// relative risk (a type of relative effect estimate).
  case relativeRR = "relative-RR"
  
  /// odds ratio (a type of relative effect estimate).
  case relativeOR = "relative-OR"
  
  /// hazard ratio (a type of relative effect estimate).
  case relativeHR = "relative-HR"
  
  /// absolute risk difference (a type of absolute effect estimate).
  case absoluteARD = "absolute-ARD"
  
  /// mean difference (a type of absolute effect estimate).
  case absoluteMeanDiff = "absolute-MeanDiff"
  
  /// standardized mean difference (a type of absolute effect estimate).
  case absoluteSMD = "absolute-SMD"
  
  /// median difference (a type of absolute effect estimate).
  case absoluteMedianDiff = "absolute-MedianDiff"
}
