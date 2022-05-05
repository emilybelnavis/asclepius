//
//  ConditionState.swift
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
 Enumeration indicating whether the condition is currently active, inactive, or has been resolved.
 
 URL: http://terminology.hl7.org/CodeSystem/condition-state
 ValueSet: http://hl7.org/fhir/ValueSet/condition-state
 */
public enum ConditionState: String, FHIRKitPrimitiveType {
  /// The condition is active
  case active
  
  /// The condition is inactive, but not resolved
  case inactive
  
  /// The condition is resolved
  case resolved
}
