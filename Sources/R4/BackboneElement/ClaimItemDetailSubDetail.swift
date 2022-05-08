//
//  ClaimItemDetailSubDetail.swift
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
 A product or service provided. A claim detail line, either a simple item (product or service) or a "group" of
 sub-detauls which are simple items
 */
open class ClaimItemDetailSubDetail: BackboneElement {
  /// Item instance identifier
  public var sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>
  
  /// Revenue or cost center code
  public var revenue: CodeableConcept?
  
  /// Benefit classification
  public var category: CodeableConcept?
  
  /// Billing, service, product, or drug code
  public var productOrService: CodeableConcept
  
  /// Service/product billing modifiers
  public var modifier: [CodeableConcept]?
  
  /// Program the product or service is provided under
  public var programCode: [CodeableConcept]?
  
  /// Count of products or services
  public var quantity: Quantity?
  
  /// Fee, charge, or cost per item
  public var unitPrice: Money?
  
  /// Price scaling factor
  public var factor: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>?
  
  /// Total item cost
  public var net: Money?
  
  /// Unique device identifier
  public var udi: [Reference]?
  
  public init(sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>, productOrService: CodeableConcept) {
    self.sequence = sequence
    self.productOrService = productOrService
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>,
    revenue: CodeableConcept? = nil,
    category: CodeableConcept? = nil,
    productOrService: CodeableConcept,
    modifier: [CodeableConcept]? = nil,
    programCode: [CodeableConcept]? = nil,
    quantity: Quantity? = nil,
    unitPrice: Money? = nil,
    factor: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>? = nil,
    net: Money? = nil,
    udi: [Reference]? = nil
  ) {
    self.init(sequence: sequence, productOrService: productOrService)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
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
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.sequence = try AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.revenue = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .revenue)
    self.category = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .category)
    self.productOrService = try CodeableConcept(from: codingKeyContainer, forKey: .productOrService)
    self.modifier = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .modifier)
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.unitPrice = try Money(from: codingKeyContainer, forKeyIfPresent: .unitPrice)
    self.factor = try AlexandriaHRMPrimitive<AlexandriaHRMDecimal>(from: codingKeyContainer, forKey: .factor, auxKey: ._factor)
    self.net = try Money(from: codingKeyContainer, forKeyIfPresent: .net)
    self.udi = try [Reference](from: codingKeyContainer, forKeyIfPresent: .udi)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try sequence.encode(on: &codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    try revenue?.encode(on: &codingKeyContainer, forKey: .revenue)
    try category?.encode(on: &codingKeyContainer, forKey: .category)
    try productOrService.encode(on: &codingKeyContainer, forKey: .productOrService)
    try modifier?.encode(on: &codingKeyContainer, forKey: .modifier)
    try programCode?.encode(on: &codingKeyContainer, forKey: .programCode)
    try quantity?.encode(on: &codingKeyContainer, forKey: .quantity)
    try unitPrice?.encode(on: &codingKeyContainer, forKey: .unitPrice)
    try factor?.encode(on: &codingKeyContainer, forKey: .factor, auxKey: ._factor)
    try net?.encode(on: &codingKeyContainer, forKey: .net)
    try udi?.encode(on: &codingKeyContainer, forKey: .udi)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
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
  override public func hash(into hasher: inout Hasher) {
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
