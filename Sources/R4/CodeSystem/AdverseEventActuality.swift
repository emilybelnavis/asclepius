//
//  AdverseEventActuality.swift
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
 Overall nature of the adverse event, e.g. real or potential.
 
 URL: http://hl7.org/fhir/adverse-event-actuality
 ValueSet: http://hl7.org/fhir/ValueSet/adverse-event-actuality
 */
public enum AdverseEventActuality: String, AsclepiusPrimitiveType {
  /// The adverse event actually happened regardless of whether anyone was affected/harmed
  case actual
  
  /// A potential adverse event
  case potential
}
