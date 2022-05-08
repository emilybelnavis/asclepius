//
//  CapabilityStatementMessaging.swift
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

/// A description of the messaging capabilities of the solution
open class CapabilityStatementMessaging: BackboneElement {
  /// Where messages should be sent
  public var endpoint: [CapabilityStatementMessagingEndpoint]?
  
  /// Reliable message cache length (in minutes)
  public var reliableCache: AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>?
  
  /// Messaging interface behaviour details
  public var documentation: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Messages supported by this system
  public var supportedMessage: [CapabilityStatementMessagingSupportMessage]?

  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    endpoint: [CapabilityStatementMessagingEndpoint]? = nil,
    reliableCache: AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>? = nil,
    documentation: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    supportedMessage: [CapabilityStatementMessagingSupportMessage]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.endpoint = endpoint
    self.reliableCache = reliableCache
    self.documentation = documentation
    self.supportedMessage = supportedMessage
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case endpoint
    case reliableCache; case _reliableCache
    case documentation; case _documentation
    case supportedMessage
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.endpoint = try [CapabilityStatementMessagingEndpoint](from: codingKeyContainer, forKeyIfPresent: .endpoint)
    self.reliableCache = try AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>(from: codingKeyContainer, forKeyIfPresent: .reliableCache, auxKey: ._reliableCache)
    self.documentation = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .documentation, auxKey: ._documentation)
    self.supportedMessage = try [CapabilityStatementMessagingSupportMessage](from: codingKeyContainer, forKeyIfPresent: .supportedMessage)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try endpoint?.encode(on: &codingKeyContainer, forKey: .endpoint)
    try reliableCache?.encode(on: &codingKeyContainer, forKey: .reliableCache, auxKey: ._reliableCache)
    try documentation?.encode(on: &codingKeyContainer, forKey: .documentation, auxKey: ._documentation)
    try supportedMessage?.encode(on: &codingKeyContainer, forKey: .supportedMessage)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementMessaging else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return endpoint == _other.endpoint
    && reliableCache == _other.reliableCache
    && documentation == _other.documentation
    && supportedMessage == _other.supportedMessage
  }
  
  // MARK: Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(endpoint)
    hasher.combine(reliableCache)
    hasher.combine(documentation)
    hasher.combine(supportedMessage)
  }
}
