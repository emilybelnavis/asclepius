//
//  CarePlanActivityDetail.swift
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
 A simple summary of a planned activity suitable for a general care plan system that does know about
 specific resources such as procedure, etc...
 
 https://www.hl7.org/fhir/careplan-definitions.html#CarePlan.activity.detail
*/
open class CarePlanActivityDetail: BackboneElement {
  public enum _Product: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  public enum _Scheduled: Hashable {
    case period(Period)
    case string(FHIRKitPrimitive<FHIRKitString>)
    case timing(Timing)
  }
  /**
   A description of the kind of resource the in-line definintion of a care plan activity is representing. The
   `CarePlan.activity.detail` is an in-line definition when a resource is referenced not using
   `CarePlan.activity.reference`. For example, a MedicationRequest, a ServiceRequest, or a
   CommunicationRequest. Restrictred to: [`Appointment`, `CommunicationRequest`, `DeviceRequest`,
   `MedicationRequest`, `NutritionOrder`, `Task`, `ServiceRequest`,
   `VisionPrescription`]
   */
  public var kind: FHIRKitPrimitive<ResourceType>?
  
  /// Instantiates a FHIR protocol or definition
  public var instantiatesCanonical: [FHIRKitPrimitive<Canonical>]?
  
  /// Instantiates an external protocol or definition
  public var instantiatesUri: [FHIRKitPrimitive<FHIRKitURI>]?
  
  ///Detail type of activity
  public var code: CodableConcept?
  
  /// Why the activity should be done or why the activity was prohibited
  public var reasonCode: [CodableConcept]?
  
  /// Why the activity is needed
  public var reasonReference: [Reference]?
  
  /// Goals this activity relates to
  public var goal: [Reference]?
  
  /// Identifies what progress is being made for the specific activity
  public var status: FHIRKitPrimitive<CarePlanActivityStatus>
  
  /// Reason for current status
  public var statusReason: CodableConcept?
  
  /// Is activity prohibited
  public var doNotPerform: FHIRKitPrimitive<FHIRKitBool>
  
  /// When activity is scheduled to occur
  public var scheduled: _Scheduled?
  
  /// Where the activity should take place
  public var location: Reference?
  
  /// Who will be responsible for the activity?
  public var performer: [Reference]?
  
  /// What is to be administered or supplied for the activity?
  public var product: _Product?
  
  /// How much to consume per day
  public var dailyAmount: Quantity?
  
  /// How much to administer/supply/consume
  public var quantity: Quantity?
  
  /// Extra information describing the activity that needs to be performed
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
 
  public init(status: FHIRKitPrimitive<CarePlanActivityStatus>, doNotPerform: FHIRKitPrimitive<FHIRKitBool>) {
    self.status = status
    self.doNotPerform = doNotPerform
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    kind: FHIRKitPrimitive<ResourceType>? = nil,
    instantiatesCanonical: [FHIRKitPrimitive<Canonical>]? = nil,
    instantiatesUri: [FHIRKitPrimitive<FHIRKitURI>]? = nil,
    code: CodableConcept? = nil,
    reasonCode: [CodableConcept]? = nil,
    reasonReference: [Reference]? = nil,
    goal: [Reference]? = nil,
    status: FHIRKitPrimitive<CarePlanActivityStatus>,
    statusReason: CodableConcept? = nil,
    doNotPerform: FHIRKitPrimitive<FHIRKitBool>,
    scheduled: _Scheduled? = nil,
    location: Reference? = nil,
    performer: [Reference]? = nil,
    product: _Product? = nil,
    dailyAmount: Quantity? = nil,
    quantity: Quantity? = nil,
    fhirDescription: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init(status: status, doNotPerform: doNotPerform)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.kind = kind
    self.instantiatesCanonical = instantiatesCanonical
    self.instantiatesUri = instantiatesUri
    self.code = code
    self.reasonCode = reasonCode
    self.reasonReference = reasonReference
    self.goal = goal
    self.statusReason = statusReason
    self.scheduled = scheduled
    self.location = location
    self.performer = performer
    self.product = product
    self.dailyAmount = dailyAmount
    self.quantity = quantity
    self.fhirDescription = fhirDescription
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case kind; case _kind
    case instantiatesCanonical; case _instantiatesCanonical
    case instantiatesUri; case _instantiatesUri
    case code
    case reasonCode
    case reasonReference
    case goal
    case status; case _status
    case statusReason
    case doNotPerform; case _doNotPerform
    case scheduledPeriod
    case scheduledString; case _scheduledString
    case scheduledTiming
    case location
    case productCodableConcept
    case productReference
    case performer
    case dailyAmount
    case quantity
    case fhirDescription; case _fhirDescription
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    var _scheduled: _Scheduled? = nil
    if let scheduledPeriod = try Period(from: _container, forKeyIfPresent: .scheduledPeriod) {
      if _scheduled != nil {
        throw DecodingError.dataCorruptedError(forKey: .scheduledPeriod, in: _container, debugDescription: "More than one value provided for \"scheduled\"")
      }
      _scheduled = .period(scheduledPeriod)
    }
    
    if let scheduledString = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .scheduledString, auxiliaryKey: ._scheduledString) {
      if _scheduled != nil {
        throw DecodingError.dataCorruptedError(forKey: .scheduledString, in: _container, debugDescription: "More than one value provided for \"scheduled\"")
      }
      _scheduled = .string(scheduledString)
    }
    
    if let scheduledTiming = try Timing(from: _container, forKeyIfPresent: .scheduledTiming) {
      if _scheduled != nil {
        throw DecodingError.dataCorruptedError(forKey: .scheduledTiming, in: _container, debugDescription: "More than one value provided for \"scheduled\"")
      }
      _scheduled = .timing(scheduledTiming)
    }
    
    var _product: _Product? = nil
    if let productCodableConcept = try CodableConcept(from: _container, forKeyIfPresent: .productCodableConcept) {
      if _product != nil {
        throw DecodingError.dataCorruptedError(forKey: .productCodableConcept, in: _container, debugDescription: "More than one value provided for \"product\"")
      }
      _product = .codableConcept(productCodableConcept)
    }
    
    if let productReference = try Reference(from: _container, forKeyIfPresent: .productReference) {
      if _product != nil {
        throw DecodingError.dataCorruptedError(forKey: .productReference, in: _container, debugDescription: "More than one value provided for \"product\"")
      }
      _product = .reference(productReference)
    }
    
    self.kind = try FHIRKitPrimitive<ResourceType>(from: _container, forKeyIfPresent: .kind, auxiliaryKey: ._kind)
    self.instantiatesCanonical = try [FHIRKitPrimitive<Canonical>](from: _container, forKeyIfPresent: .instantiatesCanonical, auxiliaryKey: ._instantiatesCanonical)
    self.instantiatesUri = try [FHIRKitPrimitive<FHIRKitURI>](from: _container, forKeyIfPresent: .instantiatesUri, auxiliaryKey: ._instantiatesUri)
    self.code = try CodableConcept(from: _container, forKeyIfPresent: .code)
    self.reasonCode = try [CodableConcept](from: _container, forKeyIfPresent: .reasonCode)
    self.reasonReference = try [Reference](from: _container, forKeyIfPresent: .reasonReference)
    self.goal = try [Reference](from: _container, forKeyIfPresent: .goal)
    self.status = try FHIRKitPrimitive<CarePlanActivityStatus>(from: _container, forKey: .status, auxiliaryKey: ._status)
    self.statusReason = try CodableConcept(from: _container, forKeyIfPresent: .statusReason)
    self.doNotPerform = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKey: .doNotPerform, auxiliaryKey: ._doNotPerform)
    self.scheduled = _scheduled
    self.location = try Reference(from: _container, forKeyIfPresent: .location)
    self.performer = try [Reference](from: _container, forKeyIfPresent: .performer)
    self.product = _product
    self.dailyAmount = try Quantity(from: _container, forKeyIfPresent: .dailyAmount)
    self.quantity = try Quantity(from: _container, forKeyIfPresent: .quantity)
    self.fhirDescription = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .fhirDescription, auxiliaryKey: ._fhirDescription)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    if let _scheduled = scheduled {
      switch _scheduled {
      case .period(let _value):
        try _value.encode(on: &_container, forKey: .scheduledPeriod)
      case .string(let _value):
        try _value.encode(on: &_container, forKey: .scheduledString, auxiliaryKey: ._scheduledString)
      case .timing(let _value):
        try _value.encode(on: &_container, forKey: .scheduledTiming)
      }
    }
    
    if let _product = product {
      switch _product {
      case .codableConcept(let _value):
        try _value.encode(on: &_container, forKey: .productCodableConcept)
      case .reference(let _value):
        try _value.encode(on: &_container, forKey: .productReference)
      }
    }
    
    try kind?.encode(on: &_container, forKey: .kind, auxiliaryKey: ._kind)
    try instantiatesCanonical?.encode(on: &_container, forKey: .instantiatesCanonical, auxiliaryKey: ._instantiatesCanonical)
    try instantiatesUri?.encode(on: &_container, forKey: .instantiatesUri, auxiliaryKey: ._instantiatesUri)
    try code?.encode(on: &_container, forKey: .code)
    try reasonCode?.encode(on: &_container, forKey: .reasonCode)
    try reasonReference?.encode(on: &_container, forKey: .reasonReference)
    try goal?.encode(on: &_container, forKey: .goal)
    try status.encode(on: &_container, forKey: .status, auxiliaryKey: ._status)
    try statusReason?.encode(on: &_container, forKey: .statusReason)
    try doNotPerform.encode(on: &_container, forKey: .doNotPerform, auxiliaryKey: ._doNotPerform)
    try location?.encode(on: &_container, forKey: .location)
    try performer?.encode(on: &_container, forKey: .performer)
    try dailyAmount?.encode(on: &_container, forKey: .dailyAmount)
    try quantity?.encode(on: &_container, forKey: .quantity)
    try fhirDescription?.encode(on: &_container, forKey: .fhirDescription, auxiliaryKey: ._fhirDescription)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CarePlanActivityDetail else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return kind == _other.kind
    && instantiatesCanonical == _other.instantiatesCanonical
    && instantiatesUri == _other.instantiatesUri
    && code == _other.code
    && reasonCode == _other.reasonCode
    && reasonReference == _other.reasonReference
    && goal == _other.goal
    && status == _other.status
    && statusReason == _other.statusReason
    && doNotPerform == _other.doNotPerform
    && scheduled == _other.scheduled
    && location == _other.location
    && performer == _other.performer
    && product == _other.product
    && dailyAmount == _other.dailyAmount
    && quantity == _other.quantity
    && fhirDescription == _other.fhirDescription
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(kind)
    hasher.combine(instantiatesCanonical)
    hasher.combine(instantiatesUri)
    hasher.combine(code)
    hasher.combine(reasonCode)
    hasher.combine(reasonReference)
    hasher.combine(goal)
    hasher.combine(status)
    hasher.combine(statusReason)
    hasher.combine(doNotPerform)
    hasher.combine(scheduled)
    hasher.combine(location)
    hasher.combine(performer)
    hasher.combine(product)
    hasher.combine(dailyAmount)
    hasher.combine(quantity)
    hasher.combine(fhirDescription)
  }
}
