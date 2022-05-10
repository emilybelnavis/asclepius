//
//  ClaimResponseItemAdjudication.swift
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
 Adjudication Details; If this item is a group then values here are a summary of the adjudication of the detail
 items. If this item is a simple product or service then this is the result of the adjudication of this item
 */
open class ClaimResponseItemAdjudication: BackboneElement {
  /// Type of adjudication information
  public var category: CodeableConcept
  
  /// Explanation of adjudication outcome
  public var reason: CodeableConcept?
  
  /// Monetary amount
  public var amount: Money?
  
  /// Non-monetary value
  public var value: AsclepiusPrimitive<AsclepiusDecimal>?
  
  public init(category: CodeableConcept) {
    self.category = category
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    category: CodeableConcept,
    reason: CodeableConcept? = nil,
    amount: Money? = nil,
    value: AsclepiusPrimitive<AsclepiusDecimal>? = nil
  ) {
    self.init(category: category)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.category = category
    self.reason = reason
    self.amount = amount
    self.value = value
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case category
    case reason
    case amount
    case value; case _value
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.category = try CodeableConcept(from: codingKeyContainer, forKey: .category)
    self.reason = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .reason)
    self.amount = try Money(from: codingKeyContainer, forKeyIfPresent: .amount)
    self.value = try AsclepiusPrimitive<AsclepiusDecimal>(from: codingKeyContainer, forKeyIfPresent: .value, auxKey: ._value)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    try category.encode(on: &codingKeyContainer, forKey: .category)
    try reason?.encode(on: &codingKeyContainer, forKey: .reason)
    try amount?.encode(on: &codingKeyContainer, forKey: .amount)
    try value?.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseItemAdjudication else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return category == _other.category
    && reason == _other.reason
    && amount == _other.amount
    && value == _other.value
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(category)
    hasher.combine(reason)
    hasher.combine(amount)
    hasher.combine(value)
  }
}
