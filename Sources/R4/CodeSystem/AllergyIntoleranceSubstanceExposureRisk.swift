//
//  AllergyIntoleranceSubstanceExposureRisk.swift
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
 The risk of an adverse reaction (allergy or intolerance) for this patient upon exposure to the substance (including
 pharmaceutical products).
 
 URL: http://terminology.hl7.org/CodeSystem/allerg-intol-substance-exp-risk
 ValueSet: http://hl7.org/fhir/ValueSet/allerg-intol-substance-exp-risk
 */
public enum AllergyIntoleranceSubstanceExposureRisk: String, FHIRKitPrimitiveType {
  /// Known risk of allergy or intolerance reaction upon exposure to the specified substance
  case knownReactionRisk = "known-reaction-risk"
  
  /// No known risk of allergy or intolerance reaction upon exposure to the specified substance
  case noKnownReactionRisk = "no-known-reaction-risk"
}
