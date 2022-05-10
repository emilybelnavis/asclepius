//
//  ClaimRelated.swift
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
 Prior or corollary claims. Other claims which are related to this claim such as prior submissions or claims for
 related services or for the same event.
 */
open class ClaimRelated: BackboneElement {
  /// Reference to the related claim
  public var claim: Reference?
  
  /// How the reference claim is related
  public var relationship: CodeableConcept?
  
  /// File or case reference
  public var reference: Identifier?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    claim: Reference? = nil,
    relationship: CodeableConcept? = nil,
    reference: Identifier? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.claim = claim
    self.relationship = relationship
    self.reference = reference
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case claim
    case relationship
    case reference
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.claim = try Reference(from: codingKeyContainer, forKeyIfPresent: .claim)
    self.relationship = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .relationship)
    self.reference = try Identifier(from: codingKeyContainer, forKeyIfPresent: .reference)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try claim?.encode(on: &codingKeyContainer, forKey: .claim)
    try relationship?.encode(on: &codingKeyContainer, forKey: .relationship)
    try reference?.encode(on: &codingKeyContainer, forKey: .reference)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimRelated else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return claim == _other.claim
    && relationship == _other.claim
    && reference == _other.reference
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(claim)
    hasher.combine(relationship)
    hasher.combine(reference)
  }
}
