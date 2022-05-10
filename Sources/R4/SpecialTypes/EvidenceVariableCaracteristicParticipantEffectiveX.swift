//
//  EvidenceVariableCharacteristicParticipantEffectiveX.swift
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

open class EvidenceVariableCharacteristicParticipantEffectiveX: Element {
  public var dateTime: AsclepiusPrimitive<AsclepiusDateTime>?
  public var period: Period?
  public var duration: Duration?
  public var timing: Timing?
  
  // MARK: - Class Functions
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    dateTime: AsclepiusPrimitive<AsclepiusDateTime>? = nil,
    period: Period? = nil,
    duration: Duration? = nil,
    timing: Timing? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.dateTime = dateTime
    self.period = period
    self.duration = duration
    self.timing = timing
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case dateTime; case _dateTime
    case period
    case duration
    case timing
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.dateTime = try AsclepiusPrimitive<AsclepiusDateTime>(from: codingKeyContainer, forKeyIfPresent: .dateTime, auxKey: ._dateTime)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    self.duration = try Duration(from: codingKeyContainer, forKeyIfPresent: .duration)
    self.timing = try Timing(from: codingKeyContainer, forKeyIfPresent: .timing)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try dateTime?.encode(on: &codingKeyContainer, forKey: .dateTime, auxKey: ._dateTime)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    try duration?.encode(on: &codingKeyContainer, forKey: .duration)
    try timing?.encode(on: &codingKeyContainer, forKey: .timing)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? EvidenceVariableCharacteristicParticipantEffectiveX else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return dateTime == _other.dateTime
    && period == _other.period
    && duration == _other.duration
    && timing == _other.timing
  }
  
   // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(dateTime)
    hasher.combine(period)
    hasher.combine(duration)
    hasher.combine(timing)
  }
 }
