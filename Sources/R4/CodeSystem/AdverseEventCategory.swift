//
//  AdverseEventCategory.swift
//  AlexandriaHRM
//  Module: R4
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

/**
 Overall categorization of the event, e.g. product-related or situational.
 
 URL: http://terminology.hl7.org/CodeSystem/adverse-event-category
 ValueSet: http://hl7.org/fhir/ValueSet/adverse-event-category
 */
public enum AdverseEventCategory: String, AlexandriaHRMPrimitiveType {
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
