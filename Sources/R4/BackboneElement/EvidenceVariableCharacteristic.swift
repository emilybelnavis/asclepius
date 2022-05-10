//
//  EvidenceVariableCharacteristic.swift
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

import AsclepiusCore

/// What defines the members of the evidence element; A characteristic that defines the members of the
/// evidence element. Multiple characteristics are applied with "and" semantics
open class EvidenceVariableCharacteristic: BackboneElement {
  /// Natural language description of the characteristic
  public var fhirDescription: AsclepiusPrimitive<AsclepiusString>?
  
  //// What code or expression defines members?
  public var definition: EvidenceVariableCharacteristicDefinitionX
  
  /// What code/value pairs define members?
  public var usageContext: [UsageContext]?
  
  /// Whether the characteristic includes/excludes members
  public var exclude: AsclepiusPrimitive<AsclepiusBool>?
  
  /// What time period do the participants cover
  public var participantEffective: EvidenceVariableCharacteristicParticipantEffectiveX?
  
  /// Observation time from study start
  public var timeFromStart: Duration?
  
  /// Indicates how elements are aggregated within the study effective period
  public var groupMeasure: AsclepiusPrimitive<GroupMeasure>?
  
  // MARK: - Class Functions
}
