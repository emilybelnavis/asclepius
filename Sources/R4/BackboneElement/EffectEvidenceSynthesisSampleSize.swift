//
//  EffectEvidenceSynthesisSampleSize.swift
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
 What sample size was involved? - A description of the size of the sample involved in the synthesis
 */
open class EffectEvidenceSynthesisSampleSize: BackboneElement {
  /// Description of sample size
  public var fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Number of studies conducted
  public var numberOfStudies: AlexandriaHRMPrimitive<AlexandriaHRMInteger>?
  
  /// Number of participants studied
  public var numberOfParticipants: AlexandriaHRMPrimitive<AlexandriaHRMInteger>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    numberOfStudies: AlexandriaHRMPrimitive<AlexandriaHRMInteger>? = nil,
    numberOfParticipants: AlexandriaHRMPrimitive<AlexandriaHRMInteger>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.fhirDescription = fhirDescription
    self.numberOfStudies = numberOfStudies
    self.numberOfParticipants = numberOfParticipants
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case fhirDescription; case _fhirDescription
    case numberOfStudies; case _numberOfStudies
    case numberOfParticipants; case _numberOfParticipants
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.fhirDescription = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.numberOfStudies = try AlexandriaHRMPrimitive<AlexandriaHRMInteger>(from: codingKeyContainer, forKeyIfPresent: .numberOfStudies, auxKey: ._numberOfStudies)
    self.numberOfParticipants = try AlexandriaHRMPrimitive<AlexandriaHRMInteger>(from: codingKeyContainer, forKeyIfPresent: .numberOfParticipants, auxKey: ._numberOfParticipants)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try numberOfStudies?.encode(on: &codingKeyContainer, forKey: .numberOfStudies, auxKey: ._numberOfStudies)
    try numberOfParticipants?.encode(on: &codingKeyContainer, forKey: .numberOfParticipants, auxKey: ._numberOfParticipants)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? EffectEvidenceSynthesisSampleSize else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return fhirDescription == _other.fhirDescription
    && numberOfStudies == _other.numberOfStudies
    && numberOfParticipants == _other.numberOfParticipants
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(fhirDescription)
    hasher.combine(numberOfStudies)
    hasher.combine(numberOfParticipants)
  }
}
