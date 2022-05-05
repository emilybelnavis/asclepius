//
//  MedicationStatusCodes.swift
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
 Medication Status Codes
 
 URL: http://hl7.org/fhir/CodeSystem/medication-status
 ValueSet: http://hl7.org/fhir/ValueSet/medication-status
 */
public enum MedicationStatusCodes: String, FHIRKitPrimitiveType {
  /// The medication is available for use.
  case active
  
  /// The medication is not available for use.
  case inactive
  
  /// The medication was entered in error.
  case enteredInError = "entered-in-error"
}