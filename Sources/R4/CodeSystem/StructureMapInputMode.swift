//
//  StructureMapInputMode.swift
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
 Mode for this instance of data.
 
 URL: http://hl7.org/fhir/map-input-mode
 ValueSet: http://hl7.org/fhir/ValueSet/map-input-mode
 */
public enum StructureMapInputMode: String, AlexandriaHRMPrimitiveType {
  /// Names an input instance used a source for mapping.
  case source
  
  /// Names an instance that is being populated.
  case target
}
