//
//  ConsentProvision.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore
/**
 Constraints to the base `Consent.policyRule`.
 
 An exception to the base policy of this consent. An exception can be an addition or removal of access
 permissions
 */
open class ConsentProvision: BackboneElement {
  /// Action to take (permit/deny) when the rule conditions are met. Not permitted in root rule
  /// required in all nested rules.
  public var type: AlexandriaHRMPrimitive<ConsentProvisionType>
  
  /// Timeframe for this rule
  public var period: Period?
  
  /// Who and/or what controlled by this rule (or group, by role)
  public var actor: [ConsentProvisionActor]?
  
  /// Actions controlled by this rule
  public var action: [CodeableConcept]?
  
  /// Security lables that define affected resources
  public var securityLabel: [Coding]?
  
  /// Context of activities covered by this rule
  public var purpose: [Coding]?
  
  /// Consent Provision Class (e.g. `ResourceType`, `Profile`, `CDA`, etc...)
  public var provisionClass: [Coding]?
  
  /// e.g. `LOINC` or `SNOMED CT` code, etc, in the content
  public var code: [CodeableConcept]?
  
  /// Timeframe for data controlled by this rule
  public var dataPeriod: Period?
  
  /// Data controlled by this rule
  public var data: [ConsentProvisionData]?
  
  /// Nested Exception Rules
  public var provision: [ConsentProvision]?
  
  public init(type: AlexandriaHRMPrimitive<ConsentProvisionType>) {
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    type: AlexandriaHRMPrimitive<ConsentProvisionType>,
    period: Period? = nil,
    actor: [ConsentProvisionActor]? = nil,
    securityLabel: [Coding]? = nil,
    purpose: [Coding]? = nil,
    provisionClass: [Coding]? = nil,
    code: [CodeableConcept]? = nil,
    dataPeriod: Period? = nil,
    data: [ConsentProvisionData]? = nil,
    provision: [ConsentProvision]? = nil
  ) {
    self.init(type: type)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.period = period
    self.actor = actor
    self.securityLabel = securityLabel
    self.purpose = purpose
    self.provisionClass = provisionClass
    self.code = code
    self.dataPeriod = dataPeriod
    self.data = data
    self.provision = provision
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type; case _type
    case period
    case actor
    case securityLabel
    case purpose
    case provisionClass
    case code
    case dataPeriod
    case data
    case provision
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try AlexandriaHRMPrimitive<ConsentProvisionType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    self.actor = try [ConsentProvisionActor](from: codingKeyContainer, forKeyIfPresent: .actor)
    self.securityLabel = try [Coding](from: codingKeyContainer, forKeyIfPresent: .securityLabel)
    self.purpose = try [Coding](from: codingKeyContainer, forKeyIfPresent: .purpose)
    self.provisionClass = try [Coding](from: codingKeyContainer, forKeyIfPresent: .provisionClass)
    self.code = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .code)
    self.dataPeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .dataPeriod)
    self.data = try [ConsentProvisionData](from: codingKeyContainer, forKeyIfPresent: .data)
    self.provision = try [ConsentProvision](from: codingKeyContainer, forKeyIfPresent: .provision)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    try actor?.encode(on: &codingKeyContainer, forKey: .actor)
    try securityLabel?.encode(on: &codingKeyContainer, forKey: .securityLabel)
    try purpose?.encode(on: &codingKeyContainer, forKey: .purpose)
    try provisionClass?.encode(on: &codingKeyContainer, forKey: .provisionClass)
    try code?.encode(on: &codingKeyContainer, forKey: .code)
    try dataPeriod?.encode(on: &codingKeyContainer, forKey: .dataPeriod)
    try data?.encode(on: &codingKeyContainer, forKey: .data)
    try provision?.encode(on: &codingKeyContainer, forKey: .provision)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ConsentProvision else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && period == _other.period
    && actor == _other.actor
    && securityLabel == _other.securityLabel
    && purpose == _other.purpose
    && provisionClass == _other.provisionClass
    && code == _other.code
    && dataPeriod == _other.dataPeriod
    && data == _other.data
    && provision == _other.provision
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(period)
    hasher.combine(actor)
    hasher.combine(securityLabel)
    hasher.combine(purpose)
    hasher.combine(provisionClass)
    hasher.combine(code)
    hasher.combine(dataPeriod)
    hasher.combine(data)
    hasher.combine(provision)
  }
}
