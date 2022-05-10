//
//  ElementDefinitionType.swift
//  Asclepius
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

import AsclepiusCore

/**
 The data type or resource that the value of this element is permitted to be
 */
open class ElementDefinitionType: Element {
  /// Data type or Resource (reference to definition)
  public var code: AsclepiusPrimitive<AsclepiusURI>
  
  /// Profiles (StructureDefinition or IG, one must apply)
  public var profile: [AsclepiusPrimitive<Canonical>]?
  
  /// Profile (StructureDefinition or IG, one must apply)
  public var targetProfile: [AsclepiusPrimitive<Canonical>]?
  
  /// If the type is a reference to another resource, how the resource is or can be aggregated. Is it a
  /// contained resource, or a reference, and if the context is a bundle, is it included in the bundle?
  public var aggregation: [AsclepiusPrimitive<AggregationMode>]?
  
  /// Whether this reference needs to be version specific, version independent, or whether either can
  /// be used.
  public var versioning: AsclepiusPrimitive<ReferenceVersionRules>?
  
  public init(code: AsclepiusPrimitive<AsclepiusURI>) {
    self.code = code
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    code: AsclepiusPrimitive<AsclepiusURI>,
    profile: [AsclepiusPrimitive<Canonical>]? = nil,
    targetProfile: [AsclepiusPrimitive<Canonical>]? = nil,
    aggregation: [AsclepiusPrimitive<AggregationMode>]? = nil,
    versioning: AsclepiusPrimitive<ReferenceVersionRules>? = nil
  ) {
    self.init(code: code)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
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
    
    self.code = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKey: .code, auxKey: ._code)
    self.profile = try [AsclepiusPrimitive<Canonical>](from: codingKeyContainer, forKeyIfPresent: .profile, auxKey: ._profile)
    self.targetProfile = try [AsclepiusPrimitive<Canonical>](from: codingKeyContainer, forKeyIfPresent: .targetProfile, auxKey: ._targetProfile)
    self.aggregation = try [AsclepiusPrimitive<AggregationMode>](from: codingKeyContainer, forKeyIfPresent: .aggregation, auxKey: ._aggregation)
    self.versioning = try AsclepiusPrimitive<ReferenceVersionRules>(from: codingKeyContainer, forKeyIfPresent: .versioning, auxKey: ._versioning)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try code.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    try profile?.encode(on: &codingKeyContainer, forKey: .profile, auxKey: ._profile)
    try targetProfile?.encode(on: &codingKeyContainer, forKey: .targetProfile, auxKey: ._targetProfile)
    try aggregation?.encode(on: &codingKeyContainer, forKey: .aggregation, auxKey: ._aggregation)
    try versioning?.encode(on: &codingKeyContainer, forKey: .versioning, auxKey: ._versioning)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
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
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(profile)
    hasher.combine(targetProfile)
    hasher.combine(aggregation)
    hasher.combine(versioning)
  }
}
