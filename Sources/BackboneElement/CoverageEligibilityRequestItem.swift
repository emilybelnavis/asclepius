//
//  CoverageEligibilityRequestItem.swift
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
 Item to be evaluated for eligibility; Service categories or billable services for which benefit details and/or
 an authorization prior to service delivery may be required by the payor.
 */
open class CoverageEligibilityRequestItem: BackboneElement {
  /// Applicable exception or supporting information
  public var supportingInfoSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]?
  
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
  public var diagnosis: [CoverageEligilbilityRequestItemDiagnosis]?
  
  /// Product or service details
  public var detail: [Reference]?
  
  public override init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    supportingInfoSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    category: CodableConcept? = nil,
    productOrService: CodableConcept? = nil,
    modifier: [CodableConcept]? = nil,
    provider: Reference? = nil,
    quantity: Quantity? = nil,
    facility: Reference? = nil,
    diagnosis: [CoverageEligibilityRequestItem]? = nil,
    detail: [Reference]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
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
    
    self.supportingInfoSequence = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .supportingInfoSequence, auxKey: ._supportingInfoSequence)
    self.category = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .category)
    self.productOrService = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .productOrService)
    self.modifier = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .modifier)
    self.provider = try Reference(from: codingKeyContainer, forKeyIfPresent: .provider)
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.facility = try Reference(from: codingKeyContainer, forKeyIfPresent: .facility)
    self.diagnosis = try [CoverageEligibilityRequestItem](from: codingKeyContainer, forKeyIfPresent: .diagnosis)
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
