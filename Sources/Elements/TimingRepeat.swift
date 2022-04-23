//
//  TimingRepeat.swift
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

/// A set of rules that describe when the event is scheduled.
open class TimingRepeat: Element {
  /// All possible types for bounds
  public enum Bounds: Hashable {
    case duration(Duration)
    case period(Period)
    case range(Range)
  }
  
  /// length/range of lengths, or start and/or end limits
  public var bounds: Bounds?
  
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
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    bounds: Bounds? = nil,
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
    self.`extension` = `extension`
    self.id = id
    self.bounds = bounds
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    var _bounds: Bounds?
    if let boundsDuration = try Duration(from: _container, forKeyIfPresent: .boundsDuration) {
      if _bounds != nil {
        throw DecodingError.dataCorruptedError(forKey: .boundsDuration, in: _container, debugDescription: "More than one value provided for \"bounds\"")
      }
      _bounds = .duration(boundsDuration)
    }
    
    if let boundsPeriod = try Period(from: _container, forKeyIfPresent: .boundsPeriod) {
      if _bounds != nil {
        throw DecodingError.dataCorruptedError(forKey: .boundsPeriod, in: _container, debugDescription: "More than one value provided for \"bounds\"")
      }
      _bounds = .period(boundsPeriod)
    }
    
    if let boundsRange = try Range(from: _container, forKeyIfPresent: .boundsRange) {
      if _bounds != nil {
        throw DecodingError.dataCorruptedError(forKey: .boundsRange, in: _container, debugDescription: "More than one value provided for \"bounds\"")
      }
      _bounds = .range(boundsRange)
    }
    
    self.bounds = _bounds
    self.count = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKeyIfPresent: .count, auxiliaryKey: ._count)
    self.countMax = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKeyIfPresent: .countMax, auxiliaryKey: ._countMax)
    self.duration = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKeyIfPresent: .duration, auxiliaryKey: ._duration)
    self.durationMax = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKeyIfPresent: .durationMax, auxiliaryKey: ._durationMax)
    self.durationUnit = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .durationUnit, auxiliaryKey: ._durationUnit)
    self.frequency = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKeyIfPresent: .frequency, auxiliaryKey: ._frequency)
    self.frequencyMax = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKeyIfPresent: .frequencyMax, auxiliaryKey: ._frequencyMax)
    self.period = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKeyIfPresent: .period, auxiliaryKey: ._period)
    self.periodMax = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKeyIfPresent: .periodMax, auxiliaryKey: ._periodMax)
    self.periodUnit = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .periodUnit, auxiliaryKey: ._periodUnit)
    self.dayOfWeek = try [FHIRKitPrimitive<DaysOfWeek>](from: _container, forKeyIfPresent: .dayOfWeek, auxiliaryKey: ._dayOfWeek)
    self.timeOfDay = try [FHIRKitPrimitive<FHIRKitTime>](from: _container, forKeyIfPresent: .timeOfDay, auxiliaryKey: ._timeOfDay)
    self.when = try [FHIRKitPrimitive<FHIRKitString>](from: _container, forKeyIfPresent: .when, auxiliaryKey: ._when)
    self.offset = try FHIRKitPrimitive<FHIRKitUnsignedInteger>(from: _container, forKeyIfPresent: .offset, auxiliaryKey: ._offset)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    if let _bounds = bounds {
      switch _bounds {
      case .duration(let _value):
        try _value.encode(on: &_container, forKey: .boundsDuration)
      case .period(let _value):
        try _value.encode(on: &_container, forKey: .boundsPeriod)
      case .range(let _value):
        try _value.encode(on: &_container, forKey: .boundsRange)
      }
    }
    
    try count?.encode(on: &_container, forKey: .count, auxiliaryKey: ._count)
    try countMax?.encode(on: &_container, forKey: .countMax, auxiliaryKey: ._countMax)
    try duration?.encode(on: &_container, forKey: .duration, auxiliaryKey: ._duration)
    try durationMax?.encode(on: &_container, forKey: .durationMax, auxiliaryKey: ._durationMax)
    try durationUnit?.encode(on: &_container, forKey: .durationUnit, auxiliaryKey: ._durationUnit)
    try frequency?.encode(on: &_container, forKey: .frequency, auxiliaryKey: ._frequency)
    try frequencyMax?.encode(on: &_container, forKey: .frequencyMax, auxiliaryKey: ._frequencyMax)
    try period?.encode(on: &_container, forKey: .period, auxiliaryKey: ._period)
    try periodMax?.encode(on: &_container, forKey: .periodMax, auxiliaryKey: ._periodMax)
    try periodUnit?.encode(on: &_container, forKey: .periodUnit, auxiliaryKey: ._periodUnit)
    try dayOfWeek?.encode(on: &_container, forKey: .dayOfWeek, auxiliaryKey: ._dayOfWeek)
    try timeOfDay?.encode(on: &_container, forKey: .timeOfDay, auxiliaryKey: ._timeOfDay)
    try when?.encode(on: &_container, forKey: .when, auxiliaryKey: ._when)
    try offset?.encode(on: &_container, forKey: .offset, auxiliaryKey: ._offset)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? TimingRepeat else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return bounds == _other.bounds
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
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(bounds)
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
