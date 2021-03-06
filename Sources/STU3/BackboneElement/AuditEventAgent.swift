//
//  AuditEventAgent.swift
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

import AsclepiusCore

/// An actor taking an active role in the event or activity that is logged
open class AuditEventAgent: BackboneElement {
  /// How agent participated
  public var type: CodeableConcept?
  
  /// Agent role in the event
  public var role: [CodeableConcept]?
  
  /// Identifier of who
  public var who: Reference?
  
  /// Alternative User Identity
  public var altId: AsclepiusPrimitive<AsclepiusString>?
  
  /// Human friendly name for the agent
  public var name: AsclepiusPrimitive<AsclepiusString>?
  
  /// Whether user is requestor
  public var requestor: AsclepiusPrimitive<AsclepiusBool>
  
  /// Where
  public var location: Reference?
  
  /// Policy that authorized event
  public var policy: [AsclepiusPrimitive<AsclepiusURI>]?
  
  /// Type of media
  public var media: Coding?
  
  /// Logical network location for application activity
  public var network: AuditEventAgentNetwork?
  
  /// Reason given for this user
  public var purposeOfUse: [CodeableConcept]?
  
  public init(requestor: AsclepiusPrimitive<AsclepiusBool>) {
    self.requestor = requestor
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    type: CodeableConcept? = nil,
    role: [CodeableConcept]? = nil,
    who: Reference? = nil,
    altId: AsclepiusPrimitive<AsclepiusString>? = nil,
    name: AsclepiusPrimitive<AsclepiusString>? = nil,
    requestor: AsclepiusPrimitive<AsclepiusBool>,
    location: Reference? = nil,
    policy: [AsclepiusPrimitive<AsclepiusURI>]? = nil,
    media: Coding? = nil,
    network: AuditEventAgentNetwork? = nil,
    purposeOfUse: [CodeableConcept]? = nil
  ) {
    self.init(requestor: requestor)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
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
    
    self.type = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.role = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .role)
    self.altId = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .altId, auxKey: ._altId)
    self.name = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .name, auxKey: ._name)
    self.requestor = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKey: .requestor, auxKey: ._requestor)
    self.location = try Reference(from: codingKeyContainer, forKeyIfPresent: .location)
    self.policy = try [AsclepiusPrimitive<AsclepiusURI>](from: codingKeyContainer, forKeyIfPresent: .policy, auxKey: ._policy)
    self.media = try Coding(from: codingKeyContainer, forKeyIfPresent: .media)
    self.network = try AuditEventAgentNetwork(from: codingKeyContainer, forKeyIfPresent: .network)
    self.purposeOfUse = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .purposeOfUse)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
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
  override public func isEqual(to _other: Any?) -> Bool {
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
  override public func hash(into hasher: inout Hasher) {
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
