//
//  ClaimResponsePayment.swift
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
 Payment details for the adjudication of the claims
 */
open class ClaimResponsePayment: BackboneElement {
  /// Partial or complete payment
  public var type: CodableConcept
  
  /// Payment adjustment for non-claim issues
  public var adjustment: Money?
  
  /// Explanation for the adjustment
  public var adjustmentReason: CodableConcept?
  
  /// Expected date of payment
  public var date: FHIRKitPrimitive<FHIRKitDate>?
  
  /// Payable amount after adjustment
  public var amount: Money
  
  /// Business identifier for the payment
  public var identifier: Identifier?
  
  public init(type: CodableConcept, amount: Money) {
    self.type = type
    self.amount = amount
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: CodableConcept,
    adjustment: Money? = nil,
    adjustmentReason: CodableConcept? = nil,
    date: FHIRKitPrimitive<FHIRKitDate>? = nil,
    amount: Money,
    identifier: Identifier?
  ) {
    self.init(type: type, amount: amount)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
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
    
    self.type = try CodableConcept(from: codingKeyContainer, forKey: .type)
    self.adjustment = try Money(from: codingKeyContainer, forKeyIfPresent: .adjustment)
    self.adjustmentReason = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .adjustmentReason)
    self.date = try FHIRKitPrimitive<FHIRKitDate>(from: codingKeyContainer, forKeyIfPresent: .date, auxKey: ._date)
    self.amount = try Money(from: codingKeyContainer, forKey: .amount)
    self.identifier = try Identifier(from: codingKeyContainer, forKeyIfPresent: .identifier)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &codingKeyContainer, forKey: .type)
    try adjustment?.encode(on: &codingKeyContainer, forKey: .adjustment)
    try adjustmentReason?.encode(on: &codingKeyContainer, forKey: .adjustmentReason)
    try date?.encode(on: &codingKeyContainer, forKey: .date, auxiliaryKey: ._date)
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
