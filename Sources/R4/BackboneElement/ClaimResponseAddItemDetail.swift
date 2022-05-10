//
//  ClaimResponseAddItemDetail.swift
//  Asclepius
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

import AsclepiusCore

/**
 Insurer added line details - The second tier service adjudications for payor added services
 */
open class ClaimResponseAddItemDetail: BackboneElement {
  /// Billing, service, product, or drug code
  public var productOrService: CodeableConcept
  
  /// Service/product billing modifiers
  public var modifier: [CodeableConcept]?
  
  /// Count of product or services
  public var quantity: Quantity?
  
  /// Fee, charge, or cost per item
  public var unitPrice: Money?
  
  /// Price scaling factor
  public var factor: AsclepiusPrimitive<AsclepiusDecimal>?
  
  /// Total item cost
  public var net: Money?
  
  /// Applicable note numbers
  public var noteNumber: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Added items detail adjudication
  public var adjudication: [ClaimResponseItemAdjudication]
  
  /// Insurer added line items
  public var subDetail: [ClaimResponseItemDetailSubDetail]?
  
  public init(productOrService: CodeableConcept, adjudication: [ClaimResponseItemAdjudication]) {
    self.productOrService = productOrService
    self.adjudication = adjudication
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    productOrService: CodeableConcept,
    modifier: [CodeableConcept]? = nil,
    quantity: Quantity? = nil,
    unitPrice: Money? = nil,
    factor: AsclepiusPrimitive<AsclepiusDecimal>? = nil,
    net: Money? = nil,
    noteNumber: [AsclepiusPrimitive<AsclepiusPositiveInteger>]? = nil,
    adjudication: [ClaimResponseItemAdjudication],
    subDetail: [ClaimResponseItemDetailSubDetail]? = nil
  ) {
    self.init(productOrService: productOrService, adjudication: adjudication)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.modifier = modifier
    self.quantity = quantity
    self.unitPrice = unitPrice
    self.factor = factor
    self.net = net
    self.noteNumber = noteNumber
    self.adjudication = adjudication
    self.subDetail = subDetail
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
    case subDetail
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.productOrService = try CodeableConcept(from: codingKeyContainer, forKey: .productOrService)
    self.modifier = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .modifier)
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.unitPrice = try Money(from: codingKeyContainer, forKeyIfPresent: .unitPrice)
    self.factor = try AsclepiusPrimitive<AsclepiusDecimal>(from: codingKeyContainer, forKeyIfPresent: .factor, auxKey: ._factor)
    self.net = try Money(from: codingKeyContainer, forKeyIfPresent: .net)
    self.noteNumber = try [AsclepiusPrimitive<AsclepiusPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .noteNumber, auxKey: ._noteNumber)
    self.adjudication = try [ClaimResponseItemAdjudication](from: codingKeyContainer, forKey: .adjudication)
    self.subDetail = try [ClaimResponseItemDetailSubDetail](from: codingKeyContainer, forKeyIfPresent: .subDetail)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try productOrService.encode(on: &codingKeyContainer, forKey: .productOrService)
    try modifier?.encode(on: &codingKeyContainer, forKey: .modifier)
    try quantity?.encode(on: &codingKeyContainer, forKey: .quantity)
    try unitPrice?.encode(on: &codingKeyContainer, forKey: .unitPrice)
    try factor?.encode(on: &codingKeyContainer, forKey: .factor, auxKey: ._factor)
    try net?.encode(on: &codingKeyContainer, forKey: .net)
    try noteNumber?.encode(on: &codingKeyContainer, forKey: .noteNumber, auxKey: ._noteNumber)
    try adjudication.encode(on: &codingKeyContainer, forKey: .adjudication)
    try subDetail?.encode(on: &codingKeyContainer, forKey: .subDetail)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseAddItemDetail else {
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
    && subDetail == _other.subDetail
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(productOrService)
    hasher.combine(modifier)
    hasher.combine(quantity)
    hasher.combine(unitPrice)
    hasher.combine(factor)
    hasher.combine(net)
    hasher.combine(noteNumber)
    hasher.combine(adjudication)
    hasher.combine(subDetail)
  }
}
