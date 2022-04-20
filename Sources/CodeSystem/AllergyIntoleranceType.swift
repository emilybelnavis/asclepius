//
//  AllergyIntoleranceType.swift
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
 Identification of the underlying physiological mechanism for a Reaction Risk.
 
 URL: http://hl7.org/fhir/allergy-intolerance-type
 ValueSet: http://hl7.org/fhir/ValueSet/allergy-intolerance-type
 */
public enum AllergyIntoleranceType: String, FHIRKitPrimitiveType {
  /// A propensity for hypersensitive reaction(s) to a substance. These reactions are typically type I
  /// hypersensitvity, plus other "allergy-like" reactions, including pseudoallergy
  case allergy
  
  /// A propensity for adverse reactions to a substance taht is not judged to be allergic or "allergy-like".
  /// These reactions are typically (but not necessarily) non-immune. They are to some degree idiosyncratic
  /// and/or patient-specific (i.e, are not a reaction that is expected to occur with most or all patients given
  /// similar circumstances.)
  case intolerance
}
