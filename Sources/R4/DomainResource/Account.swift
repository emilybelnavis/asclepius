//
//  Account.swift
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
 Tracks balances and charges for a patient or cost centre
 
 A financial tool for tracking value accrued for a particular purpose. In the healthcare field, it is used to track
 charges for a patient, cost centres, etc...
 */
open class Account: DomainResource {
  override open class var resourceType: ResourceType {
    return .account
  }
  
  public var identifier: [Identifier]?
  public var status: FHIRKitPrimitive<AccountStatus>
  public var type: CodableConcept?
  public var name: FHIRKitPrimitive<FHIRKitString>?
  public var subject: [Reference]?
  public var servicePeriod: Period?
  public var coverage: [AccountCoverage]?
  public var owner: Reference?
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  public var guarantor: [AccountGuarantor]?
  public var partOf: Reference?
  
  public init(status: FHIRKitPrimitive<AccountStatus>) {
    self.status = status
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    identifier: [Identifier]? = nil,
    status: FHIRKitPrimitive<AccountStatus>,
    type: CodableConcept? = nil,
    name: FHIRKitPrimitive<FHIRKitString>? = nil,
    subject: [Reference]? = nil,
    servicePeriod: Period? = nil,
    coverage: [AccountCoverage]? = nil,
    owner: Reference? = nil,
    fhirDescription: FHIRKitPrimitive<FHIRKitString>? = nil,
    guarantor: [AccountGuarantor]? = nil,
    partOf: Reference? = nil,
    contained: [ResourceProxy]? = nil,
    implicitRules: FHIRKitPrimitive<FHIRKitURI>? = nil,
    meta: Meta? = nil,
    text: Narrative? = nil
  ) {
    self.init(status: status)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.identifier = identifier
    self.type = type
    self.name = name
    self.subject = subject
    self.servicePeriod = servicePeriod
    self.coverage = coverage
    self.owner = owner
    self.fhirDescription = fhirDescription
    self.guarantor = guarantor
    self.partOf = partOf
    self.contained = contained
    self.implicitRules = implicitRules
    self.meta = meta
    self.text = text
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case identifier
    case status; case _status
    case type
    case name; case _name
    case subject
    case servicePeriod
    case coverage
    case owner
    case fhirDescription = "description"; case _fhirDescription = "_description"
    case guarantor
    case partOf
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.identifier = try [Identifier](from: codingKeyContainer, forKeyIfPresent: .identifier)
    self.status = try FHIRKitPrimitive<AccountStatus>(from: codingKeyContainer, forKey: .status, auxKey: ._status)
    self.type = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .name, auxKey: ._name)
    self.subject = try [Reference](from: codingKeyContainer, forKeyIfPresent: .subject)
    self.servicePeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .servicePeriod)
    self.coverage = try [AccountCoverage](from: codingKeyContainer, forKey: .coverage)
    self.owner = try Reference(from: codingKeyContainer, forKeyIfPresent: .owner)
    self.fhirDescription = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.guarantor = try [AccountGuarantor](from: codingKeyContainer, forKeyIfPresent: .guarantor)
    self.partOf = try Reference(from: codingKeyContainer, forKeyIfPresent: .partOf)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try identifier?.encode(on: &codingKeyContainer, forKey: .identifier)
    try status.encode(on: &codingKeyContainer, forKey: .status, auxKey: ._status)
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try name?.encode(on: &codingKeyContainer, forKey: .name)
    try subject?.encode(on: &codingKeyContainer, forKey: .subject)
    try servicePeriod?.encode(on: &codingKeyContainer, forKey: .servicePeriod)
    try coverage?.encode(on: &codingKeyContainer, forKey: .coverage)
    try owner?.encode(on: &codingKeyContainer, forKey: .owner)
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try guarantor?.encode(on: &codingKeyContainer, forKey: .guarantor)
    try partOf?.encode(on: &codingKeyContainer, forKey: .partOf)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Account else {
      return false
    }
    
    guard _other.isEqual(to: _other) else {
      return false
    }
    
    return identifier == _other.identifier
    && status == _other.status
    && type == _other.type
    && name == _other.name
    && subject == _other.subject
    && servicePeriod == _other.servicePeriod
    && coverage == _other.coverage
    && owner == _other.owner
    && fhirDescription == _other.fhirDescription
    && guarantor == _other.guarantor
    && partOf == _other.partOf
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super .hash(into: &hasher)
    hasher.combine(identifier)
    hasher.combine(status)
    hasher.combine(type)
    hasher.combine(name)
    hasher.combine(subject)
    hasher.combine(servicePeriod)
    hasher.combine(coverage)
    hasher.combine(owner)
    hasher.combine(fhirDescription)
    hasher.combine(guarantor)
    hasher.combine(partOf)
  }
}
