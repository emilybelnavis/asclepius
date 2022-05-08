//
//  ContractTermAssetValuedItem.swift
//  FHIRKit
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

import FHIRKitCore

/// Contract Valued Item List
open class ContractTermAssetValuedItem: BackboneElement {
  public enum EntityX: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  /// Contract Valued Item Type
  public var entity: EntityX?
  
  /// Contract Valued Item Number
  public var identifier: Identifier?
  
  /// Contract Valued Item Effective Time
  public var effectiveTime: FHIRKitPrimitive<FHIRKitDateTime>?
  
  /// Count of Contract Valued Items
  public var quantity: Quantity?
  
  /// Contract Valued Item fee, charge, or cost
  public var unitPrice: Money?
  
  /// Contract Valued Item Price Scaling Factor
  public var factor: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// Contract Valued Item Difficulty Scaling Factor
  public var points: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// Total Contract Valued Item Value
  public var net: Money?
  
  /// Terms of valuation
  public var payment: FHIRKitPrimitive<FHIRKitString>?
  
  /// When payment is due
  public var paymentDate: FHIRKitPrimitive<FHIRKitDateTime>?
  
  /// Who is responsible for making payment(s)
  public var responsible: Reference?
  
  /// Who will be receiving the payment
  public var recipient: Reference?
  
  /// Pointer to specific item
  public var linkId: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// Security labels that define affected terms
  public var securityLabelNumber: [FHIRKitPrimitive<FHIRKitUnsignedInteger>]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    entity: EntityX? = nil,
    identifier: Identifier? = nil,
    effectiveTime: FHIRKitPrimitive<FHIRKitDateTime>? = nil,
    quantity: Quantity? = nil,
    unitPrice: Money? = nil,
    factor: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    points: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    net: Money? = nil,
    payment: FHIRKitPrimitive<FHIRKitString>? = nil,
    responsible: Reference? = nil,
    recipient: Reference? = nil,
    linkId: [FHIRKitPrimitive<FHIRKitString>]? = nil,
    securityLabelNumber: [FHIRKitPrimitive<FHIRKitUnsignedInteger>]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.entity = entity
    self.identifier = identifier
    self.effectiveTime = effectiveTime
    self.quantity = quantity
    self.unitPrice = unitPrice
    self.factor = factor
    self.points = points
    self.net = net
    self.payment = payment
    self.responsible = responsible
    self.recipient = recipient
    self.linkId = linkId
    self.securityLabelNumber = securityLabelNumber
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case entityCodableConcept
    case entityReference
    case identifier
    case effectiveTime; case _effectiveTime
    case quantity
    case unitPrice
    case factor; case _factor
    case points; case _points
    case net
    case payment; case _payment
    case responsible
    case recipient
    case linkId; case _linkId
    case securityLabelNumber; case _securityLabelNumber
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tEntity: EntityX?
    if let entityCodableConcept = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .entityCodableConcept) {
      if tEntity != nil {
        throw DecodingError.dataCorruptedError(forKey: .entityCodableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"entity\"")
      }
      tEntity = .codableConcept(entityCodableConcept)
    }
    
    if let entityReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .entityReference) {
      if tEntity != nil {
        throw DecodingError.dataCorruptedError(forKey: .entityReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"entity\"")
      }
      tEntity = .reference(entityReference)
    }
    
    self.entity = tEntity
    self.identifier = try Identifier(from: codingKeyContainer, forKeyIfPresent: .identifier)
    self.effectiveTime = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .effectiveTime, auxKey: ._effectiveTime)
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.unitPrice = try Money(from: codingKeyContainer, forKeyIfPresent: .unitPrice)
    self.factor = try FHIRKitPrimitive<FHIRKitDecimal>(from: codingKeyContainer, forKeyIfPresent: .factor, auxKey: ._factor)
    self.points = try FHIRKitPrimitive<FHIRKitDecimal>(from: codingKeyContainer, forKeyIfPresent: .points, auxKey: ._points)
    self.net = try Money(from: codingKeyContainer, forKeyIfPresent: .net)
    self.payment = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .payment, auxKey: ._payment)
    self.responsible = try Reference(from: codingKeyContainer, forKeyIfPresent: .responsible)
    self.recipient = try Reference(from: codingKeyContainer, forKeyIfPresent: .recipient)
    self.linkId = try [FHIRKitPrimitive<FHIRKitString>](from: codingKeyContainer, forKeyIfPresent: .linkId, auxKey: ._linkId)
    self.securityLabelNumber = try [FHIRKitPrimitive<FHIRKitUnsignedInteger>](from: codingKeyContainer, forKeyIfPresent: .securityLabelNumber, auxKey: ._securityLabelNumber)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let entityEnum = entity {
      switch entityEnum {
      case .codableConcept(let codableConcept):
        try codableConcept.encode(on: &codingKeyContainer, forKey: .entityCodableConcept)
      case .reference(let reference):
        try reference.encode(on: &codingKeyContainer, forKey: .entityReference)
      }
    }
    
    try identifier?.encode(on: &codingKeyContainer, forKey: .identifier)
    try effectiveTime?.encode(on: &codingKeyContainer, forKey: .effectiveTime, auxKey: ._effectiveTime)
    try quantity?.encode(on: &codingKeyContainer, forKey: .quantity)
    try unitPrice?.encode(on: &codingKeyContainer, forKey: .unitPrice)
    try factor?.encode(on: &codingKeyContainer, forKey: .factor, auxKey: ._factor)
    try points?.encode(on: &codingKeyContainer, forKey: .points, auxKey: ._points)
    try net?.encode(on: &codingKeyContainer, forKey: .net)
    try payment?.encode(on: &codingKeyContainer, forKey: .payment, auxKey: ._payment)
    try responsible?.encode(on: &codingKeyContainer, forKey: .responsible)
    try recipient?.encode(on: &codingKeyContainer, forKey: .recipient)
    try linkId?.encode(on: &codingKeyContainer, forKey: .linkId, auxKey: ._linkId)
    try securityLabelNumber?.encode(on: &codingKeyContainer, forKey: .securityLabelNumber, auxKey: ._securityLabelNumber)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContractTermAssetValuedItem else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return entity == _other.entity
    && identifier == _other.identifier
    && effectiveTime == _other.effectiveTime
    && quantity == _other.quantity
    && unitPrice == _other.unitPrice
    && factor == _other.factor
    && points == _other.points
    && net == _other.net
    && payment == _other.payment
    && responsible == _other.responsible
    && recipient == _other.recipient
    && linkId == _other.linkId
    && securityLabelNumber == _other.securityLabelNumber
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(entity)
    hasher.combine(identifier)
    hasher.combine(effectiveTime)
    hasher.combine(quantity)
    hasher.combine(unitPrice)
    hasher.combine(factor)
    hasher.combine(points)
    hasher.combine(net)
    hasher.combine(payment)
    hasher.combine(responsible)
    hasher.combine(recipient)
    hasher.combine(linkId)
    hasher.combine(securityLabelNumber)
  }
}
