//
//  ChargeItemDefinitionPropertyGroupPriceComponent.swift
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
 The price for a `ChargeItem` may be calculated as a base price with surcharges/deductions that apply
 in certain conditions. A `ChargeItemDefinition` resource that defines the prices, factors, and
 condtions that apply to a billing code is currently under development. The `priceComponent` element
 can be used to offer transparency to the recipient of the `Invoice` of how the prices have been
 calculated
 */
open class ChargeItemDefinitionPropertyGroupPriceComponent: BackboneElement {
  /// This code identifies the type of the component
  public var type: FHIRKitPrimitive<InvoicePriceComponentType>
  
  /// Code identifiying the specific component
  public var code: CodableConcept?
  
  /// Factor used for calculating this component
  public var factor: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// Monetary amount associated with this component
  public var amount: Money?
  
  public init(type: FHIRKitPrimitive<InvoicePriceComponentType>) {
    self.type = type
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<InvoicePriceComponentType>,
    code: CodableConcept? = nil,
    factor: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    amount: Money? = nil
  ) {
    self.init(type: type)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.code = code
    self.factor = factor
    self.amount = amount
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type; case _type
    case code
    case factor; case _factor
    case amount
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.type = try FHIRKitPrimitive<InvoicePriceComponentType>(from: _container, forKey: .type, auxiliaryKey: ._type)
    self.code = try CodableConcept(from: _container, forKeyIfPresent: .code)
    self.factor = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKeyIfPresent: .factor, auxiliaryKey: ._factor)
    self.amount = try Money(from: _container, forKeyIfPresent: .amount)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &_container, forKey: .type, auxiliaryKey: ._type)
    try code?.encode(on: &_container, forKey: .code)
    try factor?.encode(on: &_container, forKey: .factor, auxiliaryKey: ._factor)
    try amount?.encode(on: &_container, forKey: .amount)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ChargeItemDefinitionPropertyGroupPriceComponent else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && code == _other.code
    && factor == _other.factor
    && amount == _other.amount
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(code)
    hasher.combine(factor)
    hasher.combine(amount)
  }
}
