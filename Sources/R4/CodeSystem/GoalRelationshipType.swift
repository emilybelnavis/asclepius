//
//  GoalRelationshipType.swift
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
 Types of relationships between two goals.
 
 URL: http://terminology.hl7.org/CodeSystem/goal-relationship-type
 ValueSet: http://hl7.org/fhir/ValueSet/goal-relationship-type
 */
public enum GoalRelationshipType: String, AsclepiusPrimitiveType {
  /// Indicates that the target goal is one which must be met before striving for the current goal.
  case predecessor
  
  /// Indicates that the target goal is a desired objective once the current goal is met.
  case successor
  
  /// Indicates that this goal has been replaced by the target goal.
  case replacement
  
  /// Indicates that the target goal is considered to be a "piece" of attaining this goal.
  case milestone
  
  /// Indicates that the relationship is not covered by one of the pre-defined codes.  (An extension may convey more
  /// information about the meaning of the relationship.).
  case other
}
