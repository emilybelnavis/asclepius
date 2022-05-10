//
//  ChargeItemPerformer.swift
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
  Who performed the charged service. Indicates who or what performed or participated in the charged service.
 */
open class ChargeItemPerformer: BackboneElement {
  /// What type of service was done
  public var function: CodeableConcept?
  
  /// Individual who performed the service
  public var actor: Reference
  
  public init(actor: Reference) {
    self.actor = actor
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    function: CodeableConcept? = nil,
    actor: Reference
  ) {
    self.init(actor: actor)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case function
    case actor
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.function = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .function)
    self.actor = try Reference(from: codingKeyContainer, forKey: .actor)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try function?.encode(on: &codingKeyContainer, forKey: .function)
    try actor.encode(on: &codingKeyContainer, forKey: .actor)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ChargeItemPerformer else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return function == _other.function
    && actor == _other.actor
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(function)
    hasher.combine(actor)
  }
}
