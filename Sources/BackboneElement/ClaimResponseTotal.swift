//
//  ClaimResponseTotal.swift
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
 Adjudication totals - Categorized monetary totals for the adjudication
 */
open class ClaimResponseTotal: BackboneElement {
  /// Type of adjudication information
  public var category: CodableConcept
  
  /// Financial total for the category
  public var amount: Money
  
  public init(category: CodableConcept, amount: Money) {
    self.category = category
    self.amount = amount
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    category: CodableConcept,
    amount: Money
  ) {
    self.init(category: category, amount: amount)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case category
    case amount
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.category = try CodableConcept(from: _container, forKey: .category)
    self.amount = try Money(from: _container, forKey: .amount)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try category.encode(on: &_container, forKey: .category)
    try amount.encode(on: &_container, forKey: .amount)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseTotal else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return category == _other.category
    && amount == _other.amount
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(category)
    hasher.combine(amount)
  }
}
