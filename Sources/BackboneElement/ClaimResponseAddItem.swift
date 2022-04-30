//
//  ClaimResponseAddItem.swift
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
 Insurer added line items; The first-tier service adjudication for payor added product or service lines
 */
open class ClaimResponseAddItem: BackboneElement {
  public enum ServicedX: Hashable {
    case date(FHIRKitPrimitive<FHIRKitDate>)
    case period(Period)
  }
  public enum LocationX: Hashable {
    case address(Address)
    case codableConcept(CodableConcept)
    case reference(Reference)
  }

  /// Item sequence number
  public var itemSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]?
  
  /// Detail sequence number
  public var detailSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]?
  
  /// Subdetail sequence number
  public var subdetailSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]?
  
  /// Authorized provider
  public var provider: [Reference]?
  
  /// Billing, service, product, or drug code
  public var productOrService: CodableConcept
  
  /// Service/product billing modifiers
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
  
  /// Anatomical location
  public var bodySite: CodableConcept?
  
  /// Anatomical sub-location
  public var subSite: [CodableConcept]?
  
  /// Applicable note numbers
  public var noteNumber: [FHIRKitPrimitive<FHIRKitPositiveInteger>]?
  
  /// Added Items adjudication
  public var adjudication: [ClaimResponseItemAdjudication]
  
  /// Insurer added line details
  public var detail: [ClaimResponseAddItemDetail]?
  
  public init(productOrService: CodableConcept, adjudication: [ClaimResponseItemAdjudication]) {
    self.productOrService = productOrService
    self.adjudication = adjudication
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    itemSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    detailSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    subdetailSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    provider: [Reference]? = nil,
    productOrService: CodableConcept,
    modifier: [CodableConcept]? = nil,
    programCode: [CodableConcept]? = nil,
    servicedX: ServicedX? = nil,
    locationX: LocationX? = nil,
    quantity: Quantity? = nil,
    unitPrice: Money? = nil,
    factor: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    net: Money? = nil,
    bodySite: CodableConcept? = nil,
    subSite: [CodableConcept]? = nil,
    noteNumber: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    adjudication: [ClaimResponseItemAdjudication],
    detail: [ClaimResponseAddItemDetail]? = nil
  ) {
    self.init(productOrService: productOrService, adjudication: adjudication)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.itemSequence = itemSequence
    self.detailSequence = detailSequence
    self.subdetailSequence = subdetailSequence
    self.provider = provider
    self.modifier = modifier
    self.servicedX = servicedX
    self.locationX = locationX
    self.quantity = quantity
    self.unitPrice = unitPrice
    self.factor = factor
    self.net = net
    self.bodySite = bodySite
    self.subSite = subSite
    self.noteNumber = noteNumber
    self.detail = detail
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case itemSequence; case _itemSequence
    case detailSequence; case _detailSequence
    case subdetailSequence; case _subdetailSequence
    case provider
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
    case bodySite
    case subSite
    case noteNumber; case _noteNumber
    case adjudication
    case detail
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempServicedX: ServicedX?
    if let servicedDate = try FHIRKitPrimitive<FHIRKitDate>(from: codingKeyContainer, forKeyIfPresent: .servicedDate) {
      if tempServicedX != nil {
        throw DecodingError.dataCorruptedError(forKey: .servicedDate, in: codingKeyContainer, debugDescription: "More than one value provided for \"serviced\"")
      }
      tempServicedX = .date(servicedDate)
    }
    
    if let servicedPeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .servicedPeriod) {
      if tempServicedX != nil {
        throw DecodingError.dataCorruptedError(forKey: .servicedPeriod, in: codingKeyContainer, debugDescription: "More than one value provided for \"serviced\"")
      }
      tempServicedX = .period(servicedPeriod)
    }
    
    var tempLocationX: LocationX?
    if let locationAddress = try Address(from: codingKeyContainer, forKeyIfPresent: .locationAddress) {
      if tempLocationX != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationAddress, in: codingKeyContainer, debugDescription: "More than one value provided for \"location\"")
      }
      tempLocationX = .address(locationAddress)
    }
    
    if let locationCodableConcept = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .locationCodableConcept) {
      if tempLocationX != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationCodableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"location\"")
      }
      tempLocationX = .codableConcept(locationCodableConcept)
    }
    
    if let locationReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .locationReference) {
      if tempLocationX != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"location\"")
      }
      tempLocationX = .reference(locationReference)
    }
    
    self.itemSequence = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .itemSequence, auxKey: ._itemSequence)
    self.detailSequence = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .detailSequence, auxKey: ._detailSequence)
    self.subdetailSequence = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .subdetailSequence, auxKey: ._subdetailSequence)
    self.provider = try [Reference](from: codingKeyContainer, forKeyIfPresent: .provider)
    self.productOrService = try CodableConcept(from: codingKeyContainer, forKey: .productOrService)
    self.modifier = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .modifier)
    self.programCode = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .programCode)
    self.servicedX = tempServicedX
    self.locationX = tempLocationX
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.unitPrice = try Money(from: codingKeyContainer, forKeyIfPresent: .unitPrice)
    self.factor = try FHIRKitPrimitive<FHIRKitDecimal>(from: codingKeyContainer, forKeyIfPresent: .factor, auxKey: ._factor)
    self.net = try Money(from: codingKeyContainer, forKeyIfPresent: .net)
    self.bodySite = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .bodySite)
    self.subSite = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .subSite)
    self.noteNumber = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: codingKeyContainer, forKey: .noteNumber, auxKey: ._noteNumber)
    self.adjudication = try [ClaimResponseItemAdjudication](from: codingKeyContainer, forKey: .adjudication)
    self.detail = try [ClaimResponseAddItemDetail](from: codingKeyContainer, forKeyIfPresent: .detail)
    
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
    
    try itemSequence?.encode(on: &codingKeyContainer, forKey: .itemSequence, auxKey: ._itemSequence)
    try detailSequence?.encode(on: &codingKeyContainer, forKey: .detailSequence, auxKey: ._detailSequence)
    try subdetailSequence?.encode(on: &codingKeyContainer, forKey: .subdetailSequence, auxKey: ._subdetailSequence)
    try provider?.encode(on: &codingKeyContainer, forKey: .provider)
    try productOrService.encode(on: &codingKeyContainer, forKey: .productOrService)
    try modifier?.encode(on: &codingKeyContainer, forKey: .modifier)
    try programCode?.encode(on: &codingKeyContainer, forKey: .programCode)
    try quantity?.encode(on: &codingKeyContainer, forKey: .quantity)
    try unitPrice?.encode(on: &codingKeyContainer, forKey: .unitPrice)
    try factor?.encode(on: &codingKeyContainer, forKey: .factor, auxKey: ._factor)
    try net?.encode(on: &codingKeyContainer, forKey: .net)
    try bodySite?.encode(on: &codingKeyContainer, forKey: .bodySite)
    try subSite?.encode(on: &codingKeyContainer, forKey: .subSite)
    try noteNumber?.encode(on: &codingKeyContainer, forKey: .noteNumber, auxKey: ._noteNumber)
    try adjudication.encode(on: &codingKeyContainer, forKey: .adjudication)
    try detail?.encode(on: &codingKeyContainer, forKey: .detail)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseAddItem else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return itemSequence == _other.itemSequence
    && detailSequence == _other.detailSequence
    && subdetailSequence == _other.subdetailSequence
    && provider == _other.provider
    && productOrService == _other.productOrService
    && programCode == _other.programCode
    && servicedX == _other.servicedX
    && locationX == _other.locationX
    && quantity == _other.quantity
    && unitPrice == _other.unitPrice
    && factor == _other.factor
    && net == _other.net
    && bodySite == _other.bodySite
    && subSite == _other.subSite
    && noteNumber == _other.noteNumber
    && adjudication == _other.adjudication
    && detail == _other.detail
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(itemSequence)
    hasher.combine(detailSequence)
    hasher.combine(subdetailSequence)
    hasher.combine(provider)
    hasher.combine(productOrService)
    hasher.combine(programCode)
    hasher.combine(servicedX)
    hasher.combine(locationX)
    hasher.combine(quantity)
    hasher.combine(unitPrice)
    hasher.combine(factor)
    hasher.combine(net)
    hasher.combine(bodySite)
    hasher.combine(subSite)
    hasher.combine(noteNumber)
    hasher.combine(adjudication)
    hasher.combine(detail)
  }
}
