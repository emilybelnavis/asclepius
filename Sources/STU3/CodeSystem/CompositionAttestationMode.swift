//
//  CompositionAttestationMode.swift
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
 The way in which a person authenticated a composition.
 
 URL: http://hl7.org/fhir/composition-attestation-mode
 ValueSet: http://hl7.org/fhir/ValueSet/composition-attestation-mode
 */
public enum CompositionAttestationMode: String, AlexandriaHRMPrimitiveType {
  /// The person authenticated the content in their personal capacity
  case personal
  
  /// The person authenticated the content in their professional capacity
  case professional
  
  /// The person authenticated the content and accepted legal responsibility for its content
  case legal
  
  /// The organization authenticated the content as consistent with their policies and procedures
  case official
}
