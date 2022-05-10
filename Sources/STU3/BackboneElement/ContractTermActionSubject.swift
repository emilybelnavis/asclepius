//
//  ContractTermActionSubject.swift
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

/// Entity of the action
open class ContractTermActionSubject: BackboneElement {
  /// Entity of the action
  public var reference: [Reference]
  
  /// Role type of the agent
  public var role: CodeableConcept?
  
  public init(reference: [Reference]) {
    self.reference = reference
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    reference: [Reference],
    role: CodeableConcept
  ) {
    self.init(reference: reference)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.role = role
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case reference
    case role
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.reference = try [Reference](from: codingKeyContainer, forKey: .reference)
    self.role = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .role)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try reference.encode(on: &codingKeyContainer, forKey: .reference)
    try role?.encode(on: &codingKeyContainer, forKey: .role)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContractTermActionSubject else {
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
