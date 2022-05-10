//
//  ExplanationOfBenefitBenefitBalanceFinancialAllowedX.swift
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

open class ExplanationOfBenefitBalanceFinancialAllowedX: Element {
  public var money: Money?
  public var string: AsclepiusPrimitive<AsclepiusString>?
  public var unsignedInteger: AsclepiusPrimitive<AsclepiusUnsignedInteger>?
  
  // MARK: - Class Functions
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    money: Money? = nil,
    string: AsclepiusPrimitive<AsclepiusString>? = nil,
    unsignedInteger: AsclepiusPrimitive<AsclepiusPositiveInteger>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.money = money
    self.string = string
    self.unsignedInteger = unsignedInteger
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case money
    case string; case _string
    case unsignedInteger; case _unsignedInteger
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.money = try Money(from: codingKeyContainer, forKeyIfPresent: .money)
    self.string = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .string, auxKey: ._string)
    self.unsignedInteger = try AsclepiusPrimitive<AsclepiusUnsignedInteger>(from: codingKeyContainer, forKeyIfPresent: .unsignedInteger, auxKey: ._unsignedInteger)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try money?.encode(on: &codingKeyContainer, forKey: .money)
    try string?.encode(on: &codingKeyContainer, forKey: .string, auxKey: ._string)
    try unsignedInteger?.encode(on: &codingKeyContainer, forKey: .unsignedInteger, auxKey: ._unsignedInteger)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ExplanationOfBenefitBalanceFinancialAllowedX else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return money == _other.money
    && string == _other.string
    && unsignedInteger == _other.unsignedInteger
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(money)
    hasher.combine(string)
    hasher.combine(unsignedInteger)
  }
}
