//
//  Money.swift
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

/// An amount of economic utility in some recognized currency
open class Money: Element {
  /// numerical value (with implicit precision)
  public var value: AsclepiusPrimitive<AsclepiusDecimal>?
  
  /// ISO 4217 currency code
  public var currency: AsclepiusPrimitive<AsclepiusString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    value: AsclepiusPrimitive<AsclepiusDecimal>? = nil,
    currency: AsclepiusPrimitive<AsclepiusString>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.value = value
    self.currency = currency
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case value; case _value
    case currency; case _currency
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.value = try AsclepiusPrimitive<AsclepiusDecimal>(from: codingKeyContainer, forKeyIfPresent: .value, auxKey: ._value)
    self.currency = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .currency, auxKey: ._currency)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try value?.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    try currency?.encode(on: &codingKeyContainer, forKey: .currency, auxKey: ._currency)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Money else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return value == _other.value
    && currency == _other.currency
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(value)
    hasher.combine(currency)
  }
}
