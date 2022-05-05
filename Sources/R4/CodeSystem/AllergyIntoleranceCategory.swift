//
//  AllergyIntoleranceCategory.swift
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
 Category of an identified substance associated with allergies or intolerances.
 
 URL: http://hl7.org/fhir/allergy-intolerance-category
 ValueSet: http://hl7.org/fhir/ValueSet/allergy-intolerance-category
 */
public enum AllergyIntoleranceCategory: String, FHIRKitPrimitiveType {
  /// Any substance comsumed to provide nutritional support for the body
  case food
  
  /// Substances administered to achieve a physiological effect.
  case medication
  
  /// Any substances that are encountered in the environment, including any substance not already
  /// classified as food, medication, or biologic.
  case environment
  
  /// A preparation that is synthesized from living organisms or their products, especially a human or
  /// animal protein, such as a hormone or antitoxin, that is used as a diagnostic preventative, or
  /// theraputic agent. Examples of biologic medications include: vaccines, allergenic extracts, which are
  /// both used for diagnosis and treatment (ex: allergy shots); gene therapiesl cellular therapies. There are
  /// other biologic products such as tissues, whch are not typically associated with allergies.
  case biologic
}
