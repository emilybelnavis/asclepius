//
//  ClaimItemDetail.swift
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
 Product or service provided. A claim detail line containing either a simple item (a product or service), or a
 "group" of sub-details which are simple items
 */
open class ClaimItemDetail: BackboneElement {
  /// Item instance identifier
  public var sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>
  
  /// Revenue or cost center code
  public var revenue: CodableConcept?
  
  /// Benefit classification
  public var category: CodableConcept?
  
  /// Billing, service, product, or drug code
  public var productOrService: CodableConcept?
  
  /// Service/product billing modifiers
  public var modifier: [CodableConcept]?
  
  /// Program the product or service is provided under
  public var programCode: [CodableConcept]?
  
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
  
  /// Product or service provided
  public var subDetail: [ClaimItemDetailSubDetail]?
  
  public init(sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>) {
    self.sequence = sequence
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>,
    revenue: CodableConcept? = nil,
    category: CodableConcept? = nil,
    productOrService: CodableConcept? = nil,
    modifier: [CodableConcept]? = nil,
    programCode: [CodableConcept]? = nil,
    quantity: Quantity? = nil,
    factor: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>? = nil,
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
    
    self.sequence = try AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.revenue = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .revenue)
    self.category = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .category)
    self.productOrService = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .productOrService)
    self.modifier = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .modifier)
    self.programCode = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .programCode)
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.factor = try AlexandriaHRMPrimitive<AlexandriaHRMDecimal>(from: codingKeyContainer, forKeyIfPresent: .factor, auxKey: ._factor)
    self.net = try Money(from: codingKeyContainer, forKeyIfPresent: .net)
    self.udi = try [Reference](from: codingKeyContainer, forKeyIfPresent: .udi)
    self.subDetail = try [ClaimItemDetailSubDetail](from: codingKeyContainer, forKeyIfPresent: .subDetail)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
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
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
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
