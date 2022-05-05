//
//  FlagPriorityCodes.swift
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
 This value set is provided as an exemplar. The value set is driven by IHE Table B.8-4: Abnormal Flags, Alert Priority.
 
 URL: http://hl7.org/fhir/flag-priority-code
 ValueSet: http://hl7.org/fhir/ValueSet/flag-priority
 */
public enum FlagPriorityCodes: String, FHIRKitPrimitiveType {
  /// No alarm.
  case PN
  
  /// Low priority.
  case PL
  
  /// Medium priority.
  case PM
  
  /// High priority.
  case PH
}
