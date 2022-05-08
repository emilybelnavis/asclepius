//
//  AuditEventAgentNetwork.swift
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

/// Logical network location for application activity, if the activity has a network location that is
open class AuditEventAgentNetwork: BackboneElement {
  /// Identifier for the network access point of the user device
  public var address: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// The type of network access point
  public var type: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    address: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    type: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.address = address
    self.type = type
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case address; case _address
    case type; case _type
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.address = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .address, auxKey: ._address)
    self.type = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .type, auxKey: ._type)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try address?.encode(on: &codingKeyContainer, forKey: .address, auxKey: ._address)
    try type?.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? AuditEventAgentNetwork else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return address == _other.address
      && type == _other.type
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(address)
    hasher.combine(type)
  }
}
