//
//  ChargeItemDefinitionPropertyGroupPriceComponent.swift
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
 The price for a `ChargeItem` may be calculated as a base price with surcharges/deductions that apply
 in certain conditions. A `ChargeItemDefinition` resource that defines the prices, factors, and
 condtions that apply to a billing code is currently under development. The `priceComponent` element
 can be used to offer transparency to the recipient of the `Invoice` of how the prices have been
 calculated
 */
open class ChargeItemDefinitionPropertyGroupPriceComponent: BackboneElement {
  /// This code identifies the type of the component
  public var type: AlexandriaHRMPrimitive<InvoicePriceComponentType>
  
  /// Code identifiying the specific component
  public var code: CodableConcept?
  
  /// Factor used for calculating this component
  public var factor: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>?
  
  /// Monetary amount associated with this component
  public var amount: Money?
  
  public init(type: AlexandriaHRMPrimitive<InvoicePriceComponentType>) {
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    type: AlexandriaHRMPrimitive<InvoicePriceComponentType>,
    code: CodableConcept? = nil,
    factor: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>? = nil,
    amount: Money? = nil
  ) {
    self.init(type: type)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
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
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try AlexandriaHRMPrimitive<InvoicePriceComponentType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.code = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .code)
    self.factor = try AlexandriaHRMPrimitive<AlexandriaHRMDecimal>(from: codingKeyContainer, forKeyIfPresent: .factor, auxKey: ._factor)
    self.amount = try Money(from: codingKeyContainer, forKeyIfPresent: .amount)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try code?.encode(on: &codingKeyContainer, forKey: .code)
    try factor?.encode(on: &codingKeyContainer, forKey: .factor, auxKey: ._factor)
    try amount?.encode(on: &codingKeyContainer, forKey: .amount)
    
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
