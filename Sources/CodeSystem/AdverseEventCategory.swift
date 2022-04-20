//
//  AdverseEventCategory.swift
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
 Overall categorization of the event, e.g. product-related or situational.
 
 URL: http://terminology.hl7.org/CodeSystem/adverse-event-category
 ValueSet: http://hl7.org/fhir/ValueSet/adverse-event-category
 */
public enum AdverseEventCategory: String, FHIRKitPrimitiveType {
  /// Adverse event pertains to a product problem
  case productProblem = "product-problem"
  
  /// Adverse event pertains to product quality
  case productQuality = "product-quality"
  
  /// Adverse event pertains to product use error
  case productUseError = "product-use-error"
  
  /// Adverse event pertains to a wrong dose
  case wrongDose = "wrong-dose"
  
  /// Adverse event pertains to incorrect prescribing information
  case incorrectPrescribingInformation = "incorrect-prescribing-information"
  
  /// Adverse event pertains to a wrong technique
  case wrongTechnique = "wrong-technique"
  
  /// Adverse event pertains to a wrong route of adminstration
  case wrongRouteOfAdministration = "wrong-route-of-adminstration"
  
  /// Adverse event pertains to a wrong rate
  case wrongRate = "wrong-rate"
  
  /// Adverse event pertains to a wrong duration
  case wrongDuration = "wrong-duration"
  
  /// Adverse event pertains to a wrong time
  case wrongTime = "wrong-time"
  
  /// Adverse event pertains to a wrong drug
  case expiredDrug = "expired-drug"
  
  /// Adverse event pertains to a medical device use error
  case medicalDeviceUseError = "medical-device-use-error"
  
  /// Adverse event pertains to a problem with a different manufacturer of the same medication
  case problemDifferentManufacturer = "problem-different-manufacturer"
  
  /// Adverse event pertains to an unsafe physical environment
  case unsafePhysicalEnvironment = "unsafe-physical-environment"
}
