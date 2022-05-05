//
//  CompartmentType.swift
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
 Which type a compartment definition describes.
 
 URL: http://hl7.org/fhir/compartment-type
 ValueSet: http://hl7.org/fhir/ValueSet/compartment-type
 */
public enum CompartmentType: String, FHIRKitPrimitiveType {
  /// The compartment definition is for the patient compartment
  case patient = "Patient"
  
  /// The compartment definition is for the encounter compartment
  case encounter = "Encounter"
  
  /// The compartment definition is for the related-person compartment
  case relatedPerson = "RelatedPerson"
  
  /// The compartment definition is for the practitioner comparment
  case practitioner = "Practitioner"
  
  /// The compartment definition is for the device compartment
  case device = "Device"
}
