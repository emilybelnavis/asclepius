//
//  EffectEvidenceSynthesisResultsByExposure.swift
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
 What was the result per exposure?; A description of the results for each exposure considered in the effect
 estimate
 */
open class EffectEvidenceSynthesisResultsByExposure: BackboneElement {
  /// Description of results by exposure
  public var fhirDescription: AsclepiusPrimitive<AsclepiusString>
  
  /// Whether these results are for the exposure state or alternative exposure state
  public var exposureState: AsclepiusPrimitive<ExposureState>?
  
  /// Variant exposure states
  public var variantState: CodeableConcept?
  
  /// Risk evidence synthesis
  public var riskEvidenceSynthesis: Reference
  
  public init(fhirDescription: AsclepiusPrimitive<AsclepiusString>, riskEvidenceSynthesis: Reference) {
    self.fhirDescription = fhirDescription
    self.riskEvidenceSynthesis = riskEvidenceSynthesis
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    fhirDescription: AsclepiusPrimitive<AsclepiusString>,
    exposureState: AsclepiusPrimitive<ExposureState>? = nil,
    variantState: CodeableConcept? = nil,
    riskEvidenceSynthesis: Reference
  ) {
    self.init(fhirDescription: fhirDescription, riskEvidenceSynthesis: riskEvidenceSynthesis)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.exposureState = exposureState
    self.variantState = variantState
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case fhirDescription; case _fhirDescription
    case exposureState; case _exposureState
    case variantState
    case riskEvidenceSynthesis
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.fhirDescription = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    self.exposureState = try AsclepiusPrimitive<ExposureState>(from: codingKeyContainer, forKeyIfPresent: .exposureState, auxKey: ._exposureState)
    self.variantState = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .variantState)
    self.riskEvidenceSynthesis = try Reference(from: codingKeyContainer, forKey: .riskEvidenceSynthesis)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try fhirDescription.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try exposureState?.encode(on: &codingKeyContainer, forKey: .exposureState, auxKey: ._exposureState)
    try variantState?.encode(on: &codingKeyContainer, forKey: .variantState)
    try riskEvidenceSynthesis.encode(on: &codingKeyContainer, forKey: .riskEvidenceSynthesis)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? EffectEvidenceSynthesisResultsByExposure else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return fhirDescription == _other.fhirDescription
    && exposureState == _other.exposureState
    && variantState == _other.variantState
    && riskEvidenceSynthesis == _other.riskEvidenceSynthesis
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(fhirDescription)
    hasher.combine(exposureState)
    hasher.combine(variantState)
    hasher.combine(riskEvidenceSynthesis)
  }
}
