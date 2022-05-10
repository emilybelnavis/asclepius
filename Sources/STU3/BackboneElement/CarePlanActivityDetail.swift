//
//  CarePlanActivityDetail.swift
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
 A simple summary of a planned activity suitable for a general care plan system that does know about
 specific resources such as procedure, etc...
 
 https://www.hl7.org/fhir/careplan-definitions.html#CarePlan.activity.detail
*/
open class CarePlanActivityDetail: BackboneElement {
  public enum ProductX: Hashable {
    case codeableConcept(CodeableConcept)
    case reference(Reference)
  }
  
  public enum ScheduledX: Hashable {
    case period(Period)
    case string(AsclepiusPrimitive<AsclepiusString>)
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
  public var kind: AsclepiusPrimitive<ResourceType>?
  
  /// Instantiates a FHIR protocol or definition
  public var instantiatesCanonical: [AsclepiusPrimitive<Canonical>]?
  
  /// Instantiates an external protocol or definition
  public var instantiatesUri: [AsclepiusPrimitive<AsclepiusURI>]?
  
  /// Detail type of activity
  public var code: CodeableConcept?
  
  /// Why the activity should be done or why the activity was prohibited
  public var reasonCode: [CodeableConcept]?
  
  /// Why the activity is needed
  public var reasonReference: [Reference]?
  
  /// Goals this activity relates to
  public var goal: [Reference]?
  
  /// Identifies what progress is being made for the specific activity
  public var status: AsclepiusPrimitive<CarePlanActivityStatus>
  
  /// Reason for current status
  public var statusReason: CodeableConcept?
  
  /// Is activity prohibited
  public var doNotPerform: AsclepiusPrimitive<AsclepiusBool>
  
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
  public var fhirDescription: AsclepiusPrimitive<AsclepiusString>?
 
  public init(status: AsclepiusPrimitive<CarePlanActivityStatus>, doNotPerform: AsclepiusPrimitive<AsclepiusBool>) {
    self.status = status
    self.doNotPerform = doNotPerform
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    kind: AsclepiusPrimitive<ResourceType>? = nil,
    instantiatesCanonical: [AsclepiusPrimitive<Canonical>]? = nil,
    instantiatesUri: [AsclepiusPrimitive<AsclepiusURI>]? = nil,
    code: CodeableConcept? = nil,
    reasonCode: [CodeableConcept]? = nil,
    reasonReference: [Reference]? = nil,
    goal: [Reference]? = nil,
    status: AsclepiusPrimitive<CarePlanActivityStatus>,
    statusReason: CodeableConcept? = nil,
    doNotPerform: AsclepiusPrimitive<AsclepiusBool>,
    scheduledX: ScheduledX? = nil,
    location: Reference? = nil,
    performer: [Reference]? = nil,
    productX: ProductX? = nil,
    dailyAmount: Quantity? = nil,
    quantity: Quantity? = nil,
    fhirDescription: AsclepiusPrimitive<AsclepiusString>? = nil
  ) {
    self.init(status: status, doNotPerform: doNotPerform)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
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
    case productCodeableConcept
    case productReference
    case performer
    case dailyAmount
    case quantity
    case fhirDescription; case _fhirDescription
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempScheduledX: ScheduledX?
    if let scheduledPeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .scheduledPeriod) {
      if tempScheduledX != nil {
        throw DecodingError.dataCorruptedError(forKey: .scheduledPeriod, in: codingKeyContainer, debugDescription: "More than one value provided for \"scheduled\"")
      }
      tempScheduledX = .period(scheduledPeriod)
    }
    
    if let scheduledString = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .scheduledString, auxKey: ._scheduledString) {
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
    
    var tempProductX: ProductX?
    if let productCodeableConcept = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .productCodeableConcept) {
      if tempProductX != nil {
        throw DecodingError.dataCorruptedError(forKey: .productCodeableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"product\"")
      }
      tempProductX = .codeableConcept(productCodeableConcept)
    }
    
    if let productReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .productReference) {
      if tempProductX != nil {
        throw DecodingError.dataCorruptedError(forKey: .productReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"product\"")
      }
      tempProductX = .reference(productReference)
    }
    
    self.kind = try AsclepiusPrimitive<ResourceType>(from: codingKeyContainer, forKeyIfPresent: .kind, auxKey: ._kind)
    self.instantiatesCanonical = try [AsclepiusPrimitive<Canonical>](from: codingKeyContainer, forKeyIfPresent: .instantiatesCanonical, auxKey: ._instantiatesCanonical)
    self.instantiatesUri = try [AsclepiusPrimitive<AsclepiusURI>](from: codingKeyContainer, forKeyIfPresent: .instantiatesUri, auxKey: ._instantiatesUri)
    self.code = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .code)
    self.reasonCode = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .reasonCode)
    self.reasonReference = try [Reference](from: codingKeyContainer, forKeyIfPresent: .reasonReference)
    self.goal = try [Reference](from: codingKeyContainer, forKeyIfPresent: .goal)
    self.status = try AsclepiusPrimitive<CarePlanActivityStatus>(from: codingKeyContainer, forKey: .status, auxKey: ._status)
    self.statusReason = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .statusReason)
    self.doNotPerform = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKey: .doNotPerform, auxKey: ._doNotPerform)
    self.scheduledX = tempScheduledX
    self.location = try Reference(from: codingKeyContainer, forKeyIfPresent: .location)
    self.performer = try [Reference](from: codingKeyContainer, forKeyIfPresent: .performer)
    self.productX = tempProductX
    self.dailyAmount = try Quantity(from: codingKeyContainer, forKeyIfPresent: .dailyAmount)
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.fhirDescription = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
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
      case .codeableConcept(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .productCodeableConcept)
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
  override public func isEqual(to _other: Any?) -> Bool {
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
  override public func hash(into hasher: inout Hasher) {
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
