//
//  ClaimResponseItemAdjudication.swift
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
 Adjudication Details; If this item is a group then values here are a summary of the adjudication of the detail
 items. If this item is a simple product or service then this is the result of the adjudication of this item
 */
open class ClaimResponseItemAdjudication: BackboneElement {
  /// Type of adjudication information
  public var category: CodableConcept
  
  /// Explanation of adjudication outcome
  public var reason: CodableConcept?
  
  /// Monetary amount
  public var amount: Money?
  
  /// Non-monetary value
  public var value: FHIRKitPrimitive<FHIRKitDecimal>?
  
  public init(category: CodableConcept) {
    self.category = category
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    category: CodableConcept,
    reason: CodableConcept? = nil,
    amount: Money? = nil,
    value: FHIRKitPrimitive<FHIRKitDecimal>? = nil
  ) {
    self.init(category: category)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
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
    
    self.category = try CodableConcept(from: codingKeyContainer, forKey: .category)
    self.reason = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .reason)
    self.amount = try Money(from: codingKeyContainer, forKeyIfPresent: .amount)
    self.value = try FHIRKitPrimitive<FHIRKitDecimal>(from: codingKeyContainer, forKeyIfPresent: .value, auxKey: ._value)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    try category.encode(on: &codingKeyContainer, forKey: .category)
    try reason?.encode(on: &codingKeyContainer, forKey: .reason)
    try amount?.encode(on: &codingKeyContainer, forKey: .amount)
    try value?.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(category)
    hasher.combine(reason)
    hasher.combine(amount)
    hasher.combine(value)
  }
}