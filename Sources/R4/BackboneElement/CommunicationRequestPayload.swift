//
//  CommunicationRequestPayload.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/**
 A request for information to be sent to a receiver.
 
 A request that convey's information; (e.g. the CDS system propses that an alert be sent to a responsible
 provider, the CDS system proposes that the public health agency (PHA) be notified about a reportable
 condition, etc...)
 */
open class CommunicationRequestPayload: BackboneElement {
  
  /// all possible types for `occurrence[x]`
  public enum OccurrenceX: Hashable {
    case dateTime(AlexandriaHRMPrimitive<AlexandriaHRMDateTime>)
    case period(Period)
  }
  
  /// Unique Identifier
  public var identifier: [Identifier]?
  
  /// Fulfills plan or proposal
  public var basedOn: [Reference]?
  
  /// Request(s) replaced by this request
  public var replaces: [Reference]?
  
  /// Composite request this request is a part of
  public var groupIdentifier: Identifier?
  
  /// Status of the proposal/order
  public var status: AlexandriaHRMPrimitive<RequestStatus>
  
  /// Reason for the current proposal/order status
  public var statusReason: CodeableConcept?
  
  /// Message category
  public var category: [CodeableConcept]?
  
  /// How quickly should the proposed act be initialized? Includes concepts such as `stat`
  /// `urgent`, and `routine`
  public var priority: AlexandriaHRMPrimitive<RequestPriority>?
  
  /// Is this request a prohibiting action?
  public var doNotPerform: AlexandriaHRMPrimitive<AlexandriaHRMBool>?
  
  /// A channel of communication
  public var medium: [CodeableConcept]?
  
  /// Focus of the message
  public var subject: Reference?
  
  /// Resources that pertain to this communication request
  public var about: [Reference]?
  
  /// Encounter created as part of
  public var encounter: Reference?
  
  /// Message payload
  public var payload: [CommunicationRequestPayload]?
  
  /// When is this message scheduled for?
  public var occurrence: OccurrenceX?
  
  /// When request transitioned to being actionable
  public var authoredOn: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>?
  
  /// Who/what is requesting service
  public var requester: Reference?
  
  /// Message recipient
  public var recipient: [Reference]?
  
  /// Message sender
  public var sender: Reference?
  
  /// Why is this communication needed?
  public var reasonCode: [CodeableConcept]?
  
  /// Why is this communication needed
  public var reasonReference: [Reference]?
  
  /// Commends made about this communication request
  public var note: [Annotation]?
  
  public init(status: AlexandriaHRMPrimitive<RequestStatus>) {
    self.status = status
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    identifier: [Identifier]? = nil,
    basedOn: [Reference]? = nil,
    replaces: [Reference]? = nil,
    groupIdentifier: Identifier? = nil,
    status: AlexandriaHRMPrimitive<RequestStatus>,
    statusReason: CodeableConcept? = nil,
    category: [CodeableConcept]? = nil,
    priority: AlexandriaHRMPrimitive<RequestPriority>? = nil,
    doNotPerform: AlexandriaHRMPrimitive<AlexandriaHRMBool>? = nil,
    medium: [CodeableConcept]? = nil,
    subject: Reference? = nil,
    about: [Reference]? = nil,
    encounter: Reference? = nil,
    payload: [CommunicationRequestPayload]? = nil,
    occurrence: OccurrenceX? = nil,
    authoredOn: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>? = nil,
    requester: Reference? = nil,
    recipient: [Reference]? = nil,
    sender: Reference? = nil,
    reasonCode: [CodeableConcept]? = nil,
    reasonReference: [Reference]? = nil,
    note: [Annotation]? = nil
  ) {
    self.init(status: status)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.identifier = identifier
    self.basedOn = basedOn
    self.replaces = replaces
    self.groupIdentifier = groupIdentifier
    self.statusReason = statusReason
    self.category = category
    self.priority = priority
    self.doNotPerform = doNotPerform
    self.medium = medium
    self.subject = subject
    self.about = about
    self.encounter = encounter
    self.payload = payload
    self.occurrence = occurrence
    self.authoredOn = authoredOn
    self.requester = requester
    self.recipient = recipient
    self.sender = sender
    self.reasonCode = reasonCode
    self.reasonReference = reasonReference
    self.note = note
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case identifier
    case basedOn
    case replaces
    case groupIdentifier
    case status; case _status
    case statusReason
    case category
    case priority; case _priority
    case doNotPerform; case _doNotPerform
    case medium
    case subject
    case about
    case encounter
    case payload
    case occurrenceDateTime; case _occurrenceDateTime
    case occurrencePeriod
    case authoredOn; case _authoredOn
    case requester
    case recipient
    case sender
    case reasonCode
    case reasonReference
    case note
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempOccurrence: OccurrenceX?
    if let occurenceDateTime = try AlexandriaHRMPrimitive<AlexandriaHRMDateTime>(from: codingKeyContainer, forKeyIfPresent: .occurrenceDateTime, auxKey: ._occurrenceDateTime) {
      if tempOccurrence != nil {
        throw DecodingError.dataCorruptedError(forKey: .occurrenceDateTime, in: codingKeyContainer, debugDescription: "More than one value provided for \"occurrence\"")
      }
      tempOccurrence = .dateTime(occurenceDateTime)
    }
    
    if let occurrencePeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .occurrencePeriod) {
      if tempOccurrence != nil {
        throw DecodingError.dataCorruptedError(forKey: .occurrencePeriod, in: codingKeyContainer, debugDescription: "More than one value provided for \"occurrence\"")
      }
      tempOccurrence = .period(occurrencePeriod)
    }
    
    self.identifier = try [Identifier](from: codingKeyContainer, forKeyIfPresent: .identifier)
    self.basedOn = try [Reference](from: codingKeyContainer, forKeyIfPresent: .basedOn)
    self.replaces = try [Reference](from: codingKeyContainer, forKeyIfPresent: .replaces)
    self.groupIdentifier = try Identifier(from: codingKeyContainer, forKeyIfPresent: .groupIdentifier)
    self.status = try AlexandriaHRMPrimitive<RequestStatus>(from: codingKeyContainer, forKey: .status, auxKey: ._status)
    self.statusReason = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .statusReason)
    self.category = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .category)
    self.priority = try AlexandriaHRMPrimitive<RequestPriority>(from: codingKeyContainer, forKeyIfPresent: .priority, auxKey: ._priority)
    self.doNotPerform = try AlexandriaHRMPrimitive<AlexandriaHRMBool>(from: codingKeyContainer, forKeyIfPresent: .doNotPerform, auxKey: ._doNotPerform)
    self.medium = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .medium)
    self.subject = try Reference(from: codingKeyContainer, forKeyIfPresent: .subject)
    self.about = try [Reference](from: codingKeyContainer, forKeyIfPresent: .about)
    self.encounter = try Reference(from: codingKeyContainer, forKeyIfPresent: .encounter)
    self.payload = try [CommunicationRequestPayload](from: codingKeyContainer, forKeyIfPresent: .payload)
    self.occurrence = tempOccurrence
    self.authoredOn = try AlexandriaHRMPrimitive<AlexandriaHRMDateTime>(from: codingKeyContainer, forKeyIfPresent: .authoredOn, auxKey: ._authoredOn)
    self.requester = try Reference(from: codingKeyContainer, forKeyIfPresent: .requester)
    self.recipient = try [Reference](from: codingKeyContainer, forKeyIfPresent: .recipient)
    self.sender = try Reference(from: codingKeyContainer, forKeyIfPresent: .sender)
    self.reasonCode = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .reasonCode)
    self.reasonReference = try [Reference](from: codingKeyContainer, forKeyIfPresent: .reasonReference)
    self.note = try [Annotation](from: codingKeyContainer, forKeyIfPresent: .note)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let occurrenceEnum = occurrence {
      switch occurrenceEnum {
      case .dateTime(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .occurrenceDateTime, auxKey: ._occurrenceDateTime)
      case .period(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .occurrencePeriod)
      }
    }
    
    try identifier?.encode(on: &codingKeyContainer, forKey: .identifier)
    try basedOn?.encode(on: &codingKeyContainer, forKey: .basedOn)
    try replaces?.encode(on: &codingKeyContainer, forKey: .replaces)
    try groupIdentifier?.encode(on: &codingKeyContainer, forKey: .groupIdentifier)
    try status.encode(on: &codingKeyContainer, forKey: .status, auxKey: ._status)
    try statusReason?.encode(on: &codingKeyContainer, forKey: .statusReason)
    try category?.encode(on: &codingKeyContainer, forKey: .category)
    try priority?.encode(on: &codingKeyContainer, forKey: .priority, auxKey: ._priority)
    try doNotPerform?.encode(on: &codingKeyContainer, forKey: .doNotPerform, auxKey: ._doNotPerform)
    try medium?.encode(on: &codingKeyContainer, forKey: .medium)
    try subject?.encode(on: &codingKeyContainer, forKey: .subject)
    try about?.encode(on: &codingKeyContainer, forKey: .about)
    try encounter?.encode(on: &codingKeyContainer, forKey: .encounter)
    try payload?.encode(on: &codingKeyContainer, forKey: .payload)
    try authoredOn?.encode(on: &codingKeyContainer, forKey: .authoredOn, auxKey: ._authoredOn)
    try requester?.encode(on: &codingKeyContainer, forKey: .requester)
    try recipient?.encode(on: &codingKeyContainer, forKey: .recipient)
    try sender?.encode(on: &codingKeyContainer, forKey: .sender)
    try reasonCode?.encode(on: &codingKeyContainer, forKey: .reasonCode)
    try reasonReference?.encode(on: &codingKeyContainer, forKey: .reasonReference)
    try note?.encode(on: &codingKeyContainer, forKey: .note)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CommunicationRequestPayload else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return identifier == _other.identifier
    && basedOn == _other.basedOn
    && replaces == _other.replaces
    && groupIdentifier == _other.groupIdentifier
    && status == _other.status
    && statusReason == _other.statusReason
    && category == _other.category
    && priority == _other.priority
    && doNotPerform == _other.doNotPerform
    && medium == _other.medium
    && subject == _other.subject
    && about == _other.about
    && encounter == _other.encounter
    && payload == _other.payload
    && authoredOn == _other.authoredOn
    && requester == _other.requester
    && recipient == _other.recipient
    && sender == _other.sender
    && reasonCode == _other.reasonCode
    && reasonReference == _other.reasonReference
    && note == _other.note
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(identifier)
    hasher.combine(basedOn)
    hasher.combine(replaces)
    hasher.combine(groupIdentifier)
    hasher.combine(status)
    hasher.combine(statusReason)
    hasher.combine(category)
    hasher.combine(priority)
    hasher.combine(doNotPerform)
    hasher.combine(medium)
    hasher.combine(subject)
    hasher.combine(about)
    hasher.combine(encounter)
    hasher.combine(payload)
    hasher.combine(authoredOn)
    hasher.combine(requester)
    hasher.combine(recipient)
    hasher.combine(sender)
    hasher.combine(reasonCode)
    hasher.combine(reasonReference)
    hasher.combine(note)
  }
}
