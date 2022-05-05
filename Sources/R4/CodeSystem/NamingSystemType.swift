//
//  NamingSystemType.swift
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
 Identifies the purpose of the naming system.
 
 URL: http://hl7.org/fhir/namingsystem-type
 ValueSet: http://hl7.org/fhir/ValueSet/namingsystem-type
 */
public enum NamingSystemType: String, FHIRKitPrimitiveType {
  /// The naming system is used to define concepts and symbols to represent those concepts; e.g. UCUM, LOINC, NDC
  /// code, local lab codes, etc.
  case codesystem
  
  /// The naming system is used to manage identifiers (e.g. license numbers, order numbers, etc.).
  case identifier
  
  /// The naming system is used as the root for other identifiers and naming systems.
  case root
}