//
//  CapabilityStatementDocument.swift
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

/// A document definition
open class CapabilityStatementDocument: BackboneElement {
  /// Mode of this document declaration - whether application is a producer or consumer
  public var mode: AlexandriaHRMPrimitive<DocumentMode>
  
  /// Description of document support
  public var documentation: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Constraint on the resources used in the document
  public var profile: AlexandriaHRMPrimitive<Canonical>
  
  public init(mode: AlexandriaHRMPrimitive<DocumentMode>, profile: AlexandriaHRMPrimitive<Canonical>) {
    self.mode = mode
    self.profile = profile
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    mode: AlexandriaHRMPrimitive<DocumentMode>,
    documentation: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    profile: AlexandriaHRMPrimitive<Canonical>
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
    
    self.mode = try AlexandriaHRMPrimitive<DocumentMode>(from: codingKeyContainer, forKey: .mode, auxKey: ._mode)
    self.documentation = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .documentation, auxKey: ._documentation)
    self.profile = try AlexandriaHRMPrimitive<Canonical>(from: codingKeyContainer, forKey: .profile, auxKey: ._profile)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try mode.encode(on: &codingKeyContainer, forKey: .mode, auxKey: ._mode)
    try documentation?.encode(on: &codingKeyContainer, forKey: .documentation, auxKey: ._documentation)
    try profile.encode(on: &codingKeyContainer, forKey: .profile, auxKey: ._profile)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(mode)
    hasher.combine(documentation)
    hasher.combine(profile)
  }
}
