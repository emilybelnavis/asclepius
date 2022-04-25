//
//  AuditEventAgent.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

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
    `extension`: [Extension]? = nil,
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
    self.`extension` = `extension`
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try CodableConcept(from: _container, forKeyIfPresent: .type)
    self.role = try [CodableConcept](from: _container, forKeyIfPresent: .role)
    self.altId = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .altId, auxiliaryKey: ._altId)
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .name, auxiliaryKey: ._name)
    self.requestor = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKey: .requestor, auxiliaryKey: ._requestor)
    self.location = try Reference(from: _container, forKeyIfPresent: .location)
    self.policy = try [FHIRKitPrimitive<FHIRKitURI>](from: _container, forKeyIfPresent: .policy, auxiliaryKey: ._policy)
    self.media = try Coding(from: _container, forKeyIfPresent: .media)
    self.network = try AuditEventAgentNetwork(from: _container, forKeyIfPresent: .network)
    self.purposeOfUse = try [CodableConcept](from: _container, forKeyIfPresent: .purposeOfUse)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try type?.encode(on: &_container, forKey: .type)
    try role?.encode(on: &_container, forKey: .role)
    try altId?.encode(on: &_container, forKey: .altId, auxiliaryKey: ._altId)
    try name?.encode(on: &_container, forKey: .name, auxiliaryKey: ._name)
    try requestor.encode(on: &_container, forKey: .requestor, auxiliaryKey: ._requestor)
    try location?.encode(on: &_container, forKey: .location)
    try policy?.encode(on: &_container, forKey: .policy, auxiliaryKey: ._policy)
    try media?.encode(on: &_container, forKey: .media)
    try network?.encode(on: &_container, forKey: .network)
    try purposeOfUse?.encode(on: &_container, forKey: .purposeOfUse)
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
