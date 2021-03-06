//
//  ClaimItemDetail.swift
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
 Product or service provided. A claim detail line containing either a simple item (a product or service), or a
 "group" of sub-details which are simple items
 */
open class ClaimItemDetail: BackboneElement {
  /// Item instance identifier
  public var sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>
  
  /// Revenue or cost center code
  public var revenue: CodeableConcept?
  
  /// Benefit classification
  public var category: CodeableConcept?
  
  /// Billing, service, product, or drug code
  public var productOrService: CodeableConcept?
  
  /// Service/product billing modifiers
  public var modifier: [CodeableConcept]?
  
  /// Program the product or service is provided under
  public var programCode: [CodeableConcept]?
  
  /// Count of products or services
  public var quantity: Quantity?
  
  /// Fee, charge, or cost per item
  public var unitPrice: Money?
  
  /// Price scaling factor
  public var factor: AsclepiusPrimitive<AsclepiusDecimal>?
  
  /// Total item cost
  public var net: Money?
  
  /// Unique device identifier
  public var udi: [Reference]?
  
  /// Product or service provided
  public var subDetail: [ClaimItemDetailSubDetail]?
  
  public init(sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>) {
    self.sequence = sequence
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>,
    revenue: CodeableConcept? = nil,
    category: CodeableConcept? = nil,
    productOrService: CodeableConcept? = nil,
    modifier: [CodeableConcept]? = nil,
    programCode: [CodeableConcept]? = nil,
    quantity: Quantity? = nil,
    factor: AsclepiusPrimitive<AsclepiusDecimal>? = nil,
    net: Money? = nil,
    udi: [Reference]? = nil,
    subDetail: [ClaimItemDetailSubDetail]?
  ) {
    self.init(sequence: sequence)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.revenue = revenue
    self.category = category
    self.productOrService = productOrService
    self.modifier = modifier
    self.programCode = programCode
    self.quantity = quantity
    self.factor = factor
    self.net = net
    self.udi = udi
    self.subDetail = subDetail
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
    case factor; case _factor
    case net
    case udi
    case subDetail
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.sequence = try AsclepiusPrimitive<AsclepiusPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.revenue = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .revenue)
    self.category = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .category)
    self.productOrService = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .productOrService)
    self.modifier = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .modifier)
    self.programCode = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .programCode)
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.factor = try AsclepiusPrimitive<AsclepiusDecimal>(from: codingKeyContainer, forKeyIfPresent: .factor, auxKey: ._factor)
    self.net = try Money(from: codingKeyContainer, forKeyIfPresent: .net)
    self.udi = try [Reference](from: codingKeyContainer, forKeyIfPresent: .udi)
    self.subDetail = try [ClaimItemDetailSubDetail](from: codingKeyContainer, forKeyIfPresent: .subDetail)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try sequence.encode(on: &codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    try revenue?.encode(on: &codingKeyContainer, forKey: .revenue)
    try category?.encode(on: &codingKeyContainer, forKey: .category)
    try productOrService?.encode(on: &codingKeyContainer, forKey: .productOrService)
    try modifier?.encode(on: &codingKeyContainer, forKey: .modifier)
    try programCode?.encode(on: &codingKeyContainer, forKey: .programCode)
    try quantity?.encode(on: &codingKeyContainer, forKey: .quantity)
    try factor?.encode(on: &codingKeyContainer, forKey: .factor, auxKey: ._factor)
    try net?.encode(on: &codingKeyContainer, forKey: .net)
    try udi?.encode(on: &codingKeyContainer, forKey: .udi)
    try subDetail?.encode(on: &codingKeyContainer, forKey: .subDetail)
    
    try super.encode(to: encoder)
  }
  
  // MARK: Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimItemDetail else {
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
    && programCode == _other.programCode
    && quantity == _other.quantity
    && factor == _other.factor
    && net == _other.net
    && udi == _other.udi
    && subDetail == _other.subDetail
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(revenue)
    hasher.combine(category)
    hasher.combine(productOrService)
    hasher.combine(modifier)
    hasher.combine(programCode)
    hasher.combine(quantity)
    hasher.combine(factor)
    hasher.combine(net)
    hasher.combine(udi)
    hasher.combine(subDetail)
  }
}
