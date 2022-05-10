//
//  ClaimItem.swift
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
 A claim line containing either a simple item (a product or service) or a "group" of details which can be simple
 items or roups of sub-details
 */
open class ClaimItem: BackboneElement {
  public enum LocationX: Hashable {
    case address(Address)
    case codeableConcept(CodeableConcept)
    case reference(Reference)
  }
  
  public enum ServicedX: Hashable {
    case date(AsclepiusPrimitive<AsclepiusDate>)
    case period(Period)
  }
  
  /// Item instance identifier
  public var sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>
  
  /// Applicable `careTeam` members
  public var careTeamSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Applicable diagnoses
  public var diagnosisSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Applicable procedures
  public var procedureSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Applicable exception and supporting information
  public var informationSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Revenue or cost center code
  public var revenue: CodeableConcept?
  
  /// Benefit classification
  public var category: CodeableConcept?
  
  /// Billing, service, product, or drug code
  public var productOrService: CodeableConcept
  
  /// Product or service billing modifier
  public var modifier: [CodeableConcept]?
  
  /// Program that the product or service is provided under
  public var programCode: [CodeableConcept]?
  
  /// Date(s) of service or product delivery
  public var servicedX: ServicedX?
  
  /// Place of service or where product was supplied
  public var locationX: LocationX?
  
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
  
  /// Anatomical location
  public var bodySite: CodeableConcept?
  
  /// Anatomical sub-location
  public var subSite: [CodeableConcept]?
  
  /// Encounters related to this billed item
  public var encounter: [Reference]?
  
  /// Product or service provided
  public var detail: [ClaimItemDetail]?
  
  public init(sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>, productOrService: CodeableConcept) {
    self.sequence = sequence
    self.productOrService = productOrService
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>,
    careTeamSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]? = nil,
    diagnosisSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]? = nil,
    procedureSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]? = nil,
    informationSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]? = nil,
    revenue: CodeableConcept? = nil,
    category: CodeableConcept? = nil,
    productOrService: CodeableConcept,
    modifier: [CodeableConcept]? = nil,
    programCode: [CodeableConcept]? = nil,
    servicedX: ServicedX? = nil,
    locationX: LocationX? = nil,
    quantity: Quantity? = nil,
    unitPrice: Money? = nil,
    factor: AsclepiusPrimitive<AsclepiusDecimal>? = nil,
    net: Money? = nil,
    udi: [Reference]? = nil,
    bodySite: CodeableConcept? = nil,
    subSite: [CodeableConcept]? = nil,
    encounter: [Reference]? = nil,
    detail: [ClaimItemDetail]? = nil
  ) {
    self.init(sequence: sequence, productOrService: productOrService)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.careTeamSequence = careTeamSequence
    self.diagnosisSequence = diagnosisSequence
    self.procedureSequence = procedureSequence
    self.informationSequence = informationSequence
    self.revenue = revenue
    self.category = category
    self.modifier = modifier
    self.programCode = programCode
    self.servicedX = servicedX
    self.locationX = locationX
    self.quantity = quantity
    self.unitPrice = unitPrice
    self.factor = factor
    self.net = net
    self.udi = udi
    self.bodySite = bodySite
    self.subSite = subSite
    self.encounter = encounter
    self.detail = detail
  }
  
  // MARK: - Coding
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case careTeamSequence; case _careTeamSequence
    case diagnosisSequence; case _diagnosisSequence
    case procedureSequence; case _procedureSequence
    case informationSequence; case _informationSequence
    case revenue
    case category
    case productOrService
    case modifier
    case programCode
    case servicedDate; case _servicedDate
    case servicedPeriod
    case locationAddress
    case locationCodeableConcept
    case locationReference
    case quantity
    case unitPrice
    case factor; case _factor
    case net
    case udi
    case bodySite
    case subSite
    case encounter
    case detail
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempServicedX: ServicedX?
    if let servicedDate = try AsclepiusPrimitive<AsclepiusDate>(from: codingKeyContainer, forKeyIfPresent: .servicedDate, auxKey: ._servicedDate) {
      if tempServicedX != nil {
        throw DecodingError.dataCorruptedError(forKey: .servicedDate, in: codingKeyContainer, debugDescription: "More than one value supplied for \"serviced\"")
      }
      tempServicedX = .date(servicedDate)
    }
    
    if let servicedPeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .servicedPeriod) {
      if tempServicedX != nil {
        throw DecodingError.dataCorruptedError(forKey: .servicedPeriod, in: codingKeyContainer, debugDescription: "More than one value supplied for \"serviced\"")
      }
      tempServicedX = .period(servicedPeriod)
    }
    
    var tempLocationX: LocationX?
    if let locationAddress = try Address(from: codingKeyContainer, forKeyIfPresent: .locationAddress) {
      if tempLocationX != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationAddress, in: codingKeyContainer, debugDescription: "More than one value supplied for \"location\"")
      }
      tempLocationX = .address(locationAddress)
    }
    
    if let locationCodeableConcept = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .locationCodeableConcept) {
      if tempLocationX != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationCodeableConcept, in: codingKeyContainer, debugDescription: "More than one value supplied for \"location\"")
      }
      tempLocationX = .codeableConcept(locationCodeableConcept)
    }
    
    if let locationReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .locationReference) {
      if tempLocationX != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationReference, in: codingKeyContainer, debugDescription: "More than one value supplied for \"location\"")
      }
      tempLocationX = .reference(locationReference)
    }
    
    self.sequence = try AsclepiusPrimitive<AsclepiusPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.careTeamSequence = try [AsclepiusPrimitive<AsclepiusPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .careTeamSequence, auxKey: ._careTeamSequence)
    self.diagnosisSequence = try [AsclepiusPrimitive<AsclepiusPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .diagnosisSequence, auxKey: ._diagnosisSequence)
    self.procedureSequence = try [AsclepiusPrimitive<AsclepiusPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .procedureSequence, auxKey: ._procedureSequence)
    self.informationSequence = try [AsclepiusPrimitive<AsclepiusPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .informationSequence, auxKey: ._informationSequence)
    self.revenue = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .revenue)
    self.category = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .category)
    self.productOrService = try CodeableConcept(from: codingKeyContainer, forKey: .productOrService)
    self.modifier = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .modifier)
    self.programCode = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .programCode)
    self.servicedX = tempServicedX
    self.locationX = tempLocationX
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.unitPrice = try Money(from: codingKeyContainer, forKeyIfPresent: .unitPrice)
    self.factor = try AsclepiusPrimitive<AsclepiusDecimal>(from: codingKeyContainer, forKeyIfPresent: .factor, auxKey: ._factor)
    self.net = try Money(from: codingKeyContainer, forKeyIfPresent: .net)
    self.udi = try [Reference](from: codingKeyContainer, forKeyIfPresent: .udi)
    self.bodySite = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .bodySite)
    self.subSite = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .subSite)
    self.encounter = try [Reference](from: codingKeyContainer, forKeyIfPresent: .encounter)
    self.detail = try [ClaimItemDetail](from: codingKeyContainer, forKeyIfPresent: .detail)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumServicedX = servicedX {
      switch enumServicedX {
      case .date(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .servicedDate, auxKey: ._servicedDate)
      case .period(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .servicedPeriod)
      }
    }
    
    if let enumLocationX = locationX {
      switch enumLocationX {
      case .address(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .locationAddress)
      case .codeableConcept(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .locationCodeableConcept)
      case .reference(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .locationReference)
      }
    }
    
    try sequence.encode(on: &codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    try careTeamSequence?.encode(on: &codingKeyContainer, forKey: .careTeamSequence, auxKey: ._careTeamSequence)
    try diagnosisSequence?.encode(on: &codingKeyContainer, forKey: .diagnosisSequence, auxKey: ._diagnosisSequence)
    try procedureSequence?.encode(on: &codingKeyContainer, forKey: .procedureSequence, auxKey: ._procedureSequence)
    try informationSequence?.encode(on: &codingKeyContainer, forKey: .informationSequence, auxKey: ._informationSequence)
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
    try bodySite?.encode(on: &codingKeyContainer, forKey: .bodySite)
    try subSite?.encode(on: &codingKeyContainer, forKey: .subSite)
    try encounter?.encode(on: &codingKeyContainer, forKey: .encounter)
    try detail?.encode(on: &codingKeyContainer, forKey: .detail)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimItem else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return sequence == _other.sequence
    && careTeamSequence == _other.careTeamSequence
    && diagnosisSequence == _other.diagnosisSequence
    && procedureSequence == _other.procedureSequence
    && informationSequence == _other.informationSequence
    && revenue == _other.revenue
    && category == _other.category
    && productOrService == _other.productOrService
    && modifier == _other.modifier
    && programCode == _other.programCode
    && servicedX == _other.servicedX
    && locationX == _other.locationX
    && quantity == _other.quantity
    && unitPrice == _other.unitPrice
    && factor == _other.factor
    && net == _other.net
    && udi == _other.udi
    && bodySite == _other.bodySite
    && subSite == _other.subSite
    && encounter == _other.encounter
    && detail == _other.detail
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(careTeamSequence)
    hasher.combine(diagnosisSequence)
    hasher.combine(procedureSequence)
    hasher.combine(informationSequence)
    hasher.combine(revenue)
    hasher.combine(category)
    hasher.combine(productOrService)
    hasher.combine(modifier)
    hasher.combine(programCode)
    hasher.combine(servicedX)
    hasher.combine(locationX)
    hasher.combine(quantity)
    hasher.combine(unitPrice)
    hasher.combine(factor)
    hasher.combine(net)
    hasher.combine(bodySite)
    hasher.combine(subSite)
    hasher.combine(encounter)
    hasher.combine(detail)
  }
}
