//
//  ExplanationOfBenefitStatus.swift
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
 A code specifying the state of the resource instance.
 
 URL: http://hl7.org/fhir/explanationofbenefit-status
 ValueSet: http://hl7.org/fhir/ValueSet/explanationofbenefit-status
 */
public enum ExplanationOfBenefitStatus: String, AlexandriaHRMPrimitiveType {
  /// The resource instance is currently in-force.
  case active
  
  /// The resource instance is withdrawn, rescinded or reversed.
  case cancelled
  
  /// A new resource instance the contents of which is not complete.
  case draft
  
  /// The resource instance was entered in error.
  case enteredInError = "entered-in-error"
}