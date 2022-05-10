//
//  CapabilityStatementDocument.swift
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

/// A document definition
open class CapabilityStatementDocument: BackboneElement {
  /// Mode of this document declaration - whether application is a producer or consumer
  public var mode: AsclepiusPrimitive<DocumentMode>
  
  /// Description of document support
  public var documentation: AsclepiusPrimitive<AsclepiusString>?
  
  /// Constraint on the resources used in the document
  public var profile: AsclepiusPrimitive<Canonical>
  
  public init(mode: AsclepiusPrimitive<DocumentMode>, profile: AsclepiusPrimitive<Canonical>) {
    self.mode = mode
    self.profile = profile
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    mode: AsclepiusPrimitive<DocumentMode>,
    documentation: AsclepiusPrimitive<AsclepiusString>? = nil,
    profile: AsclepiusPrimitive<Canonical>
  ) {
    self.init(mode: mode, profile: profile)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.documentation = documentation
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case mode; case _mode
    case documentation; case _documentation
    case profile; case _profile
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.mode = try AsclepiusPrimitive<DocumentMode>(from: codingKeyContainer, forKey: .mode, auxKey: ._mode)
    self.documentation = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .documentation, auxKey: ._documentation)
    self.profile = try AsclepiusPrimitive<Canonical>(from: codingKeyContainer, forKey: .profile, auxKey: ._profile)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try mode.encode(on: &codingKeyContainer, forKey: .mode, auxKey: ._mode)
    try documentation?.encode(on: &codingKeyContainer, forKey: .documentation, auxKey: ._documentation)
    try profile.encode(on: &codingKeyContainer, forKey: .profile, auxKey: ._profile)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementDocument else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return mode == _other.mode
    && documentation == _other.documentation
    && profile == _other.profile
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(mode)
    hasher.combine(documentation)
    hasher.combine(profile)
  }
}
