//
//  CareTeamParticipant.swift
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
 Identifies all people and organizations who are expected to be involved in the care team
 */
open class CareTeamParticipant: BackboneElement {
  /// Type of involvement
  public var role: [CodeableConcept]?
  
  /// Who is involved
  public var member: Reference?
  
  /// Organization of the practitioner
  public var onBehalfOf: Reference?
  
  /// Time period of the participant
  public var period: Period?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    role: [CodeableConcept]? = nil,
    member: Reference? = nil,
    onBehalfOf: Reference? = nil,
    period: Period?
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.role = role
    self.member = member
    self.onBehalfOf = onBehalfOf
    self.period = period
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case role
    case member
    case onBehalfOf
    case period
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.role = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .role)
    self.member = try Reference(from: codingKeyContainer, forKeyIfPresent: .member)
    self.onBehalfOf = try Reference(from: codingKeyContainer, forKeyIfPresent: .onBehalfOf)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try role?.encode(on: &codingKeyContainer, forKey: .role)
    try member?.encode(on: &codingKeyContainer, forKey: .member)
    try onBehalfOf?.encode(on: &codingKeyContainer, forKey: .onBehalfOf)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CareTeamParticipant else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return role == _other.role
    && member == _other.member
    && onBehalfOf == _other.onBehalfOf
    && period == _other.period
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(role)
    hasher.combine(member)
    hasher.combine(onBehalfOf)
    hasher.combine(period)
  }
}
