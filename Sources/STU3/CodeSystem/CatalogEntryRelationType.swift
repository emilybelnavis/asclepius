//
//  CatalogEntryRelationType.swift
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
 The type of relations between entries.
 
 URL: http://hl7.org/fhir/relation-type
 ValueSet: http://hl7.org/fhir/ValueSet/relation-type
 */
public enum CatalogEntryRelationType: String, AsclepiusPrimitiveType {
  /// The related entry represents an activity that may be triggered by the current item
  case triggers
  
  /// The related entry represents an item that replaces the current retired ite,
  case isReplacedBy = "is-replaced-by"
}
