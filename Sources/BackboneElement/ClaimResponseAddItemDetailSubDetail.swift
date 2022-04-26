//
//  ClaimResponseAddItemDetailSubDetail.swift
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
 Insurer added line items; The third-tier service adjudications for payor added services
 */
open class ClaimResponseAddItemDetailSubDetail: BackboneElement {
  /// Billing, service, product, or drug code
  public var productOrService: CodableConcept
  
  /// Service/product billing modifiers
  public var modifier: [CodableConcept]?
  
  /// Count of products or services
  public var quantity: Quantity?
  
  /// Fee, charge, or cost per item
  public var unitPrice: Money?
  
  /// Price scaling factor
  public var factor: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// Total item cost
  public var net: Money?
  
  /// Applicable note numbers
  public var noteNumber: [FHIRKitPrimitive<FHIRKitPositiveInteger>]?
  
  /// Added items detail adjudication
  public var adjudication: [ClaimResponseItemAdjudication]?
  
  public init(productOrService: CodableConcept) {
    self.productOrService = productOrService
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    productOrService: CodableConcept,
    modifier: [CodableConcept]? = nil,
    quantity: Quantity? = nil,
    unitPrice: Money? = nil,
    factor: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    net: Money? = nil,
    noteNumber: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    adjudication: [ClaimResponseItemAdjudication]? = nil
  ) {
    self.init(productOrService: productOrService)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.modifier = modifier
    self.quantity = quantity
    self.unitPrice = unitPrice
    self.factor = factor
    self.net = net
    self.noteNumber = noteNumber
    self.adjudication = adjudication
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case productOrService
    case modifier
    case quantity
    case unitPrice
    case factor; case _factor
    case net
    case noteNumber; case _noteNumber
    case adjudication
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.productOrService = try CodableConcept(from: _container, forKey: .productOrService)
    self.modifier = try [CodableConcept](from: _container, forKeyIfPresent: .modifier)
    self.quantity = try Quantity(from: _container, forKeyIfPresent: .quantity)
    self.unitPrice = try Money(from: _container, forKeyIfPresent: .unitPrice)
    self.factor = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKeyIfPresent: .factor, auxiliaryKey: ._factor)
    self.net = try Money(from: _container, forKeyIfPresent: .net)
    self.noteNumber = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: _container, forKeyIfPresent: .noteNumber, auxiliaryKey: ._noteNumber)
    self.adjudication = try [ClaimResponseItemAdjudication](from: _container, forKeyIfPresent: .adjudication)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try productOrService.encode(on: &_container, forKey: .productOrService)
    try modifier?.encode(on: &_container, forKey: .modifier)
    try quantity?.encode(on: &_container, forKey: .quantity)
    try unitPrice?.encode(on: &_container, forKey: .unitPrice)
    try factor?.encode(on: &_container, forKey: .factor, auxiliaryKey: ._factor)
    try net?.encode(on: &_container, forKey: .net)
    try noteNumber?.encode(on: &_container, forKey: .noteNumber, auxiliaryKey: ._noteNumber)
    try adjudication?.encode(on: &_container, forKey: .adjudication)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseAddItemDetailSubDetail else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return productOrService == _other.productOrService
    && modifier == _other.modifier
    && quantity == _other.quantity
    && unitPrice == _other.unitPrice
    && factor == _other.factor
    && net == _other.net
    && noteNumber == _other.noteNumber
    && adjudication == _other.adjudication
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(productOrService)
    hasher.combine(modifier)
    hasher.combine(quantity)
    hasher.combine(unitPrice)
    hasher.combine(factor)
    hasher.combine(net)
    hasher.combine(noteNumber)
    hasher.combine(adjudication)
  }
}
  