//
//  EffectEvidenceSynthesisCertaintyCertaintySubcomponent.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/**
 A description of a component that contributes to the overall certainty
 */
open class EffectEvidenceSynthesisCertaintyCertaintySubcomponent: BackboneElement { // swiftlint:disable:this type_name
  /// Type of subcomponent of certainty rating
  public var type: CodeableConcept?
  
  /// Subcomponent certainty rating
  public var rating: [CodeableConcept]?
  
  /// Used for footnotes/explanatory notes
  public var note: [Annotation]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    type: CodeableConcept? = nil,
    rating: [CodeableConcept]? = nil,
    note: [Annotation]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.type = type
    self.rating = rating
    self.note = note
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type
    case rating
    case note
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.rating = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .rating)
    self.note = try [Annotation](from: codingKeyContainer, forKeyIfPresent: .note)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try rating?.encode(on: &codingKeyContainer, forKey: .rating)
    try note?.encode(on: &codingKeyContainer, forKey: .note)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? EffectEvidenceSynthesisCertaintyCertaintySubcomponent else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && rating == _other.rating
    && note == _other.note
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(rating)
    hasher.combine(note)
  }
}
