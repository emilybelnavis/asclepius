//
//  ContractTermOfferParty.swift
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

/// Offer recipient
open class ContractTermOfferParty: BackboneElement {
  /// Referenced entity
  public var reference: [Reference]
  
  /// Participant engagement type
  public var role: CodableConcept
  
  public init(reference: [Reference], role: CodableConcept) {
    self.reference = reference
    self.role = role
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    reference: [Reference],
    role: CodableConcept
  ) {
    self.init(reference: reference, role: role)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case reference
    case role
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.reference = try [Reference](from: codingKeyContainer, forKey: .reference)
    self.role = try CodableConcept(from: codingKeyContainer, forKey: .role)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try reference.encode(on: &codingKeyContainer, forKey: .reference)
    try role.encode(on: &codingKeyContainer, forKey: .role)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContractTermOfferParty else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return reference == _other.reference
    && role == _other.role
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(reference)
    hasher.combine(role)
  }
}
