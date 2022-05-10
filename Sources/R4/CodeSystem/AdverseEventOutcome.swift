//
//  AdverseEventOutcome.swift
//  Asclepius
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
 TODO (and should this be required?).
 
 URL: http://terminology.hl7.org/CodeSystem/adverse-event-outcome
 ValueSet: http://hl7.org/fhir/ValueSet/adverse-event-outcome
 */
public enum AdverseEventOutcome: String, AsclepiusPrimitiveType {
  /// resolved
  case resolved
  
  /// recovering
  case recovering
  
  /// ongoing
  case ongoing
  
  /// resolved with sequelae
  case resolvedWithSequelae
  
  /// fatal
  case fatal
  
  /// unknown
  case unknown
}
