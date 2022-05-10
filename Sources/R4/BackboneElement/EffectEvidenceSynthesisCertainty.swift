//
//  EffectEvidenceSynthesisCertainty.swift
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
 How certain is the effect; A description of the certainty of the the effect estimate.
 */
open class EffectEvidenceSynthesisCertainty: BackboneElement {
  /// Certainty rating
  public var rating: [CodeableConcept]?
  
  /// Used for footnotes/explanatory notes
  public var note: [Annotation]?
  
  /// A component that contributes to the overal certainty
  public var certaintySubcomponent: [EffectEvidenceSynthesisCertaintyCertaintySubcomponent]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    rating: [CodeableConcept]? = nil,
    note: [Annotation]? = nil,
    certaintySubcomponent: [EffectEvidenceSynthesisCertaintyCertaintySubcomponent]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.rating = rating
    self.note = note
    self.certaintySubcomponent = certaintySubcomponent
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case rating
    case note
    case certaintySubcomponent
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.rating = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .rating)
    self.note = try [Annotation](from: codingKeyContainer, forKeyIfPresent: .note)
    self.certaintySubcomponent = try [EffectEvidenceSynthesisCertaintyCertaintySubcomponent](from: codingKeyContainer, forKeyIfPresent: .certaintySubcomponent)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try rating?.encode(on: &codingKeyContainer, forKey: .rating)
    try note?.encode(on: &codingKeyContainer, forKey: .note)
    try certaintySubcomponent?.encode(on: &codingKeyContainer, forKey: .certaintySubcomponent)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? EffectEvidenceSynthesisCertainty else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return rating == _other.rating
    && note == _other.note
    && certaintySubcomponent == _other.certaintySubcomponent
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(rating)
    hasher.combine(note)
    hasher.combine(certaintySubcomponent)
  }
}
