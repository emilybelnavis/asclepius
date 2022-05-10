//
//  EffectEvidenceSynthesisEffectEstimate.swift
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
 The estimated effect of the exposure variant
 */
open class EffectEvidenceSynthesisEffectEstimate: BackboneElement {
  /// Description of effect estimate
  public var fhirDescription: AsclepiusPrimitive<AsclepiusString>?
  
  /// Type of effect estimate
  public var type: CodeableConcept?
  
  /// Variant exposure states
  public var variantState: CodeableConcept?
  
  /// Point estimate
  public var value: AsclepiusPrimitive<AsclepiusDecimal>?
  
  /// What unit is the outcome described in
  public var unitOfMeasure: CodeableConcept?
  
  /// How precise the esitmate is
  public var precisionEstimate: [EffectEvidenceSynthesisEffectEstimatePrecisionEstimate]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    fhirDescription: AsclepiusPrimitive<AsclepiusString>? = nil,
    type: CodeableConcept? = nil,
    variantState: CodeableConcept? = nil,
    value: AsclepiusPrimitive<AsclepiusDecimal>? = nil,
    unitOfMeasure: CodeableConcept? = nil,
    precisionEstimate: [EffectEvidenceSynthesisEffectEstimatePrecisionEstimate]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.fhirDescription = fhirDescription
    self.type = type
    self.variantState = variantState
    self.value = value
    self.unitOfMeasure = unitOfMeasure
    self.precisionEstimate = precisionEstimate
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case fhirDescription; case _fhirDescription
    case type
    case variantState
    case value; case _value
    case unitOfMeasure
    case precisionEstimate
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.fhirDescription = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.type = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.variantState = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .variantState)
    self.value = try AsclepiusPrimitive<AsclepiusDecimal>(from: codingKeyContainer, forKeyIfPresent: .value, auxKey: ._value)
    self.unitOfMeasure = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .unitOfMeasure)
    self.precisionEstimate = try [EffectEvidenceSynthesisEffectEstimatePrecisionEstimate](from: codingKeyContainer, forKeyIfPresent: .precisionEstimate)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try variantState?.encode(on: &codingKeyContainer, forKey: .variantState)
    try value?.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    try unitOfMeasure?.encode(on: &codingKeyContainer, forKey: .unitOfMeasure)
    try precisionEstimate?.encode(on: &codingKeyContainer, forKey: .precisionEstimate)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? EffectEvidenceSynthesisEffectEstimate else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return fhirDescription == _other.fhirDescription
    && type == _other.type
    && variantState == _other.variantState
    && value == _other.value
    && unitOfMeasure == _other.unitOfMeasure
    && precisionEstimate == _other.precisionEstimate
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(fhirDescription)
    hasher.combine(type)
    hasher.combine(variantState)
    hasher.combine(value)
    hasher.combine(unitOfMeasure)
    hasher.combine(precisionEstimate)
  }
}
