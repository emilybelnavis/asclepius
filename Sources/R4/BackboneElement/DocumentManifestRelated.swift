//
//  DocumentManifestRelated.swift
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

/**
 Related identifiers or resources associated with the `DocumentManifest`
 */
open class DocumentManifestRelated: BackboneElement {
  /// Identifiers of things that are related
  public var identifier: Identifier?
  
  /// Related resource
  public var reference: Reference?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    identifier: Identifier? = nil,
    reference: Reference?
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.identifier = identifier
    self.reference = reference
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case identifier
    case reference
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.identifier = try Identifier(from: codingKeyContainer, forKeyIfPresent: .identifier)
    self.reference = try Reference(from: codingKeyContainer, forKeyIfPresent: .reference)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try identifier?.encode(on: &codingKeyContainer, forKey: .identifier)
    try reference?.encode(on: &codingKeyContainer, forKey: .reference)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DocumentManifestRelated else {
       return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return identifier == _other.identifier
    && reference == _other.reference
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(identifier)
    hasher.combine(reference)
  }
}
