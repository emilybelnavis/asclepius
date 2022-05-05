//
//  AuditEventAgent.swift
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

/// An actor taking an active role in the event or activity that is logged
open class AuditEventAgent: BackboneElement {
  /// How agent participated
  public var type: CodableConcept?
  
  /// Agent role in the event
  public var role: [CodableConcept]?
  
  /// Identifier of who
  public var who: Reference?
  
  /// Alternative User Identity
  public var altId: FHIRKitPrimitive<FHIRKitString>?
  
  /// Human friendly name for the agent
  public var name: FHIRKitPrimitive<FHIRKitString>?
  
  /// Whether user is requestor
  public var requestor: FHIRKitPrimitive<FHIRKitBool>
  
  /// Where
  public var location: Reference?
  
  /// Policy that authorized event
  public var policy: [FHIRKitPrimitive<FHIRKitURI>]?
  
  /// Type of media
  public var media: Coding?
  
  /// Logical network location for application activity
  public var network: AuditEventAgentNetwork?
  
  /// Reason given for this user
  public var purposeOfUse: [CodableConcept]?
  
  public init(requestor: FHIRKitPrimitive<FHIRKitBool>) {
    self.requestor = requestor
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: CodableConcept? = nil,
    role: [CodableConcept]? = nil,
    who: Reference? = nil,
    altId: FHIRKitPrimitive<FHIRKitString>? = nil,
    name: FHIRKitPrimitive<FHIRKitString>? = nil,
    requestor: FHIRKitPrimitive<FHIRKitBool>,
    location: Reference? = nil,
    policy: [FHIRKitPrimitive<FHIRKitURI>]? = nil,
    media: Coding? = nil,
    network: AuditEventAgentNetwork? = nil,
    purposeOfUse: [CodableConcept]? = nil
  ) {
    self.init(requestor: requestor)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.type = type
    self.role = role
    self.who = who
    self.altId = altId
    self.name = name
    self.location = location
    self.policy = policy
    self.media = media
    self.network = network
    self.purposeOfUse = purposeOfUse
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type
    case role
    case who
    case altId; case _altId
    case name; case _name
    case requestor; case _requestor
    case location
    case policy; case _policy
    case media
    case network
    case purposeOfUse
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.role = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .role)
    self.altId = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .altId, auxKey: ._altId)
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .name, auxKey: ._name)
    self.requestor = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKey: .requestor, auxKey: ._requestor)
    self.location = try Reference(from: codingKeyContainer, forKeyIfPresent: .location)
    self.policy = try [FHIRKitPrimitive<FHIRKitURI>](from: codingKeyContainer, forKeyIfPresent: .policy, auxKey: ._policy)
    self.media = try Coding(from: codingKeyContainer, forKeyIfPresent: .media)
    self.network = try AuditEventAgentNetwork(from: codingKeyContainer, forKeyIfPresent: .network)
    self.purposeOfUse = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .purposeOfUse)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try role?.encode(on: &codingKeyContainer, forKey: .role)
    try altId?.encode(on: &codingKeyContainer, forKey: .altId, auxKey: ._altId)
    try name?.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try requestor.encode(on: &codingKeyContainer, forKey: .requestor, auxKey: ._requestor)
    try location?.encode(on: &codingKeyContainer, forKey: .location)
    try policy?.encode(on: &codingKeyContainer, forKey: .policy, auxKey: ._policy)
    try media?.encode(on: &codingKeyContainer, forKey: .media)
    try network?.encode(on: &codingKeyContainer, forKey: .network)
    try purposeOfUse?.encode(on: &codingKeyContainer, forKey: .purposeOfUse)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? AuditEventAgent else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && role == _other.role
    && altId == _other.altId
    && name == _other.name
    && requestor == _other.requestor
    && location == _other.location
    && policy == _other.policy
    && media == _other.media
    && network == _other.network
    && purposeOfUse == _other.purposeOfUse
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(role)
    hasher.combine(altId)
    hasher.combine(name)
    hasher.combine(requestor)
    hasher.combine(location)
    hasher.combine(policy)
    hasher.combine(media)
    hasher.combine(network)
    hasher.combine(purposeOfUse)
  }
}
