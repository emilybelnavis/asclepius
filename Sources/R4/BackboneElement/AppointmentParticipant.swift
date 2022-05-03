//
//  AppointmentParticipant.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

/// List of participants involved in the appointment
open class AppointmentParticipant: BackboneElement {
  /// role of the participant in the appointment
  public var type: [CodableConcept]?
  
  /// person, location/healthcare service, or device
  public var `actor`: Reference?
  
  /// Wheter this participant is required to be present at the meeting. This covers a use-case where two
  /// doctors need to meet to discuss the results for a specific patient, and the patient is not required to be
  /// present
  public var `required`: FHIRKitPrimitive<ParticipantRequired>?
  
  /// Participation status of the actor
  public var status: FHIRKitPrimitive<ParticipationStatus>
  
  /// Participation period of the actor
  public var period: Period?
  
  public init(status: FHIRKitPrimitive<ParticipationStatus>) {
    self.status = status
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: [CodableConcept]? = nil,
    `actor`: Reference? = nil,
    `required`: FHIRKitPrimitive<ParticipantRequired>? = nil,
    status: FHIRKitPrimitive<ParticipationStatus>,
    period: Period? = nil
  ) {
    self.init(status: status)
    self.fhirExtension = fhirExtension
    self.id = id
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
    
    self.type = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .type)
    self.`actor` = try Reference(from: codingKeyContainer, forKeyIfPresent: .actor)
    self.`required` = try FHIRKitPrimitive<ParticipantRequired>(from: codingKeyContainer, forKeyIfPresent: .required, auxKey: ._required)
    self.status = try FHIRKitPrimitive<ParticipationStatus>(from: codingKeyContainer, forKey: .status, auxKey: ._status)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try `actor`?.encode(on: &codingKeyContainer, forKey: .actor)
    try `required`?.encode(on: &codingKeyContainer, forKey: .required, auxKey: ._required)
    try status.encode(on: &codingKeyContainer, forKey: .status, auxKey: ._status)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(`actor`)
    hasher.combine(`required`)
    hasher.combine(status)
    hasher.combine(period)
  }
}
