//
//  ClaimItem.swift
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
 A claim line containing either a simple item (a product or service) or a "group" of details which can be simple
 items or roups of sub-details
 */
open class ClaimItem: BackboneElement {
  public enum LocationX: Hashable {
    case address(Address)
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  public enum ServicedX: Hashable {
    case date(FHIRKitPrimitive<FHIRKitDate>)
    case period(Period)
  }
  
  /// Item instance identifier
  public var sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// Applicable `careTeam` members
  public var careTeamSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]?
  
  /// Applicable diagnoses
  public var diagnosisSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]?
  
  /// Applicable procedures
  public var procedureSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]?
  
  /// Applicable exception and supporting information
  public var informationSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]?
  
  /// Revenue or cost center code
  public var revenue: CodableConcept?
  
  /// Benefit classification
  public var category: CodableConcept?
  
  /// Billing, service, product, or drug code
  public var productOrService: CodableConcept
  
  /// Product or service billing modifier
  public var modifier: [CodableConcept]?
  
  /// Program that the product or service is provided under
  public var programCode: [CodableConcept]?
  
  /// Date(s) of service or product delivery
  public var servicedX: ServicedX?
  
  /// Place of service or where product was supplied
  public var locationX: LocationX?
  
  /// Count of products or services
  public var quantity: Quantity?
  
  /// Fee, charge, or cost per item
  public var unitPrice: Money?
  
  /// Price scaling factor
  public var factor: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// Total item cost
  public var net: Money?
  
  /// Unique device identifier
  public var udi: [Reference]?
  
  /// Anatomical location
  public var bodySite: CodableConcept?
  
  /// Anatomical sub-location
  public var subSite: [CodableConcept]?
  
  /// Encounters related to this billed item
  public var encounter: [Reference]?
  
  /// Product or service provided
  public var detail: [ClaimItemDetail]?
  
  public init(sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>, productOrService: CodableConcept) {
    self.sequence = sequence
    self.productOrService = productOrService
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>,
    careTeamSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    diagnosisSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    procedureSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    informationSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    revenue: CodableConcept? = nil,
    category: CodableConcept? = nil,
    productOrService: CodableConcept,
    modifier: [CodableConcept]? = nil,
    programCode: [CodableConcept]? = nil,
    servicedX: ServicedX? = nil,
    locationX: LocationX? = nil,
    quantity: Quantity? = nil,
    unitPrice: Money? = nil,
    factor: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    net: Money? = nil,
    udi: [Reference]? = nil,
    bodySite: CodableConcept? = nil,
    subSite: [CodableConcept]? = nil,
    encounter: [Reference]? = nil,
    detail: [ClaimItemDetail]? = nil
  ) {
    self.init(sequence: sequence, productOrService: productOrService)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
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
    case locationCodableConcept
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
    if let servicedDate = try FHIRKitPrimitive<FHIRKitDate>(from: codingKeyContainer, forKeyIfPresent: .servicedDate, auxKey: ._servicedDate) {
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
    
    if let locationCodableConcept = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .locationCodableConcept) {
      if tempLocationX != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationCodableConcept, in: codingKeyContainer, debugDescription: "More than one value supplied for \"location\"")
      }
      tempLocationX = .codableConcept(locationCodableConcept)
    }
    
    if let locationReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .locationReference) {
      if tempLocationX != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationReference, in: codingKeyContainer, debugDescription: "More than one value supplied for \"location\"")
      }
      tempLocationX = .reference(locationReference)
    }
    
    self.sequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.careTeamSequence = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .careTeamSequence, auxKey: ._careTeamSequence)
    self.diagnosisSequence = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .diagnosisSequence, auxKey: ._diagnosisSequence)
    self.procedureSequence = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .procedureSequence, auxKey: ._procedureSequence)
    self.informationSequence = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .informationSequence, auxKey: ._informationSequence)
    self.revenue = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .revenue)
    self.category = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .category)
    self.productOrService = try CodableConcept(from: codingKeyContainer, forKey: .productOrService)
    self.modifier = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .modifier)
    self.programCode = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .programCode)
    self.servicedX = tempServicedX
    self.locationX = tempLocationX
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.unitPrice = try Money(from: codingKeyContainer, forKeyIfPresent: .unitPrice)
    self.factor = try FHIRKitPrimitive<FHIRKitDecimal>(from: codingKeyContainer, forKeyIfPresent: .factor, auxKey: ._factor)
    self.net = try Money(from: codingKeyContainer, forKeyIfPresent: .net)
    self.udi = try [Reference](from: codingKeyContainer, forKeyIfPresent: .udi)
    self.bodySite = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .bodySite)
    self.subSite = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .subSite)
    self.encounter = try [Reference](from: codingKeyContainer, forKeyIfPresent: .encounter)
    self.detail = try [ClaimItemDetail](from: codingKeyContainer, forKeyIfPresent: .detail)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
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
      case .codableConcept(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .locationCodableConcept)
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
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
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
