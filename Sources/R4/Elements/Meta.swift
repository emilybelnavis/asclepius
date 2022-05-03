//
//  Meta.swift
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

/**
 The metadata about a resource. This is content in the resource that is maintained by the infrastructure.
 Chages to the content might not always be associated with version changes to the resource.
 */
open class Meta: Element {
  /// Version specific identifier
  public var versionId: FHIRKitPrimitive<FHIRKitString>?
  
  /// When the resource version last changed
  public var lastUpdated: FHIRKitPrimitive<FHIRKitInstant>?
  
  /// Identifies where the resource comes from
  public var source: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Profiles this resource claims to conform to
  public var profile: [FHIRKitPrimitive<Canonical>]?
  
  /// Security labels applied to this resource
  public var security: [Coding]?
  
  /// Tags applied to this resource
  public var tag: [Coding]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    versionId: FHIRKitPrimitive<FHIRKitString>? = nil,
    lastUpdated: FHIRKitPrimitive<FHIRKitInstant>? = nil,
    source: FHIRKitPrimitive<FHIRKitURI>? = nil,
    profile: [FHIRKitPrimitive<Canonical>]? = nil,
    security: [Coding]? = nil,
    tag: [Coding]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
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
    
    self.versionId = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .versionId, auxKey: ._versionId)
    self.lastUpdated = try FHIRKitPrimitive<FHIRKitInstant>(from: codingKeyContainer, forKeyIfPresent: .lastUpdated, auxKey: ._lastUpdated)
    self.source = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .source, auxKey: ._source)
    self.profile = try [FHIRKitPrimitive<Canonical>](from: codingKeyContainer, forKeyIfPresent: .profile, auxKey: ._profile)
    self.security = try [Coding](from: codingKeyContainer, forKeyIfPresent: .security)
    self.tag = try [Coding](from: codingKeyContainer, forKeyIfPresent: .tag)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
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
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(versionId)
    hasher.combine(lastUpdated)
    hasher.combine(source)
    hasher.combine(profile)
    hasher.combine(security)
    hasher.combine(tag)
  }
}
