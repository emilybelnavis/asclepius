//
//  ElementDefinitionBinding.swift
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
 ValueSet details if this is coded; Binds to a value set if this element is coded (`code`, `Coding`, `CodableConcept`,
 `Quantity`), or the data types (`string`, `uri`)
 */
open class ElementDefinitionBinding: Element {
  /// Indicates the degree of conformance expectations associated with this binding (the degree to which the
  /// provided value set must be adhered to in the instances.)
  public var strength: AlexandriaHRMPrimitive<BindingStrength>
  
  /// Human explanation of the value set
  public var fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Source of the value set
  public var valueSet: AlexandriaHRMPrimitive<Canonical>?
  
  public init(strength: AlexandriaHRMPrimitive<BindingStrength>) {
    self.strength = strength
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    strength: AlexandriaHRMPrimitive<BindingStrength>,
    fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    valueSet: AlexandriaHRMPrimitive<Canonical>? = nil
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
    
    self.strength = try AlexandriaHRMPrimitive<BindingStrength>(from: codingKeyContainer, forKey: .strength, auxKey: ._strength)
    self.fhirDescription = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.valueSet = try AlexandriaHRMPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .valueSet, auxKey: ._valueSet)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try strength.encode(on: &codingKeyContainer, forKey: .strength, auxKey: ._strength)
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try valueSet?.encode(on: &codingKeyContainer, forKey: .valueSet, auxKey: ._valueSet)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(strength)
    hasher.combine(fhirDescription)
    hasher.combine(valueSet)
  }
}
