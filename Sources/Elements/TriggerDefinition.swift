//
//  TriggerDefinition.swift
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

/**
 A description of a triggering event. Triggering events can be named events, data events, or periodic as
 determined by the type element
 */
open class TriggerDefinition: Element {
  /// All possible types for `timing` variable
  public enum _Timing: Hashable {
    case date(FHIRKitPrimitive<FHIRKitDate>)
    case dateTime(FHIRKitPrimitive<FHIRKitDateTime>)
    case reference(Reference)
    case timing(Timing)
  }
  
  /// the type of triggering event
  public var type: FHIRKitPrimitive<TriggerType>
  
  /// event identifier
  public var name: FHIRKitPrimitive<FHIRKitString>?
  
  /// timing of the trigger
  public var timing: _Timing?
  
  /// triggering data of the event
  public var data: [DataRequirement]?
  
  /// whether the event should be triggered
  public var condition: Expression?
  
  public init(type: FHIRKitPrimitive<TriggerType>) {
    self.type = type
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<TriggerType>,
    name: FHIRKitPrimitive<FHIRKitString>? = nil,
    timing: _Timing? = nil,
    condition: Expression? = nil,
    data: [DataRequirement]? = nil
  ) {
    self.init(type: type)
    self.`extension` = `extension`
    self.id = id
    self.name = name
    self.timing = timing
    self.condition = condition
    self.data = data
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type; case _type
    case name; case _name
    case timingDate; case _timingDate
    case timingDateTime; case _timingDateTime
    case timingReference
    case timingTiming
    case condition
    case data
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    var _timing: _Timing?
    if let timingDate = try FHIRKitPrimitive<FHIRKitDate>(from: _container, forKeyIfPresent: .timingDate, auxiliaryKey: ._timingDate) {
      if _timing != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingDate, in: _container, debugDescription: "More than one value provided for \"timing\"")
      }
      _timing = .date(timingDate)
    }
    
    if let timingDateTime = try FHIRKitPrimitive<FHIRKitDateTime>(from: _container, forKeyIfPresent: .timingDateTime, auxiliaryKey: ._timingDateTime) {
      if _timing != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingDateTime, in: _container, debugDescription: "More than one value provided for \"timing\"")
      }
      _timing = .dateTime(timingDateTime)
    }
    
    if let timingReference = try Reference(from: _container, forKeyIfPresent: .timingReference) {
      if _timing != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingReference, in: _container, debugDescription: "More than one value provided for \"timing\"")
      }
      _timing = .reference(timingReference)
    }
    
    if let timingTiming = try Timing(from: _container, forKeyIfPresent: .timingTiming) {
      if _timing != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingTiming, in: _container, debugDescription: "More than one value provided for \"timing\"")
      }
      _timing = .timing(timingTiming)
    }
    
    self.type = try FHIRKitPrimitive<TriggerType>(from: _container, forKey: .type, auxiliaryKey: ._type)
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .name, auxiliaryKey: ._name)
    self.timing = _timing
    self.condition = try Expression(from: _container, forKeyIfPresent: .condition)
    self.data = try [DataRequirement](from: _container, forKeyIfPresent: .data)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    if let _timing = timing {
      switch _timing {
        case .date(let _value):
          try _value.encode(on: &_container, forKey: .timingDate, auxiliaryKey: ._timingDate)
        case .dateTime(let _value):
          try _value.encode(on: &_container, forKey: .timingDateTime, auxiliaryKey: ._timingDateTime)
        case .reference(let _value):
          try _value.encode(on: &_container, forKey: .timingReference)
        case .timing(let _value):
          try _value.encode(on: &_container, forKey: .timingTiming)
      }
    }
   
    try type.encode(on: &_container, forKey: .type, auxiliaryKey: ._type)
    try name?.encode(on: &_container, forKey: .name, auxiliaryKey: ._name)
    try condition?.encode(on: &_container, forKey: .condition)
    try data?.encode(on: &_container, forKey: .data)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? TriggerDefinition else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && name == _other.name
    && timing == _other.timing
    && condition == _other.condition
    && data == _other.data
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(name)
    hasher.combine(timing)
    hasher.combine(condition)
    hasher.combine(data)
  }
}
