//
//  ObservationReferenceRangeMeaningCodes.swift
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
 This value set defines a set of codes that can be used to indicate the meaning/use of a reference range for a
 particular target population.
 
 URL: http://terminology.hl7.org/CodeSystem/referencerange-meaning
 ValueSet: http://hl7.org/fhir/ValueSet/referencerange-meaning
 */
public enum ObservationReferenceRangeMeaningCodes: String, FHIRKitPrimitiveType {
  /// General types of reference range.
  case type
  
  /// Values expected for a normal member of the relevant control population being measured. Typically each results
  /// producer such as a laboratory has specific normal ranges and they are usually defined as within two standard
  /// deviations from the mean and account for 95.45% of this population.
  case normal
  
  /// The range that is recommended by a relevant professional body.
  case recommended
  
  /// The range at which treatment would/should be considered.
  case treatment
  
  /// The optimal range for best therapeutic outcomes.
  case therapeutic
  
  /// The optimal range for best therapeutic outcomes for a specimen taken immediately before administration.
  case pre
  
  /// The optimal range for best therapeutic outcomes for a specimen taken immediately after administration.
  case post
  
  /// Endocrine related states that change the expected value.
  case endocrine
  
  /// An expected range in an individual prior to puberty.
  case prePuberty = "pre-puberty"
  
  /// An expected range in an individual during the follicular stage of the cycle.
  case follicular
  
  /// An expected range in an individual during the midcycle stage of the cycle.
  case midcycle
  
  /// An expected range in an individual during the luteal stage of the cycle.
  case luteal
  
  /// An expected range in an individual post-menopause.
  case postmenopausal
}
