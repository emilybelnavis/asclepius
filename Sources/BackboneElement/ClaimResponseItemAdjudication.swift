//
//  ClaimResponseItemAdjudication.swift
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
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    category: CodableConcept,
    reason: CodableConcept? = nil,
    amount: Money? = nil,
    value: FHIRKitPrimitive<FHIRKitDecimal>? = nil
  ) {
    self.init(category: category)
    self.`extension` = `extension`
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.category = try CodableConcept(from: _container, forKey: .category)
    self.reason = try CodableConcept(from: _container, forKeyIfPresent: .reason)
    self.amount = try Money(from: _container, forKeyIfPresent: .amount)
    self.value = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKeyIfPresent: .value, auxiliaryKey: ._value)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    try category.encode(on: &_container, forKey: .category)
    try reason?.encode(on: &_container, forKey: .reason)
    try amount?.encode(on: &_container, forKey: .amount)
    try value?.encode(on: &_container, forKey: .value, auxiliaryKey: ._value)
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
