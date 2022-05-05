//
//  BenefitTypeCodes.swift
//  FHIRKit
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
 This value set includes a smattering of Benefit type codes.
 
 URL: http://terminology.hl7.org/CodeSystem/benefit-type
 ValueSet: http://hl7.org/fhir/ValueSet/benefit-type
 */
public enum BenefitTypeCodes: String, FHIRKitPrimitiveType {
  /// Maximum benefit allowable
  case benefit
  
  /// Cost to be incurred before benefits are applied
  case deductible
  
  /// Service visit
  case visit
  
  /// Type of room
  case room
  
  /// Copayment per service
  case copay
  
  /// Copayment percentage per service
  case copayPercent = "copay-percent"
  
  /// Copayment maximum per service
  case copayMaximum = "copay-maximum"
  
  /// Vision exam
  case visionExam = "vision-exam"
  
  /// Frames and lenses
  case visionGlasses = "vision-glasses"
  
  /// Contact lenses
  case visionContacts = "vision-contacts"
  
  /// Medical primary health coverage
  case medicalPrimarycare = "medical-primarycare"
  
  /// Pharmacy dispense coverage
  case pharmacyDispense = "pharmacy-dispense"
}
