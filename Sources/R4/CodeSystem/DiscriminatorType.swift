//
//  DiscriminatorType.swift
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
 How an element value is interpreted when discrimination is evaluated.
 
 URL: http://hl7.org/fhir/discriminator-type
 ValueSet: http://hl7.org/fhir/ValueSet/discriminator-type
 */
public enum DiscriminatorType: String, FHIRKitPrimitiveType {
  /// The slices have different values in the nominated element.
  case value
  
  /// The slices are differentiated by the presence or absence of the nominated element.
  case exists
  
  /// The slices have different values in the nominated element, as determined by testing them against the applicable
  /// ElementDefinition.pattern[x].
  case pattern
  
  /// The slices are differentiated by type of the nominated element.
  case type
  
  /// The slices are differentiated by conformance of the nominated element to a specified profile. Note that if the
  /// path specifies .resolve() then the profile is the target profile on the reference. In this case, validation by
  /// the possible profiles is required to differentiate the slices.
  case profile
}