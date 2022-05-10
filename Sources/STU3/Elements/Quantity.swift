//
//  Quantity.swift
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

/**
 A measured or measurable amount
 
 A measured amount (or an amount that can potentially be measured). Note that measured amounts include
 amounts that are not preciely quantified, including amounts involving arbitrary units and floating currencies
 */
open class Quantity: Element {
  /// Numerical value (with implicit precision)
  public var value: AsclepiusPrimitive<AsclepiusDecimal>?
  
  /// How the value should be understood and represented - whether the actual value is greater/less than
  /// the stated value due to measurement issues; e.g. if the comparator is `<` , the the real value is `<`
  /// stated value
  public var comparator: AsclepiusPrimitive<QuantityComparator>?
  
  /// Unit representation
  public var unit: AsclepiusPrimitive<AsclepiusString>?
  
  /// System that defines coded unit form
  public var system: AsclepiusPrimitive<AsclepiusURI>?
  
  /// Coded form of the unit
  public var code: AsclepiusPrimitive<AsclepiusString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    value: AsclepiusPrimitive<AsclepiusDecimal>? = nil,
    comparator: AsclepiusPrimitive<QuantityComparator>? = nil,
    unit: AsclepiusPrimitive<AsclepiusString>? = nil,
    system: AsclepiusPrimitive<AsclepiusURI>? = nil,
    code: AsclepiusPrimitive<AsclepiusString>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.value = value
    self.comparator = comparator
    self.unit = unit
    self.system = system
    self.code = code
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case value; case _value
    case comparator; case _comparator
    case unit; case _unit
    case system; case _system
    case code; case _code
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.value = try AsclepiusPrimitive<AsclepiusDecimal>(from: codingKeyContainer, forKeyIfPresent: .value, auxKey: ._value)
    self.comparator = try AsclepiusPrimitive<QuantityComparator>(from: codingKeyContainer, forKeyIfPresent: .comparator, auxKey: ._comparator)
    self.unit = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .unit, auxKey: ._unit)
    self.system = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .system, auxKey: ._system)
    self.code = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .code, auxKey: ._code)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try value?.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    try comparator?.encode(on: &codingKeyContainer, forKey: .comparator, auxKey: ._comparator)
    try unit?.encode(on: &codingKeyContainer, forKey: .unit, auxKey: ._unit)
    try system?.encode(on: &codingKeyContainer, forKey: .system, auxKey: ._system)
    try code?.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Quantity else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return value == _other.value
    && comparator == _other.comparator
    && unit == _other.unit
    && system == _other.system
    && code == _other.code
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(value)
    hasher.combine(comparator)
    hasher.combine(unit)
    hasher.combine(system)
    hasher.combine(code)
  }
}
