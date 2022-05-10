//
//  CapabilityStatementMessaging.swift
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

/// A description of the messaging capabilities of the solution
open class CapabilityStatementMessaging: BackboneElement {
  /// Where messages should be sent
  public var endpoint: [CapabilityStatementMessagingEndpoint]?
  
  /// Reliable message cache length (in minutes)
  public var reliableCache: AsclepiusPrimitive<AsclepiusUnsignedInteger>?
  
  /// Messaging interface behaviour details
  public var documentation: AsclepiusPrimitive<AsclepiusString>?
  
  /// Messages supported by this system
  public var supportedMessage: [CapabilityStatementMessagingSupportMessage]?

  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    endpoint: [CapabilityStatementMessagingEndpoint]? = nil,
    reliableCache: AsclepiusPrimitive<AsclepiusUnsignedInteger>? = nil,
    documentation: AsclepiusPrimitive<AsclepiusString>? = nil,
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
    self.reliableCache = try AsclepiusPrimitive<AsclepiusUnsignedInteger>(from: codingKeyContainer, forKeyIfPresent: .reliableCache, auxKey: ._reliableCache)
    self.documentation = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .documentation, auxKey: ._documentation)
    self.supportedMessage = try [CapabilityStatementMessagingSupportMessage](from: codingKeyContainer, forKeyIfPresent: .supportedMessage)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try endpoint?.encode(on: &codingKeyContainer, forKey: .endpoint)
    try reliableCache?.encode(on: &codingKeyContainer, forKey: .reliableCache, auxKey: ._reliableCache)
    try documentation?.encode(on: &codingKeyContainer, forKey: .documentation, auxKey: ._documentation)
    try supportedMessage?.encode(on: &codingKeyContainer, forKey: .supportedMessage)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
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
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(endpoint)
    hasher.combine(reliableCache)
    hasher.combine(documentation)
    hasher.combine(supportedMessage)
  }
}
