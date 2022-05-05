//
//  ConsentProvision.swift
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

import FHIRKitCore
/**
 Constraints to the base `Consent.policyRule`.
 
 An exception to the base policy of this consent. An exception can be an addition or removal of access
 permissions
 */
open class ConsentProvision: BackboneElement {
  /// Action to take (permit/deny) when the rule conditions are met. Not permitted in root rule
  /// required in all nested rules.
  public var type: FHIRKitPrimitive<ConsentProvisionType>
  
  /// Timeframe for this rule
  public var period: Period?
  
  /// Who and/or what controlled by this rule (or group, by role)
  public var actor: [ConsentProvisionActor]?
  
  /// Actions controlled by this rule
  public var action: [CodableConcept]?
  
  /// Security lables that define affected resources
  public var securityLabel: [Coding]?
  
  /// Context of activities covered by this rule
  public var purpose: [Coding]?
  
  /// Consent Provision Class (e.g. `ResourceType`, `Profile`, `CDA`, etc...)
  public var provisionClass: [Coding]?
  
  /// e.g. `LOINC` or `SNOMED CT` code, etc, in the content
  public var code: [CodableConcept]?
  
  /// Timeframe for data controlled by this rule
  public var dataPeriod: Period?
  
  /// Data controlled by this rule
  public var data: [ConceptProvisionData]?
  
  /// Nested Exception Rules
  public var provision: [ConsentProvision]?
  
}
