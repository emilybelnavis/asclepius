//
//  ElementDefinitionMinMaxValueX.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/// ElementDefinition property values that can have a min and/or max value
open class ElementDefinitionMinMaxValueX: Element {
  public var date: AlexandriaHRMPrimitive<AlexandriaHRMDate>?
  public var dateTime: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>?
  public var decimal: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>?
  public var instant: AlexandriaHRMPrimitive<AlexandriaHRMInstant>?
  public var integer: AlexandriaHRMPrimitive<AlexandriaHRMInteger>?
  public var positiveInteger: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>?
  public var quantity: Quantity?
  public var time: AlexandriaHRMPrimitive<AlexandriaHRMTime>?
  public var unsignedInteger: AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    date: AlexandriaHRMPrimitive<AlexandriaHRMDate>? = nil,
    dateTime: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>? = nil,
    decimal: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>? = nil,
    instant: AlexandriaHRMPrimitive<AlexandriaHRMInstant>? = nil,
    integer: AlexandriaHRMPrimitive<AlexandriaHRMInteger>? = nil,
    positiveInteger: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>? = nil,
    quantity: Quantity? = nil,
    time: AlexandriaHRMPrimitive<AlexandriaHRMTime>? = nil,
    unsignedInteger: AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.date = date
    self.dateTime = dateTime
    self.decimal = decimal
    self.instant = instant
    self.integer = integer
    self.positiveInteger = positiveInteger
    self.quantity = quantity
    self.time = time
    self.unsignedInteger = unsignedInteger
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case date; case _date
    case dateTime; case _dateTime
    case decimal; case _decimal
    case instant; case _instant
    case integer; case _integer
    case positiveInteger; case _positiveInteger
    case quantity
    case time; case _time
    case unsignedInteger; case _unsignedInteger
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.date = try AlexandriaHRMPrimitive<AlexandriaHRMDate>(from: codingKeyContainer, forKeyIfPresent: .date, auxKey: ._date)
    self.dateTime = try AlexandriaHRMPrimitive<AlexandriaHRMDateTime>(from: codingKeyContainer, forKeyIfPresent: .dateTime, auxKey: ._dateTime)
    self.decimal = try AlexandriaHRMPrimitive<AlexandriaHRMDecimal>(from: codingKeyContainer, forKeyIfPresent: .decimal, auxKey: ._decimal)
    self.instant = try AlexandriaHRMPrimitive<AlexandriaHRMInstant>(from: codingKeyContainer, forKeyIfPresent: .instant, auxKey: ._instant)
    self.integer = try AlexandriaHRMPrimitive<AlexandriaHRMInteger>(from: codingKeyContainer, forKeyIfPresent: .integer, auxKey: ._integer)
    self.positiveInteger = try AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: .positiveInteger, auxKey: ._positiveInteger)
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.time = try AlexandriaHRMPrimitive<AlexandriaHRMTime>(from: codingKeyContainer, forKeyIfPresent: .time, auxKey: ._time)
    self.unsignedInteger = try AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>(from: codingKeyContainer, forKeyIfPresent: .unsignedInteger, auxKey: ._unsignedInteger)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try date?.encode(on: &codingKeyContainer, forKey: .date, auxKey: ._date)
    try dateTime?.encode(on: &codingKeyContainer, forKey: .date, auxKey: ._dateTime)
    try decimal?.encode(on: &codingKeyContainer, forKey: .decimal, auxKey: ._decimal)
    try instant?.encode(on: &codingKeyContainer, forKey: .instant, auxKey: ._instant)
    try integer?.encode(on: &codingKeyContainer, forKey: .integer, auxKey: .integer)
    try positiveInteger?.encode(on: &codingKeyContainer, forKey: .positiveInteger, auxKey: ._positiveInteger)
    try quantity?.encode(on: &codingKeyContainer, forKey: .quantity)
    try time?.encode(on: &codingKeyContainer, forKey: .time, auxKey: ._time)
    try unsignedInteger?.encode(on: &codingKeyContainer, forKey: .unsignedInteger, auxKey: ._unsignedInteger)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ElementDefinitionMinMaxValueX else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return date == _other.date
    && dateTime == _other.dateTime
    && decimal == _other.decimal
    && instant == _other.instant
    && integer == _other.integer
    && positiveInteger == _other.positiveInteger
    && quantity == _other.quantity
    && time == _other.time
    && unsignedInteger == _other.unsignedInteger
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(date)
    hasher.combine(dateTime)
    hasher.combine(decimal)
    hasher.combine(instant)
    hasher.combine(integer)
    hasher.combine(positiveInteger)
    hasher.combine(quantity)
    hasher.combine(time)
    hasher.combine(unsignedInteger)
  }
}
