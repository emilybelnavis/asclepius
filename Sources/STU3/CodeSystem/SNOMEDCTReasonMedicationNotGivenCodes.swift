//
//  SNOMEDCTReasonMedicationNotGivenCodes.swift
//  AlexandriaHRM
//  Module: STU3
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
 This value set includes all medication refused, medication not administered, and non-administration of necessary drug
 or medicine codes from SNOMED CT - provided as an exemplar value set.
 
 URL: http://hl7.org/fhir/reason-medication-not-given
 */
public enum SNOMEDCTReasonMedicationNotGivenCodes: String, AlexandriaHRMPrimitiveType {
  /// No reason known.
  case A = "a" // swiftlint:disable:this identifier_name
  
  /// The patient was not available when the dose was scheduled.
  case B = "b" // swiftlint:disable:this identifier_name
  
  /// The patient was asleep when the dose was scheduled.
  case C = "c" // swiftlint:disable:this identifier_name
  
  /// The patient was given the medication and immediately vomited it back.
  case D = "d" // swiftlint:disable:this identifier_name
}