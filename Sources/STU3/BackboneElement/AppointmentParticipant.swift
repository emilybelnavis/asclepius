//
//  AppointmentParticipant.swift
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

/// List of participants involved in the appointment
open class AppointmentParticipant: BackboneElement {
  /// role of the participant in the appointment
  public var type: [CodeableConcept]?
  
  /// person, location/healthcare service, or device
  public var `actor`: Reference?
  
  /// Wheter this participant is required to be present at the meeting. This covers a use-case where two
  /// doctors need to meet to discuss the results for a specific patient, and the patient is not required to be
  /// present
  public var `required`: AsclepiusPrimitive<ParticipantRequired>?
  
  /// Participation status of the actor
  public var status: AsclepiusPrimitive<ParticipationStatus>
  
  /// Participation period of the actor
  public var period: Period?
  
  public init(status: AsclepiusPrimitive<ParticipationStatus>) {
    self.status = status
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    type: [CodeableConcept]? = nil,
    `actor`: Reference? = nil,
    `required`: AsclepiusPrimitive<ParticipantRequired>? = nil,
    status: AsclepiusPrimitive<ParticipationStatus>,
    period: Period? = nil
  ) {
    self.init(status: status)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.type = type
    self.`actor` = `actor`
    self.`required` = `required`
    self.period = period
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type
    case actor
    case required; case _required
    case status; case _status
    case period
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .type)
    self.`actor` = try Reference(from: codingKeyContainer, forKeyIfPresent: .actor)
    self.`required` = try AsclepiusPrimitive<ParticipantRequired>(from: codingKeyContainer, forKeyIfPresent: .required, auxKey: ._required)
    self.status = try AsclepiusPrimitive<ParticipationStatus>(from: codingKeyContainer, forKey: .status, auxKey: ._status)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try `actor`?.encode(on: &codingKeyContainer, forKey: .actor)
    try `required`?.encode(on: &codingKeyContainer, forKey: .required, auxKey: ._required)
    try status.encode(on: &codingKeyContainer, forKey: .status, auxKey: ._status)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? AppointmentParticipant else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && `actor` == _other.`actor`
    && `required` == _other.`required`
    && status == _other.status
    && period == _other.period
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(`actor`)
    hasher.combine(`required`)
    hasher.combine(status)
    hasher.combine(period)
  }
}
