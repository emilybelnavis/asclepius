//
//  TriggerDefinition.swift
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

/**
 A description of a triggering event. Triggering events can be named events, data events, or periodic as
 determined by the type element
 */
open class TriggerDefinition: Element {
  /// All possible types for `timing` variable
  public enum TimingX: Hashable {
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
  public var timingX: TimingX?
  
  /// triggering data of the event
  public var data: [DataRequirement]?
  
  /// whether the event should be triggered
  public var condition: Expression?
  
  public init(type: FHIRKitPrimitive<TriggerType>) {
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<TriggerType>,
    name: FHIRKitPrimitive<FHIRKitString>? = nil,
    timingX: TimingX? = nil,
    condition: Expression? = nil,
    data: [DataRequirement]? = nil
  ) {
    self.init(type: type)
    self.fhirExtension = fhirExtension
    self.id = id
    self.name = name
    self.timingX = timingX
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
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempTimingX: TimingX?
    if let timingDate = try FHIRKitPrimitive<FHIRKitDate>(from: codingKeyContainer, forKeyIfPresent: .timingDate, auxKey: ._timingDate) {
      if tempTimingX != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingDate, in: codingKeyContainer, debugDescription: "More than one value provided for \"timing\"")
      }
      tempTimingX = .date(timingDate)
    }
    
    if let timingDateTime = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .timingDateTime, auxKey: ._timingDateTime) {
      if tempTimingX != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingDateTime, in: codingKeyContainer, debugDescription: "More than one value provided for \"timing\"")
      }
      tempTimingX = .dateTime(timingDateTime)
    }
    
    if let timingReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .timingReference) {
      if tempTimingX != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"timing\"")
      }
      tempTimingX = .reference(timingReference)
    }
    
    if let timingTiming = try Timing(from: codingKeyContainer, forKeyIfPresent: .timingTiming) {
      if tempTimingX != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingTiming, in: codingKeyContainer, debugDescription: "More than one value provided for \"timing\"")
      }
      tempTimingX = .timing(timingTiming)
    }
    
    self.type = try FHIRKitPrimitive<TriggerType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .name, auxKey: ._name)
    self.timingX = tempTimingX
    self.condition = try Expression(from: codingKeyContainer, forKeyIfPresent: .condition)
    self.data = try [DataRequirement](from: codingKeyContainer, forKeyIfPresent: .data)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumTimingX = timingX {
      switch enumTimingX {
      case .date(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .timingDate, auxKey: ._timingDate)
      case .dateTime(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .timingDateTime, auxKey: ._timingDateTime)
      case .reference(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .timingReference)
      case .timing(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .timingTiming)
      }
    }
   
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try name?.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try condition?.encode(on: &codingKeyContainer, forKey: .condition)
    try data?.encode(on: &codingKeyContainer, forKey: .data)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? TriggerDefinition else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && name == _other.name
    && timingX == _other.timingX
    && condition == _other.condition
    && data == _other.data
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(name)
    hasher.combine(timingX)
    hasher.combine(condition)
    hasher.combine(data)
  }
}
