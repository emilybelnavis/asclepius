//
//  PropertyType.swift
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
 The type of a property value.
 
 URL: http://hl7.org/fhir/concept-property-type
 ValueSet: http://hl7.org/fhir/ValueSet/concept-property-type
 */
public enum PropertyType: String, FHIRKitPrimitiveType {
  /// The property value is a code that identifies a concept defined in the code system.
  case code
  
  /// The property  value is a code defined in an external code system. This may be used for translations, but is not
  /// the intent.
  case coding = "Coding"
  
  /// The property value is a string.
  case string
  
  /// The property value is a string (often used to assign ranking values to concepts for supporting score
  /// assessments).
  case integer
  
  /// The property value is a boolean true | false.
  case boolean
  
  /// The property is a date or a date + time.
  case dateTime

  /// The property value is a decimal number.
  case decimal
}