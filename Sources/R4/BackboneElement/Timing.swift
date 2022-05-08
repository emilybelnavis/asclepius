//
//  Timing.swift
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
 A timing schedule that specifies an event that may occur multiple times.
 
 Specifies an event that may occur multiple times. Timing schedules are used to record when things are
 planned, expected, or requested to occur. The most common usage is in dosage instructions for
 medications. They are also used when planning care of various kinds, and may be used for reporting the
 schedule to which past regular activities were carried out.
 */
open class Timing: BackboneElement {
  /// When the event occurs
  public var event: [AlexandriaHRMPrimitive<AlexandriaHRMDateTime>]?
  
  /// When the event is to occur
  public var timingRepeat: TimingRepeat?
  
  /// BID | TID | QID | AM | PM | QD | QOD | +
  public var code: CodeableConcept?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    event: [AlexandriaHRMPrimitive<AlexandriaHRMDateTime>]? = nil,
    timingRepeat: TimingRepeat? = nil,
    code: CodeableConcept? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.event = event
    self.timingRepeat = timingRepeat
    self.code = code
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case event; case _event
    case timingRepeat = "repeat"
    case code
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.event = try [AlexandriaHRMPrimitive<AlexandriaHRMDateTime>](from: codingKeyContainer, forKeyIfPresent: .event, auxKey: ._event)
    self.timingRepeat = try TimingRepeat(from: codingKeyContainer, forKeyIfPresent: .timingRepeat)
    self.code = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .code)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try event?.encode(on: &codingKeyContainer, forKey: .event, auxKey: ._event)
    try timingRepeat?.encode(on: &codingKeyContainer, forKey: .timingRepeat)
    try code?.encode(on: &codingKeyContainer, forKey: .code)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Timing else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return event == _other.event
    && timingRepeat == _other.timingRepeat
    && code == _other.code
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(event)
    hasher.combine(timingRepeat)
    hasher.combine(code)
  }
}
