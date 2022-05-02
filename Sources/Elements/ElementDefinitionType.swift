//
//  ElementDefinitionType.swift
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
 The data type or resource that the value of this element is permitted to be
 */
open class ElementDefinitionType: Element {
  /// Data type or Resource (reference to definition)
  public var code: FHIRKitPrimitive<FHIRKitURI>
  
  /// Profiles (StructureDefinition or IG, one must apply)
  public var profile: [FHIRKitPrimitive<Canonical>]?
  
  /// Profile (StructureDefinition or IG, one must apply)
  public var targetProfile: [FHIRKitPrimitive<Canonical>]?
  
  /// If the type is a reference to another resource, how the resource is or can be aggregated. Is it a
  /// contained resource, or a reference, and if the context is a bundle, is it included in the bundle?
  public var aggregation: [FHIRKitPrimitive<AggregationMode>]?
  
  /// Whether this reference needs to be version specific, version independent, or whether either can
  /// be used.
  public var versioning: FHIRKitPrimitive<ReferenceVersionRules>?
  
  public init(code: FHIRKitPrimitive<FHIRKitURI>) {
    self.code = code
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    code: FHIRKitPrimitive<FHIRKitURI>,
    profile: [FHIRKitPrimitive<Canonical>]? = nil,
    targetProfile: [FHIRKitPrimitive<Canonical>]? = nil,
    aggregation: [FHIRKitPrimitive<AggregationMode>]? = nil,
    versioning: FHIRKitPrimitive<ReferenceVersionRules>? = nil
  ) {
    self.init(code: code)
    self.fhirExtension = fhirExtension
    self.id = id
    self.profile = profile
    self.targetProfile = targetProfile
    self.aggregation = aggregation
    self.versioning = versioning
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code; case _code
    case profile; case _profile
    case targetProfile; case _targetProfile
    case aggregation; case _aggregation
    case versioning; case _versioning
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.code = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKey: .code, auxKey: ._code)
    self.profile = try [FHIRKitPrimitive<Canonical>](from: codingKeyContainer, forKeyIfPresent: .profile, auxKey: ._profile)
    self.targetProfile = try [FHIRKitPrimitive<Canonical>](from: codingKeyContainer, forKeyIfPresent: .targetProfile, auxKey: ._targetProfile)
    self.aggregation = try [FHIRKitPrimitive<AggregationMode>](from: codingKeyContainer, forKeyIfPresent: .aggregation, auxKey: ._aggregation)
    self.versioning = try FHIRKitPrimitive<ReferenceVersionRules>(from: codingKeyContainer, forKeyIfPresent: .versioning, auxKey: ._versioning)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try code.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    try profile?.encode(on: &codingKeyContainer, forKey: .profile, auxKey: ._profile)
    try targetProfile?.encode(on: &codingKeyContainer, forKey: .targetProfile, auxKey: ._targetProfile)
    try aggregation?.encode(on: &codingKeyContainer, forKey: .aggregation, auxKey: ._aggregation)
    try versioning?.encode(on: &codingKeyContainer, forKey: .versioning, auxKey: ._versioning)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ElementDefinitionType else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return code == _other.code
    && profile == _other.profile
    && targetProfile == _other.targetProfile
    && aggregation == _other.aggregation
    && versioning == _other.versioning
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(profile)
    hasher.combine(targetProfile)
    hasher.combine(aggregation)
    hasher.combine(versioning)
  }
}
