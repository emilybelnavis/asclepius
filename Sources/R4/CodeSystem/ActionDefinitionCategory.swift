//
//  ActionDefinitionCategory.swift
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
 High-level categorization of the type of activity
 
 URL: http://terminology.hl7.org/CodeSystem/activity-definition-category
 ValueSet: http://hl7.or/fhir/ValueSet/activity-definition-category
 */
public enum ActivityDefinitionCategory: String, AsclepiusPrimitiveType {
  /// The activity is intended to provide or is related to treatment of the patient.
  case treatment
  
  /// The activity is intended to provide or is related to education of the patient.
  case education
  
  /// The activity is intended to provide or is related to assessment of the patient.
  case assessment
}
