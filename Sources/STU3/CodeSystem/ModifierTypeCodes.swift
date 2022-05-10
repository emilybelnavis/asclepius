//
//  ModifierTypeCodes.swift
//  Asclepius
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
 This value set includes sample Modifier type codes.
 
 URL: http://terminology.hl7.org/CodeSystem/modifiers
 ValueSet: http://hl7.org/fhir/ValueSet/claim-modifiers
 */
public enum ModifierTypeCodes: String, AsclepiusPrimitiveType {
  /// Repair of prior service or installation.
  case A = "a" // swiftlint:disable:this identifier_name
  
  /// Temporary service or installation.
  case B = "b" // swiftlint:disable:this identifier_name
  
  /// Treatment associated with TMJ.
  case C = "c" // swiftlint:disable:this identifier_name
  
  /// Implant or associated with an implant.
  case E = "e" // swiftlint:disable:this identifier_name
  
  /// A Rush service or service performed outside of normal office hours.
  case rooh
  
  /// None.
  case X = "x" // swiftlint:disable:this identifier_name
}
