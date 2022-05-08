//
//  ChargeItemDefinitionPropertyGroup.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/**
 Group of properties which are applicable under the same conditions. If no applicability rules are established
 for the group, then all properties always apply.
 */
open class ChargeItemDefinitionPropertyGroup: BackboneElement {
  /// Conditoins under which the `priceComponent` is applicable
  public var applicability: [ChargeItemDefinitionApplicability]?
  
  /// Components of total line item price
  public var priceComponent: [ChargeItemDefinitionPropertyGroupPriceComponent]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    applicability: [ChargeItemDefinitionApplicability]? = nil,
    priceComponent: [ChargeItemDefinitionPropertyGroupPriceComponent]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.applicability = applicability
    self.priceComponent = priceComponent
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case applicability
    case priceComponent
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.applicability = try [ChargeItemDefinitionApplicability](from: codingKeyContainer, forKeyIfPresent: .applicability)
    self.priceComponent = try [ChargeItemDefinitionPropertyGroupPriceComponent](from: codingKeyContainer, forKeyIfPresent: .priceComponent)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try applicability?.encode(on: &codingKeyContainer, forKey: .applicability)
    try priceComponent?.encode(on: &codingKeyContainer, forKey: .priceComponent)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ChargeItemDefinitionPropertyGroup else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return applicability == _other.applicability
    && priceComponent == _other.priceComponent
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(applicability)
    hasher.combine(priceComponent)
  }
}
