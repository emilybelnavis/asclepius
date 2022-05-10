//
//  ContractTermAction.swift
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
 Entity being ascribed responsibility - An actor taking a role in an activity for which it can be assigned some degree
 of responsibility for the activity taking place.
 */
open class ContractTermAction: BackboneElement {
  public enum OccurrenceX: Hashable {
    case dateTime(AsclepiusPrimitive<AsclepiusDateTime>)
    case period(Period)
    case timing(Timing)
  }
  
  /// True if the term prohibits the action
  public var doNotPerform: AsclepiusPrimitive<AsclepiusBool>?
  
  /// Type or form of the action
  public var type: CodeableConcept
  
  /// Entity of the action
  public var subject: [ContractTermActionSubject]?
  
  /// Purpose for the Contract Term Action
  public var intent: CodeableConcept
  
  /// Pointer to specific item
  public var linkId: [AsclepiusPrimitive<AsclepiusString>]?
  
  /// State of the action
  public var status: CodeableConcept
  
  /// Episode associated with action
  public var context: Reference?
  
  /// Pointer to specific item
  public var contextLinkId: [AsclepiusPrimitive<AsclepiusString>]?
  
  /// When action happens
  public var occurrence: OccurrenceX?
  
  /// Who asked for action
  public var requester: [Reference]?
  
  /// Pointer to specific item
  public var requesterLinkId: [AsclepiusPrimitive<AsclepiusString>]?
  
  /// Kind of service performer
  public var performerType: [CodeableConcept]?
  
  /// Competency of the performer
  public var performerRole: CodeableConcept?
  
  /// Actor that will (or won't) execute the action
  public var performer: Reference?
  
  /// Pointer to specific item
  public var performerLinkId: [AsclepiusPrimitive<AsclepiusString>]?
  
  /// Why the action is/isn't needed
  public var reasonCode: [CodeableConcept]?
  
  /// Why the action is/isn't needed
  public var reasonReference: [Reference]?
  
  /// Why action is to be performed
  public var reason: [AsclepiusPrimitive<AsclepiusString>]?
  
  /// Pointer to specific item
  public var reasonLinkId: [AsclepiusPrimitive<AsclepiusString>]?
  
  /// Comments about the action
  public var note: [Annotation]?
  
  /// Action restriction numbers
  public var securityLabelNumber: [AsclepiusPrimitive<AsclepiusUnsignedInteger>]?
  
  public init(type: CodeableConcept, intent: CodeableConcept, status: CodeableConcept) {
    self.type = type
    self.intent = intent
    self.status = status
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    doNotPerform: AsclepiusPrimitive<AsclepiusBool>? = nil,
    type: CodeableConcept,
    subject: [ContractTermActionSubject]? = nil,
    intent: CodeableConcept,
    linkId: [AsclepiusPrimitive<AsclepiusString>]? = nil,
    status: CodeableConcept,
    context: Reference? = nil,
    contextLinkId: [AsclepiusPrimitive<AsclepiusString>]? = nil,
    occurrence: OccurrenceX? = nil,
    requester: [Reference]? = nil,
    requesterLinkId: [AsclepiusPrimitive<AsclepiusString>]? = nil,
    performerType: [CodeableConcept]? = nil,
    performerRole: CodeableConcept? = nil,
    performer: Reference? = nil,
    performerLinkId: [AsclepiusPrimitive<AsclepiusString>]? = nil,
    reasonCode: [CodeableConcept]? = nil,
    reasonReference: [Reference]? = nil,
    reason: [AsclepiusPrimitive<AsclepiusString>]? = nil,
    reasonLinkId: [AsclepiusPrimitive<AsclepiusString>]? = nil,
    note: [Annotation]? = nil,
    securityLabelNumber: [AsclepiusPrimitive<AsclepiusUnsignedInteger>]? = nil
  ) {
    self.init(type: type, intent: intent, status: status)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.doNotPerform = doNotPerform
    self.subject = subject
    self.linkId = linkId
    self.context = context
    self.contextLinkId = contextLinkId
    self.occurrence = occurrence
    self.requester = requester
    self.requesterLinkId = requesterLinkId
    self.performerType = performerType
    self.performerRole = performerRole
    self.performer = performer
    self.performerLinkId = performerLinkId
    self.reasonCode = reasonCode
    self.reasonReference = reasonReference
    self.reason = reason
    self.reasonLinkId = reasonLinkId
    self.note = note
    self.securityLabelNumber = securityLabelNumber
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case doNotPerform; case _doNotPerform
    case type
    case subject
    case intent
    case linkId; case _linkId
    case status
    case context
    case contextLinkId; case _contextLinkId
    case occurrenceDateTime; case _occurrenceDateTime
    case occurrencePeriod
    case occurrenceTiming
    case requester
    case requesterLinkId; case _requesterLinkId
    case performerType
    case performerRole
    case performer
    case performerLinkId; case _performerLinkId
    case reasonCode
    case reasonReference
    case reason; case _reason
    case reasonLinkId; case _reasonLinkId
    case note
    case securityLabelNumber; case _securityLabelNumber
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tOccurrence: OccurrenceX?
    if let occurrenceDateTime = try AsclepiusPrimitive<AsclepiusDateTime>(from: codingKeyContainer, forKeyIfPresent: .occurrenceDateTime, auxKey: ._occurrenceDateTime) {
      if tOccurrence != nil {
        throw DecodingError.dataCorruptedError(forKey: .occurrenceDateTime, in: codingKeyContainer, debugDescription: "More than one value provided for \"occurrence\"")
      }
      tOccurrence = .dateTime(occurrenceDateTime)
    }
    
    if let occurrencePeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .occurrencePeriod) {
      if tOccurrence != nil {
        throw DecodingError.dataCorruptedError(forKey: .occurrencePeriod, in: codingKeyContainer, debugDescription: "More than one value provided for \"occurrence\"")
      }
      tOccurrence = .period(occurrencePeriod)
    }
    
    if let occurrenceTiming = try Timing(from: codingKeyContainer, forKeyIfPresent: .occurrenceTiming) {
      if tOccurrence != nil {
        throw DecodingError.dataCorruptedError(forKey: .occurrenceTiming, in: codingKeyContainer, debugDescription: "More than one value provided for \"occurrence\"")
      }
      tOccurrence = .timing(occurrenceTiming)
    }
    
    self.doNotPerform = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .doNotPerform, auxKey: ._doNotPerform)
    self.type = try CodeableConcept(from: codingKeyContainer, forKey: .type)
    self.subject = try [ContractTermActionSubject](from: codingKeyContainer, forKeyIfPresent: .subject)
    self.intent = try CodeableConcept(from: codingKeyContainer, forKey: .intent)
    self.linkId = try [AsclepiusPrimitive<AsclepiusString>](from: codingKeyContainer, forKeyIfPresent: .linkId, auxKey: ._linkId)
    self.status = try CodeableConcept(from: codingKeyContainer, forKey: .status)
    self.context = try Reference(from: codingKeyContainer, forKeyIfPresent: .context)
    self.contextLinkId = try [AsclepiusPrimitive<AsclepiusString>](from: codingKeyContainer, forKeyIfPresent: .contextLinkId, auxKey: ._contextLinkId)
    self.occurrence = tOccurrence
    self.requester = try [Reference](from: codingKeyContainer, forKeyIfPresent: .requester)
    self.requesterLinkId = try [AsclepiusPrimitive<AsclepiusString>](from: codingKeyContainer, forKeyIfPresent: .requesterLinkId, auxKey: ._requesterLinkId)
    self.performerType = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .performerType)
    self.performerRole = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .performerRole)
    self.performer = try Reference(from: codingKeyContainer, forKey: .performer)
    self.performerLinkId = try [AsclepiusPrimitive<AsclepiusString>](from: codingKeyContainer, forKeyIfPresent: .performerLinkId, auxKey: ._performerLinkId)
    self.reasonCode = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .reasonCode)
    self.reasonReference = try [Reference](from: codingKeyContainer, forKeyIfPresent: .reasonReference)
    self.reason = try [AsclepiusPrimitive<AsclepiusString>](from: codingKeyContainer, forKeyIfPresent: .reason, auxKey: ._reason)
    self.reasonLinkId = try [AsclepiusPrimitive<AsclepiusString>](from: codingKeyContainer, forKeyIfPresent: .reasonLinkId, auxKey: ._reasonLinkId)
    self.note = try [Annotation](from: codingKeyContainer, forKeyIfPresent: .note)
    self.securityLabelNumber = try [AsclepiusPrimitive<AsclepiusUnsignedInteger>](from: codingKeyContainer, forKeyIfPresent: .securityLabelNumber, auxKey: ._securityLabelNumber)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumOccurrence = occurrence {
      switch enumOccurrence {
      case .dateTime(let datetime):
        try datetime.encode(on: &codingKeyContainer, forKey: .occurrenceDateTime, auxKey: ._occurrenceDateTime)
      case .period(let period):
        try period.encode(on: &codingKeyContainer, forKey: .occurrencePeriod)
      case .timing(let timing):
        try timing.encode(on: &codingKeyContainer, forKey: .occurrenceTiming)
      }
    }
    
    try doNotPerform?.encode(on: &codingKeyContainer, forKey: .doNotPerform, auxKey: ._doNotPerform)
    try type.encode(on: &codingKeyContainer, forKey: .type)
    try subject?.encode(on: &codingKeyContainer, forKey: .subject)
    try intent.encode(on: &codingKeyContainer, forKey: .intent)
    try linkId?.encode(on: &codingKeyContainer, forKey: .linkId, auxKey: ._linkId)
    try status.encode(on: &codingKeyContainer, forKey: .status)
    try context?.encode(on: &codingKeyContainer, forKey: .context)
    try contextLinkId?.encode(on: &codingKeyContainer, forKey: .contextLinkId, auxKey: ._contextLinkId)
    try requester?.encode(on: &codingKeyContainer, forKey: .requester)
    try requesterLinkId?.encode(on: &codingKeyContainer, forKey: .requesterLinkId, auxKey: ._requesterLinkId)
    try performerType?.encode(on: &codingKeyContainer, forKey: .performerType)
    try performerRole?.encode(on: &codingKeyContainer, forKey: .performerRole)
    try performer?.encode(on: &codingKeyContainer, forKey: .performer)
    try performerLinkId?.encode(on: &codingKeyContainer, forKey: .performerLinkId, auxKey: ._performerLinkId)
    try reasonCode?.encode(on: &codingKeyContainer, forKey: .reasonCode)
    try reasonReference?.encode(on: &codingKeyContainer, forKey: .reasonReference)
    try reason?.encode(on: &codingKeyContainer, forKey: .reason, auxKey: ._reason)
    try reasonLinkId?.encode(on: &codingKeyContainer, forKey: .reasonLinkId, auxKey: ._reasonLinkId)
    try note?.encode(on: &codingKeyContainer, forKey: .note)
    try securityLabelNumber?.encode(on: &codingKeyContainer, forKey: .securityLabelNumber, auxKey: ._securityLabelNumber)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContractTermAction else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return doNotPerform == _other.doNotPerform
    && type == _other.type
    && subject == _other.subject
    && intent == _other.intent
    && linkId == _other.linkId
    && context == _other.context
    && contextLinkId == _other.contextLinkId
    && occurrence == _other.occurrence
    && requester == _other.requester
    && requesterLinkId == _other.requesterLinkId
    && performerType == _other.performerType
    && performerRole == _other.performerRole
    && performer == _other.performer
    && performerLinkId == _other.performerLinkId
    && reasonCode == _other.reasonCode
    && reasonReference == _other.reasonReference
    && reason == _other.reason
    && reasonLinkId == _other.reasonLinkId
    && note == _other.note
    && securityLabelNumber == _other.securityLabelNumber
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(doNotPerform)
    hasher.combine(type)
    hasher.combine(subject)
    hasher.combine(intent)
    hasher.combine(linkId)
    hasher.combine(context)
    hasher.combine(contextLinkId)
    hasher.combine(occurrence)
    hasher.combine(requester)
    hasher.combine(requesterLinkId)
    hasher.combine(performerType)
    hasher.combine(performerRole)
    hasher.combine(performer)
    hasher.combine(performerLinkId)
    hasher.combine(reasonCode)
    hasher.combine(reasonReference)
    hasher.combine(reason)
    hasher.combine(reasonLinkId)
    hasher.combine(note)
    hasher.combine(securityLabelNumber)
  }
}
