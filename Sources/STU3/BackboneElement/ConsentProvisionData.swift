//
//  ConsentProvisionData.swift
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

/// Data controlled by this rule - The resources controlled by this rule if specific resources are referenced
open class ConsentProvisionData: BackboneElement {
  /// How the resource reference is interpreted when testing consent restrictions
  public var meaning: AsclepiusPrimitive<ConsentDataMeaning>
  
  /// The actual data reference
  public var reference: Reference
  
  public init(meaning: AsclepiusPrimitive<ConsentDataMeaning>, reference: Reference) {
    self.meaning = meaning
    self.reference = reference
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    meaning: AsclepiusPrimitive<ConsentDataMeaning>,
    reference: Reference
  ) {
    self.init(meaning: meaning, reference: reference)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case meaning; case _meaning
    case reference
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.meaning = try AsclepiusPrimitive<ConsentDataMeaning>(from: codingKeyContainer, forKey: .meaning, auxKey: ._meaning)
    self.reference = try Reference(from: codingKeyContainer, forKey: .reference)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try meaning.encode(on: &codingKeyContainer, forKey: .meaning, auxKey: ._meaning)
    try reference.encode(on: &codingKeyContainer, forKey: .reference)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ConsentProvisionData else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return meaning == _other.meaning
    && reference == _other.reference
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(meaning)
    hasher.combine(reference)
  }
}
