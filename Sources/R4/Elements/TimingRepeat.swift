//
//  TimingRepeat.swift
//  FHIRKit
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

import FHIRKitCore

/// A set of rules that describe when the event is scheduled.
open class TimingRepeat: Element {
  /// All possible types for bounds
  public enum BoundsX: Hashable {
    case duration(Duration)
    case period(Period)
    case range(Range)
  }
  
  /// length/range of lengths, or start and/or end limits
  public var boundsX: BoundsX?
  
  /// number of times to repeat
  public var count: FHIRKitPrimitive<FHIRKitPositiveInteger>?
  
  /// max number of repeats
  public var countMax: FHIRKitPrimitive<FHIRKitPositiveInteger>?
  
  /// how long when it happens
  public var duration: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// how long when it happens (max)
  public var durationMax: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// unit of time
  public var durationUnit: FHIRKitPrimitive<FHIRKitString>?
  
  /// how many times per repeat period
  public var frequency: FHIRKitPrimitive<FHIRKitPositiveInteger>?
  
  /// how many times per repeat period (max)
  public var frequencyMax: FHIRKitPrimitive<FHIRKitPositiveInteger>?
  
  /// event frequency times per period
  public var period: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// upper limit of period (e.g. 1-2 hours)
  public var periodMax: FHIRKitPrimitive<FHIRKitDecimal>?
  
  ///  unit of time
  public var periodUnit: FHIRKitPrimitive<FHIRKitString>?
  
  /// if one or more days of week is provided, action only occurs on specified day(s)
  public var dayOfWeek: [FHIRKitPrimitive<DaysOfWeek>]?
  
  /// time of day for action
  public var timeOfDay: [FHIRKitPrimitive<FHIRKitTime>]?
  
  /// code for time period of occurence
  public var when: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// minutes from event (before/after)
  public var offset: FHIRKitPrimitive<FHIRKitUnsignedInteger>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    boundsX: BoundsX? = nil,
    count: FHIRKitPrimitive<FHIRKitPositiveInteger>? = nil,
    countMax: FHIRKitPrimitive<FHIRKitPositiveInteger>? = nil,
    duration: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    durationMax: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    durationUnit: FHIRKitPrimitive<FHIRKitString>? = nil,
    frequency: FHIRKitPrimitive<FHIRKitPositiveInteger>? = nil,
    frequencyMax: FHIRKitPrimitive<FHIRKitPositiveInteger>? = nil,
    period: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    periodMax: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    periodUnit: FHIRKitPrimitive<FHIRKitString>? = nil,
    dayOfWeek: [FHIRKitPrimitive<DaysOfWeek>]? = nil,
    timeOfDay: [FHIRKitPrimitive<FHIRKitTime>]? = nil,
    when: [FHIRKitPrimitive<FHIRKitString>]? = nil,
    offset: FHIRKitPrimitive<FHIRKitUnsignedInteger>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.boundsX = boundsX
    self.count = count
    self.countMax = countMax
    self.duration = duration
    self.durationMax = durationMax
    self.durationUnit = durationUnit
    self.frequency = frequency
    self.frequencyMax = frequency
    self.period = period
    self.periodMax = periodMax
    self.periodUnit = periodUnit
    self.dayOfWeek = dayOfWeek
    self.timeOfDay = timeOfDay
    self.when = when
    self.offset = offset
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case boundsDuration
    case boundsPeriod
    case boundsRange
    case count; case _count
    case countMax; case _countMax
    case duration; case _duration
    case durationMax; case _durationMax
    case durationUnit; case _durationUnit
    case frequency; case _frequency
    case frequencyMax; case _frequencyMax
    case period; case _period
    case periodMax; case _periodMax
    case periodUnit; case _periodUnit
    case dayOfWeek; case _dayOfWeek
    case timeOfDay; case _timeOfDay
    case when; case _when
    case offset; case _offset
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempBoundsX: BoundsX?
    if let boundsDuration = try Duration(from: codingKeyContainer, forKeyIfPresent: .boundsDuration) {
      if tempBoundsX != nil {
        throw DecodingError.dataCorruptedError(forKey: .boundsDuration, in: codingKeyContainer, debugDescription: "More than one value provided for \"bounds\"")
      }
      tempBoundsX = .duration(boundsDuration)
    }
    
    if let boundsPeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .boundsPeriod) {
      if tempBoundsX != nil {
        throw DecodingError.dataCorruptedError(forKey: .boundsPeriod, in: codingKeyContainer, debugDescription: "More than one value provided for \"bounds\"")
      }
      tempBoundsX = .period(boundsPeriod)
    }
    
    if let boundsRange = try Range(from: codingKeyContainer, forKeyIfPresent: .boundsRange) {
      if tempBoundsX != nil {
        throw DecodingError.dataCorruptedError(forKey: .boundsRange, in: codingKeyContainer, debugDescription: "More than one value provided for \"bounds\"")
      }
      tempBoundsX = .range(boundsRange)
    }
    
    self.boundsX = tempBoundsX
    self.count = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: .count, auxKey: ._count)
    self.countMax = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: .countMax, auxKey: ._countMax)
    self.duration = try FHIRKitPrimitive<FHIRKitDecimal>(from: codingKeyContainer, forKeyIfPresent: .duration, auxKey: ._duration)
    self.durationMax = try FHIRKitPrimitive<FHIRKitDecimal>(from: codingKeyContainer, forKeyIfPresent: .durationMax, auxKey: ._durationMax)
    self.durationUnit = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .durationUnit, auxKey: ._durationUnit)
    self.frequency = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: .frequency, auxKey: ._frequency)
    self.frequencyMax = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: .frequencyMax, auxKey: ._frequencyMax)
    self.period = try FHIRKitPrimitive<FHIRKitDecimal>(from: codingKeyContainer, forKeyIfPresent: .period, auxKey: ._period)
    self.periodMax = try FHIRKitPrimitive<FHIRKitDecimal>(from: codingKeyContainer, forKeyIfPresent: .periodMax, auxKey: ._periodMax)
    self.periodUnit = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .periodUnit, auxKey: ._periodUnit)
    self.dayOfWeek = try [FHIRKitPrimitive<DaysOfWeek>](from: codingKeyContainer, forKeyIfPresent: .dayOfWeek, auxKey: ._dayOfWeek)
    self.timeOfDay = try [FHIRKitPrimitive<FHIRKitTime>](from: codingKeyContainer, forKeyIfPresent: .timeOfDay, auxKey: ._timeOfDay)
    self.when = try [FHIRKitPrimitive<FHIRKitString>](from: codingKeyContainer, forKeyIfPresent: .when, auxKey: ._when)
    self.offset = try FHIRKitPrimitive<FHIRKitUnsignedInteger>(from: codingKeyContainer, forKeyIfPresent: .offset, auxKey: ._offset)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumBoundsX = boundsX {
      switch enumBoundsX {
      case .duration(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .boundsDuration)
      case .period(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .boundsPeriod)
      case .range(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .boundsRange)
      }
    }
    
    try count?.encode(on: &codingKeyContainer, forKey: .count, auxKey: ._count)
    try countMax?.encode(on: &codingKeyContainer, forKey: .countMax, auxKey: ._countMax)
    try duration?.encode(on: &codingKeyContainer, forKey: .duration, auxKey: ._duration)
    try durationMax?.encode(on: &codingKeyContainer, forKey: .durationMax, auxKey: ._durationMax)
    try durationUnit?.encode(on: &codingKeyContainer, forKey: .durationUnit, auxKey: ._durationUnit)
    try frequency?.encode(on: &codingKeyContainer, forKey: .frequency, auxKey: ._frequency)
    try frequencyMax?.encode(on: &codingKeyContainer, forKey: .frequencyMax, auxKey: ._frequencyMax)
    try period?.encode(on: &codingKeyContainer, forKey: .period, auxKey: ._period)
    try periodMax?.encode(on: &codingKeyContainer, forKey: .periodMax, auxKey: ._periodMax)
    try periodUnit?.encode(on: &codingKeyContainer, forKey: .periodUnit, auxKey: ._periodUnit)
    try dayOfWeek?.encode(on: &codingKeyContainer, forKey: .dayOfWeek, auxKey: ._dayOfWeek)
    try timeOfDay?.encode(on: &codingKeyContainer, forKey: .timeOfDay, auxKey: ._timeOfDay)
    try when?.encode(on: &codingKeyContainer, forKey: .when, auxKey: ._when)
    try offset?.encode(on: &codingKeyContainer, forKey: .offset, auxKey: ._offset)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? TimingRepeat else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return boundsX == _other.boundsX
    && count == _other.count
    && countMax == _other.countMax
    && duration == _other.duration
    && durationMax == _other.durationMax
    && durationUnit == _other.durationUnit
    && frequency == _other.frequency
    && frequencyMax == _other.frequencyMax
    && period == _other.period
    && periodMax == _other.periodMax
    && periodUnit == _other.periodUnit
    && dayOfWeek == _other.dayOfWeek
    && timeOfDay == _other.timeOfDay
    && when == _other.when
    && offset == _other.offset
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(boundsX)
    hasher.combine(count)
    hasher.combine(countMax)
    hasher.combine(duration)
    hasher.combine(durationMax)
    hasher.combine(durationUnit)
    hasher.combine(frequency)
    hasher.combine(frequencyMax)
    hasher.combine(period)
    hasher.combine(periodMax)
    hasher.combine(periodUnit)
    hasher.combine(dayOfWeek)
    hasher.combine(timeOfDay)
    hasher.combine(when)
    hasher.combine(offset)
    
  }
}
