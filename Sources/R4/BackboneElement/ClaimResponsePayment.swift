//
//  ClaimResponsePayment.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/**
 Payment details for the adjudication of the claims
 */
open class ClaimResponsePayment: BackboneElement {
  /// Partial or complete payment
  public var type: CodeableConcept
  
  /// Payment adjustment for non-claim issues
  public var adjustment: Money?
  
  /// Explanation for the adjustment
  public var adjustmentReason: CodeableConcept?
  
  /// Expected date of payment
  public var date: AlexandriaHRMPrimitive<AlexandriaHRMDate>?
  
  /// Payable amount after adjustment
  public var amount: Money
  
  /// Business identifier for the payment
  public var identifier: Identifier?
  
  public init(type: CodeableConcept, amount: Money) {
    self.type = type
    self.amount = amount
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    type: CodeableConcept,
    adjustment: Money? = nil,
    adjustmentReason: CodeableConcept? = nil,
    date: AlexandriaHRMPrimitive<AlexandriaHRMDate>? = nil,
    amount: Money,
    identifier: Identifier?
  ) {
    self.init(type: type, amount: amount)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.adjustment = adjustment
    self.adjustmentReason = adjustmentReason
    self.date = date
    self.identifier = identifier
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type
    case adjustment
    case adjustmentReason
    case date; case _date
    case amount
    case identifier
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try CodeableConcept(from: codingKeyContainer, forKey: .type)
    self.adjustment = try Money(from: codingKeyContainer, forKeyIfPresent: .adjustment)
    self.adjustmentReason = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .adjustmentReason)
    self.date = try AlexandriaHRMPrimitive<AlexandriaHRMDate>(from: codingKeyContainer, forKeyIfPresent: .date, auxKey: ._date)
    self.amount = try Money(from: codingKeyContainer, forKey: .amount)
    self.identifier = try Identifier(from: codingKeyContainer, forKeyIfPresent: .identifier)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &codingKeyContainer, forKey: .type)
    try adjustment?.encode(on: &codingKeyContainer, forKey: .adjustment)
    try adjustmentReason?.encode(on: &codingKeyContainer, forKey: .adjustmentReason)
    try date?.encode(on: &codingKeyContainer, forKey: .date, auxKey: ._date)
    try amount.encode(on: &codingKeyContainer, forKey: .amount)
    try identifier?.encode(on: &codingKeyContainer, forKey: .identifier)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponsePayment else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && adjustment == _other.adjustment
    && adjustmentReason == _other.adjustmentReason
    && date == _other.date
    && amount == _other.amount
    && identifier == _other.identifier
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(adjustment)
    hasher.combine(adjustmentReason)
    hasher.combine(date)
    hasher.combine(amount)
    hasher.combine(identifier)
  }
}
