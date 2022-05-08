//
//  ConsentProvisionActor.swift
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
 Who and/or what is controlled by this rule. Use group to identify a set of actors by some property that
 they share (e.g. `admitting officers`)
 */
open class ConsentProvisionActor: BackboneElement {
  /// How the actor is involved
  public var role: CodeableConcept
  
  /// Resource for the actor (or group, by role)
  public var reference: Reference
  
  public init(role: CodeableConcept, reference: Reference) {
    self.role = role
    self.reference = reference
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    role: CodeableConcept,
    reference: Reference
  ) {
    self.init(role: role, reference: reference)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case role
    case reference
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.role = try CodeableConcept(from: codingKeyContainer, forKey: .role)
    self.reference = try Reference(from: codingKeyContainer, forKey: .reference)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try role.encode(on: &codingKeyContainer, forKey: .role)
    try reference.encode(on: &codingKeyContainer, forKey: .reference)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ConsentProvisionActor else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return role == _other.role
    && reference == _other.reference
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(role)
    hasher.combine(reference)
  }
}
