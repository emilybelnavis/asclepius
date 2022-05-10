//
//  CoverageEligibilityResponseInsuranceItem.swift
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
 Benefits and authorization details; Benefits and optionally current balances, and authorization details by
 category or service
 */
open class CoverageEligibilityResponseInsuranceItem: BackboneElement {
  /// Benefit classification
  public var category: CodeableConcept?
  
  /// Billing, service, product, or drug code
  public var productOrService: CodeableConcept?
  
  /// Product or service billing modifiers
  public var modifier: [CodeableConcept]?
  
  /// Performing practitioner
  public var provider: Reference?
  
  /// Excluded from the plan
  public var excluded: AsclepiusPrimitive<AsclepiusBool>?
  
  /// Short name for the benefit
  public var name: AsclepiusPrimitive<AsclepiusString>?
  
  /// Description of the benefit or services covered
  public var fhirDescription: AsclepiusPrimitive<AsclepiusString>?
  
  /// In or out of network
  public var network: CodeableConcept?
  
  /// Individual or family benefit
  public var unit: CodeableConcept?
  
  /// Annual or lifetime benefit
  public var term: CodeableConcept?
  
  /// Benefit summary
  public var benefit: [CoverageEligibilityResponseInsuranceItemBenefit]?
  
  /// Authorization required flag
  public var authorizationRequired: AsclepiusPrimitive<AsclepiusBool>?
  
  /// Type of required supporting materials
  public var authorizationSupporting: [CodeableConcept]?
  
  /// Pre-authorization requirements endpoint
  public var authorizationUrl: AsclepiusPrimitive<AsclepiusURI>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    category: CodeableConcept? = nil,
    productOrService: CodeableConcept? = nil,
    modifier: [CodeableConcept]? = nil,
    provider: Reference? = nil,
    excluded: AsclepiusPrimitive<AsclepiusBool>? = nil,
    name: AsclepiusPrimitive<AsclepiusString>? = nil,
    fhirDescription: AsclepiusPrimitive<AsclepiusString>? = nil,
    network: CodeableConcept? = nil,
    unit: CodeableConcept? = nil,
    term: CodeableConcept? = nil,
    benefit: [CoverageEligibilityResponseInsuranceItemBenefit]? = nil,
    authorizationRequired: AsclepiusPrimitive<AsclepiusBool>? = nil,
    authorizationSupporting: [CodeableConcept]? = nil,
    authorizationUrl: AsclepiusPrimitive<AsclepiusURI>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.category = category
    self.productOrService = productOrService
    self.modifier = modifier
    self.provider = provider
    self.excluded = excluded
    self.name = name
    self.fhirDescription = fhirDescription
    self.network = network
    self.unit = unit
    self.term = term
    self.benefit = benefit
    self.authorizationRequired = authorizationRequired
    self.authorizationSupporting = authorizationSupporting
    self.authorizationUrl = authorizationUrl
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case category
    case productOrService
    case modifier
    case provider
    case excluded; case _excluded
    case name; case _name
    case fhirDescription; case _fhirDescription
    case network
    case unit
    case term
    case benefit
    case authorizationRequired; case _authorizationRequired
    case authorizationSupporting
    case authorizationUrl; case _authorizationUrl
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.category = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .category)
    self.productOrService = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .productOrService)
    self.modifier = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .modifier)
    self.provider = try Reference(from: codingKeyContainer, forKeyIfPresent: .provider)
    self.excluded = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .excluded, auxKey: ._excluded)
    self.name = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .name, auxKey: ._name)
    self.fhirDescription = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.network = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .network)
    self.unit = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .unit)
    self.term = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .term)
    self.benefit = try [CoverageEligibilityResponseInsuranceItemBenefit](from: codingKeyContainer, forKeyIfPresent: .benefit)
    self.authorizationRequired = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .authorizationRequired, auxKey: ._authorizationRequired)
    self.authorizationSupporting = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .authorizationSupporting)
    self.authorizationUrl = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .authorizationUrl, auxKey: ._authorizationUrl)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try category?.encode(on: &codingKeyContainer, forKey: .category)
    try productOrService?.encode(on: &codingKeyContainer, forKey: .productOrService)
    try modifier?.encode(on: &codingKeyContainer, forKey: .modifier)
    try provider?.encode(on: &codingKeyContainer, forKey: .provider)
    try excluded?.encode(on: &codingKeyContainer, forKey: .excluded, auxKey: ._excluded)
    try name?.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try network?.encode(on: &codingKeyContainer, forKey: .network)
    try unit?.encode(on: &codingKeyContainer, forKey: .unit)
    try term?.encode(on: &codingKeyContainer, forKey: .term)
    try benefit?.encode(on: &codingKeyContainer, forKey: .benefit)
    try authorizationRequired?.encode(on: &codingKeyContainer, forKey: .authorizationRequired, auxKey: ._authorizationRequired)
    try authorizationSupporting?.encode(on: &codingKeyContainer, forKey: .authorizationSupporting)
    try authorizationUrl?.encode(on: &codingKeyContainer, forKey: .authorizationUrl, auxKey: ._authorizationUrl)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CoverageEligibilityResponseInsuranceItem else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return category == _other.category
    && productOrService == _other.productOrService
    && modifier == _other.modifier
    && provider == _other.provider
    && excluded == _other.excluded
    && name == _other.name
    && fhirDescription == _other.fhirDescription
    && network == _other.network
    && unit == _other.unit
    && term == _other.term
    && benefit == _other.benefit
    && authorizationRequired == _other.authorizationRequired
    && authorizationSupporting == _other.authorizationSupporting
    && authorizationUrl == _other.authorizationUrl
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(category)
    hasher.combine(productOrService)
    hasher.combine(modifier)
    hasher.combine(provider)
    hasher.combine(excluded)
    hasher.combine(name)
    hasher.combine(fhirDescription)
    hasher.combine(network)
    hasher.combine(unit)
    hasher.combine(term)
    hasher.combine(benefit)
    hasher.combine(authorizationRequired)
    hasher.combine(authorizationSupporting)
    hasher.combine(authorizationUrl)
  }
}
