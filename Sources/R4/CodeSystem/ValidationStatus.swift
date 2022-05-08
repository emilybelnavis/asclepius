//
//  ValidationStatus.swift
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
 Status of the validation of the target against the primary source
 
 URL: http://terminology.hl7.org/CodeSystem/validation-status
 ValueSet: http://hl7.org/fhir/ValueSet/verificationresult-validation-status
 */
public enum ValidationStatus: String, AlexandriaHRMPrimitiveType {
  /// successful
  case successful
  
  /// failed
  case failed
  
  /// The validations status has not been determined yet
  case unknown
}
