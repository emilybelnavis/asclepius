//
//  ClaimItemDetailSubDetail.swift
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
 A product or service provided. A claim detail line, either a simple item (product or service) or a "group" of
 sub-detauls which are simple items
 */
open class ClaimItemDetailSubDetail: BackboneElement {
  /// Item instance identifier
  public var sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// Revenue or cost center code
  public var revenue: CodableConcept?
  
  /// Benefit classification
  public var category: CodableConcept?
  
  /// Billing, service, product, or drug code
  public var productOrService: CodableConcept
  
  /// Service/product billing modifiers
  public var modifier: [CodableConcept]?
  
  /// Program the product or service is provided under
  public var programCode: [CodableConcept]?
  
  /// Count of products or services
  public var quantity: Quantity?
  
  /// Fee, charge, or cost per item
  public var unitPrice: Money?
  
  /// Price scaling factor
  public var factor: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// Total item cost
  public var net: Money?
  
  /// Unique device identifier
  public var udi: [Reference]?
  
  public init(sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>, productOrService: CodableConcept) {
    self.sequence = sequence
    self.productOrService = productOrService
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>,
    revenue: CodableConcept? = nil,
    category: CodableConcept? = nil,
    productOrService: CodableConcept,
    modifier: [CodableConcept]? = nil,
    programCode: [CodableConcept]? = nil,
    quantity: Quantity? = nil,
    unitPrice: Money? = nil,
    factor: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    net: Money? = nil,
    udi: [Reference]? = nil
  ) {
    self.init(sequence: sequence, productOrService: productOrService)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.sequence = sequence
    self.revenue = revenue
    self.category = category
    self.productOrService = productOrService
    self.modifier = modifier
    self.programCode = programCode
    self.quantity = quantity
    self.unitPrice = unitPrice
    self.factor = factor
    self.net = net
    self.udi = udi
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case revenue
    case category
    case productOrService
    case modifier
    case programCode
    case quantity
    case unitPrice
    case factor; case _factor
    case net
    case udi
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.sequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKey: .sequence, auxiliaryKey: ._sequence)
    self.revenue = try CodableConcept(from: _container, forKeyIfPresent: .revenue)
    self.category = try CodableConcept(from: _container, forKeyIfPresent: .category)
    self.productOrService = try CodableConcept(from: _container, forKey: .productOrService)
    self.modifier = try [CodableConcept](from: _container, forKeyIfPresent: .modifier)
    self.quantity = try Quantity(from: _container, forKeyIfPresent: .quantity)
    self.unitPrice = try Money(from: _container, forKeyIfPresent: .unitPrice)
    self.factor = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKey: .factor, auxiliaryKey: ._factor)
    self.net = try Money(from: _container, forKeyIfPresent: .net)
    self.udi = try [Reference](from: _container, forKeyIfPresent: .udi)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try sequence.encode(on: &_container, forKey: .sequence, auxiliaryKey: ._sequence)
    try revenue?.encode(on: &_container, forKey: .revenue)
    try category?.encode(on: &_container, forKey: .category)
    try productOrService.encode(on: &_container, forKey: .productOrService)
    try modifier?.encode(on: &_container, forKey: .modifier)
    try programCode?.encode(on: &_container, forKey: .programCode)
    try quantity?.encode(on: &_container, forKey: .quantity)
    try unitPrice?.encode(on: &_container, forKey: .unitPrice)
    try factor?.encode(on: &_container, forKey: .factor, auxiliaryKey: ._factor)
    try net?.encode(on: &_container, forKey: .net)
    try udi?.encode(on: &_container, forKey: .udi)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimItemDetailSubDetail else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return sequence == _other.sequence
    && revenue == _other.revenue
    && category == _other.category
    && productOrService == _other.productOrService
    && modifier == _other.modifier
    && quantity == _other.quantity
    && unitPrice == _other.unitPrice
    && factor == _other.factor
    && net == _other.net
    && udi == _other.udi
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(revenue)
    hasher.combine(category)
    hasher.combine(productOrService)
    hasher.combine(modifier)
    hasher.combine(quantity)
    hasher.combine(unitPrice)
    hasher.combine(factor)
    hasher.combine(net)
    hasher.combine(udi)
  }
}
