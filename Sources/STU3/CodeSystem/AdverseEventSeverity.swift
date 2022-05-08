//
//  AdverseEventSeverity.swift
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
 The severity of the adverse event itself, in direct relation to the subject.
 
 URL: http://terminology.hl7.org/CodeSystem/adverse-event-severity
 ValueSet: http://hl7.org/fhir/ValueSet/adverse-event-severity
 */
public enum AdverseEventSeverity: String, AlexandriaHRMPrimitiveType {
  /// Mild
  case mild
  
  /// Moderate
  case moderate
  
  /// Severe
  case severe
}
