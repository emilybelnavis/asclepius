//
//  ConsentPolicy.swift
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

/// Policies covered by this consent - The references to the policies that are included in this consent scope.
/// Policies may be organizational, but are often defined jurisdicionally or by law
open class ConsentPolicy: BackboneElement {
  /// Enforcement source for policy
  public var authority: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Specific policy covered by this consent
  public var uri: FHIRKitPrimitive<FHIRKitURI>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    authority: FHIRKitPrimitive<FHIRKitURI>? = nil,
    uri: FHIRKitPrimitive<FHIRKitURI>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.authority = authority
    self.uri = uri
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case authority; case _authority
    case uri; case _uri
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.authority = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .authority, auxKey: ._authority)
    self.uri = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .uri, auxKey: ._uri)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try authority?.encode(on: &codingKeyContainer, forKey: .authority, auxKey: ._authority)
    try uri?.encode(on: &codingKeyContainer, forKey: .uri, auxKey: ._authority)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ConsentPolicy else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return authority == _other.authority
    && uri == _other.uri
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(authority)
    hasher.combine(uri)
  }
}
