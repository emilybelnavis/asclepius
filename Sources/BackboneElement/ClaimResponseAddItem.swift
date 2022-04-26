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
  public enum _Serviced: Hashable {
    case date(FHIRKitPrimitive<FHIRKitDate>)
    case period(Period)
  }
  public enum _Location: Hashable {
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
  public var serviced: _Serviced?
  
  /// Place of service or where product was supplied
  public var location: _Location?
  
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
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    itemSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    detailSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    subdetailSequence: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    provider: [Reference]? = nil,
    productOrService: CodableConcept,
    modifier: [CodableConcept]? = nil,
    programCode: [CodableConcept]? = nil,
    serviced: _Serviced? = nil,
    location: _Location? = nil,
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
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.itemSequence = itemSequence
    self.detailSequence = detailSequence
    self.subdetailSequence = subdetailSequence
    self.provider = provider
    self.modifier = modifier
    self.serviced = serviced
    self.location = location
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    var _serviced: _Serviced? = nil
    if let servicedDate = try FHIRKitPrimitive<FHIRKitDate>(from: _container, forKeyIfPresent: .servicedDate) {
      if _serviced != nil {
        throw DecodingError.dataCorruptedError(forKey: .servicedDate, in: _container, debugDescription: "More than one value provided for \"serviced\"")
      }
      _serviced = .date(servicedDate)
    }
    
    if let servicedPeriod = try Period(from: _container, forKeyIfPresent: .servicedPeriod) {
      if _serviced != nil {
        throw DecodingError.dataCorruptedError(forKey: .servicedPeriod, in: _container, debugDescription: "More than one value provided for \"serviced\"")
      }
      _serviced = .period(servicedPeriod)
    }
    
    var _location: _Location? = nil
    if let locationAddress = try Address(from: _container, forKeyIfPresent: .locationAddress) {
      if _location != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationAddress, in: _container, debugDescription: "More than one value provided for \"location\"")
      }
      _location = .address(locationAddress)
    }
    
    if let locationCodableConcept = try CodableConcept(from: _container, forKeyIfPresent: .locationCodableConcept) {
      if _location != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationCodableConcept, in: _container, debugDescription: "More than one value provided for \"location\"")
      }
      _location = .codableConcept(locationCodableConcept)
    }
    
    if let locationReference = try Reference(from: _container, forKeyIfPresent: .locationReference) {
      if _location != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationReference, in: _container, debugDescription: "More than one value provided for \"location\"")
      }
      _location = .reference(locationReference)
    }
    
    self.itemSequence = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: _container, forKeyIfPresent: .itemSequence, auxiliaryKey: ._itemSequence)
    self.detailSequence = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: _container, forKeyIfPresent: .detailSequence, auxiliaryKey: ._detailSequence)
    self.subdetailSequence = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: _container, forKeyIfPresent: .subdetailSequence, auxiliaryKey: ._subdetailSequence)
    self.provider = try [Reference](from: _container, forKeyIfPresent: .provider)
    self.productOrService = try CodableConcept(from: _container, forKey: .productOrService)
    self.modifier = try [CodableConcept](from: _container, forKeyIfPresent: .modifier)
    self.programCode = try [CodableConcept](from: _container, forKeyIfPresent: .programCode)
    self.serviced = _serviced
    self.location = _location
    self.quantity = try Quantity(from: _container, forKeyIfPresent: .quantity)
    self.unitPrice = try Money(from: _container, forKeyIfPresent: .unitPrice)
    self.factor = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKeyIfPresent: .factor, auxiliaryKey: ._factor)
    self.net = try Money(from: _container, forKeyIfPresent: .net)
    self.bodySite = try CodableConcept(from: _container, forKeyIfPresent: .bodySite)
    self.subSite = try [CodableConcept](from: _container, forKeyIfPresent: .subSite)
    self.noteNumber = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: _container, forKey: .noteNumber, auxiliaryKey: ._noteNumber)
    self.adjudication = try [ClaimResponseItemAdjudication](from: _container, forKey: .adjudication)
    self.detail = try [ClaimResponseAddItemDetail](from: _container, forKeyIfPresent: .detail)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    if let _serviced = serviced {
      switch _serviced {
      case .date(let _value):
        try _value.encode(on: &_container, forKey: .servicedDate, auxiliaryKey: ._servicedDate)
      case .period(let _value):
        try _value.encode(on: &_container, forKey: .servicedPeriod)
      }
    }
    
    if let _location = location {
      switch _location {
      case .address(let _value):
        try _value.encode(on: &_container, forKey: .locationAddress)
      case .codableConcept(let _value):
        try _value.encode(on: &_container, forKey: .locationCodableConcept)
      case .reference(let _value):
        try _value.encode(on: &_container, forKey: .locationReference)
      }
    }
    
    try itemSequence?.encode(on: &_container, forKey: .itemSequence, auxiliaryKey: ._itemSequence)
    try detailSequence?.encode(on: &_container, forKey: .detailSequence, auxiliaryKey: ._detailSequence)
    try subdetailSequence?.encode(on: &_container, forKey: .subdetailSequence, auxiliaryKey: ._subdetailSequence)
    try provider?.encode(on: &_container, forKey: .provider)
    try productOrService.encode(on: &_container, forKey: .productOrService)
    try modifier?.encode(on: &_container, forKey: .modifier)
    try programCode?.encode(on: &_container, forKey: .programCode)
    try quantity?.encode(on: &_container, forKey: .quantity)
    try unitPrice?.encode(on: &_container, forKey: .unitPrice)
    try factor?.encode(on: &_container, forKey: .factor, auxiliaryKey: ._factor)
    try net?.encode(on: &_container, forKey: .net)
    try bodySite?.encode(on: &_container, forKey: .bodySite)
    try subSite?.encode(on: &_container, forKey: .subSite)
    try noteNumber?.encode(on: &_container, forKey: .noteNumber, auxiliaryKey: ._noteNumber)
    try adjudication.encode(on: &_container, forKey: .adjudication)
    try detail?.encode(on: &_container, forKey: .detail)
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
    && serviced == _other.serviced
    && location == _other.location
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
    hasher.combine(serviced)
    hasher.combine(location)
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
