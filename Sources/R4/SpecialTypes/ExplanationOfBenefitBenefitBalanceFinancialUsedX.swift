//
//  ExplanationOfBenefitBenefitBalanceFinancialUsedX.swift
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

open class ExplanationOfBenefitBenefitBalanceFinancialUsedX: Element {
  public var money: Money?
  public var unsignedInteger: AsclepiusPrimitive<AsclepiusUnsignedInteger>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    money: Money? = nil,
    unsignedInteger: AsclepiusPrimitive<AsclepiusUnsignedInteger>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.money = money
    self.unsignedInteger = unsignedInteger
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case money;
    case unsignedInteger; case _unsignedInteger
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.money = try Money(from: codingKeyContainer, forKeyIfPresent: .money)
    self.unsignedInteger = try AsclepiusPrimitive<AsclepiusUnsignedInteger>(from: codingKeyContainer, forKeyIfPresent: .unsignedInteger, auxKey: ._unsignedInteger)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try money?.encode(on: &codingKeyContainer, forKey: .money)
    try unsignedInteger?.encode(on: &codingKeyContainer, forKey: .unsignedInteger, auxKey: ._unsignedInteger)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ExplanationOfBenefitBenefitBalanceFinancialUsedX else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return money == _other.money
    && unsignedInteger == _other.unsignedInteger
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(money)
    hasher.combine(unsignedInteger)
  }
}
