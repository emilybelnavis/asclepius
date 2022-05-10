//
//  ConceptMapGroupUnmappedMode.swift
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
 Defines which action to take if there is no match in the group.
 
 URL: http://hl7.org/fhir/conceptmap-unmapped-mode
 ValueSet: http://hl7.org/fhir/ValueSet/conceptmap-unmapped-mode
 */
public enum ConceptMapGroupUnmappedMode: String, AsclepiusPrimitiveType {
  /// Use the code as provided in the `$translate` request
  case provided
  
  /// Use the code explicitly provide in the `group.unmapped`
  case fixed
  
  /// Use the map identified bu the canonical URL in the `url` element
  case otherMap = "other-map"
}
