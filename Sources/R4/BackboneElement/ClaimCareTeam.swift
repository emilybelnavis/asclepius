//
//  ClaimCareTeam.swift
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
 Members of the care team - the members of the team that provided the products and services
 */
open class ClaimCareTeam: BackboneElement {
  /// Order of care team
  public var sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>
  
  /// Practitioner or organization
  public var provider: Reference
  
  /// Indicator of the lead practitioner
  public var responsible: AsclepiusPrimitive<AsclepiusBool>?
  
  /// Function within the team
  public var role: CodeableConcept?
  
  /// Practitioner credential or specialization
  public var qualification: CodeableConcept?
  
  public init(sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>, provider: Reference) {
    self.sequence = sequence
    self.provider = provider
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>,
    provider: Reference,
    responsible: AsclepiusPrimitive<AsclepiusBool>? = nil,
    role: CodeableConcept? = nil,
    qualification: CodeableConcept? = nil
  ) {
    self.init(sequence: sequence, provider: provider)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.responsible = responsible
    self.qualification = qualification
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case provider
    case responsible; case _responsible
    case role
    case qualification
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.sequence = try AsclepiusPrimitive<AsclepiusPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.provider = try Reference(from: codingKeyContainer, forKey: .provider)
    self.responsible = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .responsible, auxKey: ._responsible)
    self.role = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .role)
    self.qualification = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .qualification)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try sequence.encode(on: &codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    try provider.encode(on: &codingKeyContainer, forKey: .provider)
    try responsible?.encode(on: &codingKeyContainer, forKey: .responsible, auxKey: ._responsible)
    try role?.encode(on: &codingKeyContainer, forKey: .role)
    try qualification?.encode(on: &codingKeyContainer, forKey: .qualification)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimCareTeam else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return sequence == _other.sequence
    && provider == _other.provider
    && responsible == _other.responsible
    && role == _other.role
    && qualification == _other.qualification
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(provider)
    hasher.combine(responsible)
    hasher.combine(role)
    hasher.combine(qualification)
  }
}
