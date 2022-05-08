//
//  CoverageEligibilityRequestItem.swift
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
 Item to be evaluated for eligibility; Service categories or billable services for which benefit details and/or
 an authorization prior to service delivery may be required by the payor.
 */
open class CoverageEligibilityRequestItem: BackboneElement {
  /// Applicable exception or supporting information
  public var supportingInfoSequence: [AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>]?
  
  /// Benefit classification
  public var category: CodableConcept?
  
  /// Billing, service, product, or drug code
  public var productOrService: CodableConcept?
  
  /// Product or service billing modifiers
  public var modifier: [CodableConcept]?
  
  /// Performing practitioner
  public var provider: Reference?
  
  /// Count of products or services
  public var quantity: Quantity?
  
  /// Fee, charge, or cost per item
  public var unitPrice: Money?
  
  /// Servicing facility
  public var facility: Reference?
  
  /// Applicable diagnosis
  public var diagnosis: [CoverageEligibilityRequestItemDiagnosis]?
  
  /// Product or service details
  public var detail: [Reference]?
  
  public override init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    supportingInfoSequence: [AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>]? = nil,
    category: CodableConcept? = nil,
    productOrService: CodableConcept? = nil,
    modifier: [CodableConcept]? = nil,
    provider: Reference? = nil,
    quantity: Quantity? = nil,
    facility: Reference? = nil,
    diagnosis: [CoverageEligibilityRequestItemDiagnosis]? = nil,
    detail: [Reference]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.supportingInfoSequence = supportingInfoSequence
    self.category = category
    self.productOrService = productOrService
    self.modifier = modifier
    self.provider = provider
    self.quantity = quantity
    self.facility = facility
    self.diagnosis = diagnosis
    self.detail = detail
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case supportingInfoSequence; case _supportingInfoSequence
    case category
    case productOrService
    case modifier
    case provider
    case quantity
    case facility
    case diagnosis
    case detail
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.supportingInfoSequence = try [AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .supportingInfoSequence, auxKey: ._supportingInfoSequence)
    self.category = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .category)
    self.productOrService = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .productOrService)
    self.modifier = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .modifier)
    self.provider = try Reference(from: codingKeyContainer, forKeyIfPresent: .provider)
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.facility = try Reference(from: codingKeyContainer, forKeyIfPresent: .facility)
    self.diagnosis = try [CoverageEligibilityRequestItemDiagnosis](from: codingKeyContainer, forKeyIfPresent: .diagnosis)
    self.detail = try [Reference](from: codingKeyContainer, forKeyIfPresent: .detail)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try supportingInfoSequence?.encode(on: &codingKeyContainer, forKey: .supportingInfoSequence, auxKey: ._supportingInfoSequence)
    try category?.encode(on: &codingKeyContainer, forKey: .category)
    try modifier?.encode(on: &codingKeyContainer, forKey: .modifier)
    try provider?.encode(on: &codingKeyContainer, forKey: .provider)
    try quantity?.encode(on: &codingKeyContainer, forKey: .quantity)
    try facility?.encode(on: &codingKeyContainer, forKey: .facility)
    try diagnosis?.encode(on: &codingKeyContainer, forKey: .diagnosis)
    try detail?.encode(on: &codingKeyContainer, forKey: .detail)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CoverageEligibilityRequestItem else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return supportingInfoSequence == _other.supportingInfoSequence
    && category == _other.category
    && modifier == _other.modifier
    && provider == _other.provider
    && quantity == _other.quantity
    && facility == _other.facility
    && diagnosis == _other.diagnosis
    && detail == _other.detail
  }
  
  // MARK: - Hashable
}
