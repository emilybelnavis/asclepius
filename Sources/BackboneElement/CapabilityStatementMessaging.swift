//
//  CapabilityStatementMessaging.swift
//  FHIRKIT
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

/// A description of the messaging capabilities of the solution
open class CapabilityStatementMessaging: BackboneElement {
  /// Where messages should be sent
  public var endpoint: [CapabilityStatementMessagingEndpoint]?
  
  /// Reliable message cache length (in minutes)
  public var reliableCache: FHIRKitPrimitive<FHIRKitUnsignedInteger>?
  
  /// Messaging interface behaviour details
  public var documentation: FHIRKitPrimitive<FHIRKitString>?
  
  /// Messages supported by this system
  public var supportedMessage: [CapabilityStatementMessagingSupportMessage]?

  override public init() {
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    endpoint: [CapabilityStatementMessagingEndpoint]? = nil,
    reliableCache: FHIRKitPrimitive<FHIRKitUnsignedInteger>? = nil,
    documentation: FHIRKitPrimitive<FHIRKitString>? = nil,
    supportedMessage: [CapabilityStatementMessagingSupportMessage]? = nil
  ) {
    self.init()
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.endpoint = try [CapabilityStatementMessagingEndpoint](from: _container, forKeyIfPresent: .endpoint)
    self.reliableCache = try FHIRKitPrimitive<FHIRKitUnsignedInteger>(from: _container, forKeyIfPresent: .reliableCache, auxiliaryKey: ._reliableCache)
    self.documentation = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .documentation, auxiliaryKey: ._documentation)
    self.supportedMessage = try [CapabilityStatementMessagingSupportMessage](from: _container, forKeyIfPresent: .supportedMessage)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    try endpoint?.encode(on: &_container, forKey: .endpoint)
    try reliableCache?.encode(on: &_container, forKey: .reliableCache, auxiliaryKey: ._reliableCache)
    try documentation?.encode(on: &_container, forKey: .documentation, auxiliaryKey: ._documentation)
    try supportedMessage?.encode(on: &_container, forKey: .supportedMessage)
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
