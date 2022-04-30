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
  public enum ProductX: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  public enum ScheduledX: Hashable {
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
  public var scheduledX: ScheduledX?
  
  /// Where the activity should take place
  public var location: Reference?
  
  /// Who will be responsible for the activity?
  public var performer: [Reference]?
  
  /// What is to be administered or supplied for the activity?
  public var productX: ProductX?
  
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
    fhirExtension: [Extension]? = nil,
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
    scheduledX: ScheduledX? = nil,
    location: Reference? = nil,
    performer: [Reference]? = nil,
    productX: ProductX? = nil,
    dailyAmount: Quantity? = nil,
    quantity: Quantity? = nil,
    fhirDescription: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init(status: status, doNotPerform: doNotPerform)
    self.fhirExtension = fhirExtension
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
    self.scheduledX = scheduledX
    self.location = location
    self.performer = performer
    self.productX = productX
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
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempScheduledX: ScheduledX? = nil
    if let scheduledPeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .scheduledPeriod) {
      if tempScheduledX != nil {
        throw DecodingError.dataCorruptedError(forKey: .scheduledPeriod, in: codingKeyContainer, debugDescription: "More than one value provided for \"scheduled\"")
      }
      tempScheduledX = .period(scheduledPeriod)
    }
    
    if let scheduledString = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .scheduledString, auxKey: ._scheduledString) {
      if tempScheduledX != nil {
        throw DecodingError.dataCorruptedError(forKey: .scheduledString, in: codingKeyContainer, debugDescription: "More than one value provided for \"scheduled\"")
      }
      tempScheduledX = .string(scheduledString)
    }
    
    if let scheduledTiming = try Timing(from: codingKeyContainer, forKeyIfPresent: .scheduledTiming) {
      if tempScheduledX != nil {
        throw DecodingError.dataCorruptedError(forKey: .scheduledTiming, in: codingKeyContainer, debugDescription: "More than one value provided for \"scheduled\"")
      }
      tempScheduledX = .timing(scheduledTiming)
    }
    
    var tempProductX: ProductX? = nil
    if let productCodableConcept = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .productCodableConcept) {
      if tempProductX != nil {
        throw DecodingError.dataCorruptedError(forKey: .productCodableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"product\"")
      }
      tempProductX = .codableConcept(productCodableConcept)
    }
    
    if let productReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .productReference) {
      if tempProductX != nil {
        throw DecodingError.dataCorruptedError(forKey: .productReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"product\"")
      }
      tempProductX = .reference(productReference)
    }
    
    self.kind = try FHIRKitPrimitive<ResourceType>(from: codingKeyContainer, forKeyIfPresent: .kind, auxKey: ._kind)
    self.instantiatesCanonical = try [FHIRKitPrimitive<Canonical>](from: codingKeyContainer, forKeyIfPresent: .instantiatesCanonical, auxKey: ._instantiatesCanonical)
    self.instantiatesUri = try [FHIRKitPrimitive<FHIRKitURI>](from: codingKeyContainer, forKeyIfPresent: .instantiatesUri, auxKey: ._instantiatesUri)
    self.code = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .code)
    self.reasonCode = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .reasonCode)
    self.reasonReference = try [Reference](from: codingKeyContainer, forKeyIfPresent: .reasonReference)
    self.goal = try [Reference](from: codingKeyContainer, forKeyIfPresent: .goal)
    self.status = try FHIRKitPrimitive<CarePlanActivityStatus>(from: codingKeyContainer, forKey: .status, auxKey: ._status)
    self.statusReason = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .statusReason)
    self.doNotPerform = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKey: .doNotPerform, auxKey: ._doNotPerform)
    self.scheduledX = tempScheduledX
    self.location = try Reference(from: codingKeyContainer, forKeyIfPresent: .location)
    self.performer = try [Reference](from: codingKeyContainer, forKeyIfPresent: .performer)
    self.productX = tempProductX
    self.dailyAmount = try Quantity(from: codingKeyContainer, forKeyIfPresent: .dailyAmount)
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.fhirDescription = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumScheduledX = scheduledX {
      switch enumScheduledX {
      case .period(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .scheduledPeriod)
      case .string(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .scheduledString, auxKey: ._scheduledString)
      case .timing(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .scheduledTiming)
      }
    }
    
    if let enumProductX = productX {
      switch enumProductX {
      case .codableConcept(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .productCodableConcept)
      case .reference(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .productReference)
      }
    }
    
    try kind?.encode(on: &codingKeyContainer, forKey: .kind, auxKey: ._kind)
    try instantiatesCanonical?.encode(on: &codingKeyContainer, forKey: .instantiatesCanonical, auxKey: ._instantiatesCanonical)
    try instantiatesUri?.encode(on: &codingKeyContainer, forKey: .instantiatesUri, auxKey: ._instantiatesUri)
    try code?.encode(on: &codingKeyContainer, forKey: .code)
    try reasonCode?.encode(on: &codingKeyContainer, forKey: .reasonCode)
    try reasonReference?.encode(on: &codingKeyContainer, forKey: .reasonReference)
    try goal?.encode(on: &codingKeyContainer, forKey: .goal)
    try status.encode(on: &codingKeyContainer, forKey: .status, auxKey: ._status)
    try statusReason?.encode(on: &codingKeyContainer, forKey: .statusReason)
    try doNotPerform.encode(on: &codingKeyContainer, forKey: .doNotPerform, auxKey: ._doNotPerform)
    try location?.encode(on: &codingKeyContainer, forKey: .location)
    try performer?.encode(on: &codingKeyContainer, forKey: .performer)
    try dailyAmount?.encode(on: &codingKeyContainer, forKey: .dailyAmount)
    try quantity?.encode(on: &codingKeyContainer, forKey: .quantity)
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
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
    && scheduledX == _other.scheduledX
    && location == _other.location
    && performer == _other.performer
    && productX == _other.productX
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
    hasher.combine(scheduledX)
    hasher.combine(location)
    hasher.combine(performer)
    hasher.combine(productX)
    hasher.combine(dailyAmount)
    hasher.combine(quantity)
    hasher.combine(fhirDescription)
  }
}
