//
//  Meta.swift
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

/**
 The metadata about a resource. This is content in the resource that is maintained by the infrastructure.
 Chages to the content might not always be associated with version changes to the resource.
 */
open class Meta: Element {
  /// Version specific identifier
  public var versionId: AsclepiusPrimitive<AsclepiusString>?
  
  /// When the resource version last changed
  public var lastUpdated: AsclepiusPrimitive<AsclepiusInstant>?
  
  /// Identifies where the resource comes from
  public var source: AsclepiusPrimitive<AsclepiusURI>?
  
  /// Profiles this resource claims to conform to
  public var profile: [AsclepiusPrimitive<Canonical>]?
  
  /// Security labels applied to this resource
  public var security: [Coding]?
  
  /// Tags applied to this resource
  public var tag: [Coding]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    versionId: AsclepiusPrimitive<AsclepiusString>? = nil,
    lastUpdated: AsclepiusPrimitive<AsclepiusInstant>? = nil,
    source: AsclepiusPrimitive<AsclepiusURI>? = nil,
    profile: [AsclepiusPrimitive<Canonical>]? = nil,
    security: [Coding]? = nil,
    tag: [Coding]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.versionId = versionId
    self.lastUpdated = lastUpdated
    self.source = source
    self.profile = profile
    self.security = security
    self.tag = tag
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case versionId; case _versionId
    case lastUpdated; case _lastUpdated
    case source; case _source
    case profile; case _profile
    case security
    case tag
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.versionId = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .versionId, auxKey: ._versionId)
    self.lastUpdated = try AsclepiusPrimitive<AsclepiusInstant>(from: codingKeyContainer, forKeyIfPresent: .lastUpdated, auxKey: ._lastUpdated)
    self.source = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .source, auxKey: ._source)
    self.profile = try [AsclepiusPrimitive<Canonical>](from: codingKeyContainer, forKeyIfPresent: .profile, auxKey: ._profile)
    self.security = try [Coding](from: codingKeyContainer, forKeyIfPresent: .security)
    self.tag = try [Coding](from: codingKeyContainer, forKeyIfPresent: .tag)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try versionId?.encode(on: &codingKeyContainer, forKey: .versionId, auxKey: ._versionId)
    try lastUpdated?.encode(on: &codingKeyContainer, forKey: .lastUpdated, auxKey: ._lastUpdated)
    try source?.encode(on: &codingKeyContainer, forKey: .source, auxKey: ._source)
    try profile?.encode(on: &codingKeyContainer, forKey: .profile, auxKey: ._profile)
    try security?.encode(on: &codingKeyContainer, forKey: .security)
    try tag?.encode(on: &codingKeyContainer, forKey: .tag)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Meta else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return versionId == _other.versionId
    && lastUpdated == _other.lastUpdated
    && source == _other.source
    && profile == _other.profile
    && security == _other.security
    && tag == _other.tag
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(versionId)
    hasher.combine(lastUpdated)
    hasher.combine(source)
    hasher.combine(profile)
    hasher.combine(security)
    hasher.combine(tag)
  }
}
