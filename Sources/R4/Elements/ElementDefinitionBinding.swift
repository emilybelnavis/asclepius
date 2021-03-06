//
//  ElementDefinitionBinding.swift
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
 ValueSet details if this is coded; Binds to a value set if this element is coded (`code`, `Coding`, `CodeableConcept`,
 `Quantity`), or the data types (`string`, `uri`)
 */
open class ElementDefinitionBinding: Element {
  /// Indicates the degree of conformance expectations associated with this binding (the degree to which the
  /// provided value set must be adhered to in the instances.)
  public var strength: AsclepiusPrimitive<BindingStrength>
  
  /// Human explanation of the value set
  public var fhirDescription: AsclepiusPrimitive<AsclepiusString>?
  
  /// Source of the value set
  public var valueSet: AsclepiusPrimitive<Canonical>?
  
  public init(strength: AsclepiusPrimitive<BindingStrength>) {
    self.strength = strength
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    strength: AsclepiusPrimitive<BindingStrength>,
    fhirDescription: AsclepiusPrimitive<AsclepiusString>? = nil,
    valueSet: AsclepiusPrimitive<Canonical>? = nil
  ) {
    self.init(strength: strength)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.fhirDescription = fhirDescription
    self.valueSet = valueSet
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case strength; case _strength
    case fhirDescription; case _fhirDescription
    case valueSet; case _valueSet
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.strength = try AsclepiusPrimitive<BindingStrength>(from: codingKeyContainer, forKey: .strength, auxKey: ._strength)
    self.fhirDescription = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.valueSet = try AsclepiusPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .valueSet, auxKey: ._valueSet)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try strength.encode(on: &codingKeyContainer, forKey: .strength, auxKey: ._strength)
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try valueSet?.encode(on: &codingKeyContainer, forKey: .valueSet, auxKey: ._valueSet)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ElementDefinitionBinding else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return strength == _other.strength
    && fhirDescription == _other.fhirDescription
    && valueSet == _other.valueSet
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(strength)
    hasher.combine(fhirDescription)
    hasher.combine(valueSet)
  }
}
