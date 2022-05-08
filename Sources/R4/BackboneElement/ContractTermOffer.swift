//
//  ContractTermOffer.swift
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

/// Context of the Contract Term - The matter of concern in this the context of this provision of the agreement
open class ContractTermOffer: BackboneElement {
  /// Offer business id
  public var identifier: [Identifier]?
  
  /// Offer recipient
  public var party: [ContractTermOfferParty]?
  
  /// Negotiable offer asset
  public var topic: Reference?
  
  /// Contract offer type or form
  public var type: CodableConcept?
  
  /// Accepting party choice
  public var decision: CodableConcept?
  
  /// How decision is conveyed
  public var decisionMode: [CodableConcept]?
  
  /// Response to offer text
  public var answer: [ContractTermOfferAnswer]?
  
  /// Human readable offer text
  public var text: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Pointer to offer text
  public var linkId: [AlexandriaHRMPrimitive<AlexandriaHRMString>]?
  
  /// Offer security restriction numbers
  public var securityLabelNumber: [AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    identifier: [Identifier]? = nil,
    party: [ContractTermOfferParty]? = nil,
    topic: Reference? = nil,
    type: CodableConcept? = nil,
    decision: CodableConcept? = nil,
    decisionMode: [CodableConcept]? = nil,
    answer: [ContractTermOfferAnswer]? = nil,
    text: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    linkId: [AlexandriaHRMPrimitive<AlexandriaHRMString>]? = nil,
    securityLabelNumber: [AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.fhirIdentifier = fhirIdentifier
    self.party = party
    self.topic = topic
    self.type = type
    self.decision = decision
    self.decisionMode = decisionMode
    self.answer = answer
    self.text = text
    self.linkId = linkId
    self.securityLabelNumber = securityLabelNumber
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case identifier
    case party
    case topic
    case type
    case decision
    case decisionMode
    case answer
    case text; case _text
    case linkId; case _linkId
    case securityLabelNumber; case _securityLabelNumber
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.fhirIdentifier = try [Identifier](from: codingKeyContainer, forKeyIfPresent: .identifier)
    self.party = try [ContractTermOfferParty](from: codingKeyContainer, forKeyIfPresent: .party)
    self.topic = try Reference(from: codingKeyContainer, forKeyIfPresent: .topic)
    self.type = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.decision = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .decision)
    self.decisionMode = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .decisionMode)
    self.answer = try [ContractTermOfferAnswer](from: codingKeyContainer, forKeyIfPresent: .answer)
    self.text = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .text, auxKey: .text)
    self.linkId = try [AlexandriaHRMPrimitive<AlexandriaHRMString>](from: codingKeyContainer, forKeyIfPresent: .linkId, auxKey: ._linkId)
    self.securityLabelNumber = try [AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>](from: codingKeyContainer, forKeyIfPresent: .securityLabelNumber, auxKey: ._securityLabelNumber)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try identifier?.encode(on: &codingKeyContainer, forKey: .identifier)
    try party?.encode(on: &codingKeyContainer, forKey: .party)
    try topic?.encode(on: &codingKeyContainer, forKey: .topic)
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try decision?.encode(on: &codingKeyContainer, forKey: .decision)
    try decisionMode?.encode(on: &codingKeyContainer, forKey: .decisionMode)
    try answer?.encode(on: &codingKeyContainer, forKey: .answer)
    try text?.encode(on: &codingKeyContainer, forKey: .text, auxKey: ._text)
    try linkId?.encode(on: &codingKeyContainer, forKey: .linkId, auxKey: ._linkId)
    try securityLabelNumber?.encode(on: &codingKeyContainer, forKey: .securityLabelNumber, auxKey: ._securityLabelNumber)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContractTermOffer else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return identifier == _other.identifier
    && party == _other.party
    && topic == _other.topic
    && type == _other.type
    && decision == _other.decision
    && decisionMode == _other.decisionMode
    && answer == _other.answer
    && text == _other.text
    && linkId == _other.linkId
    && securityLabelNumber == _other.securityLabelNumber
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(identifier)
    hasher.combine(party)
    hasher.combine(topic)
    hasher.combine(type)
    hasher.combine(decision)
    hasher.combine(decisionMode)
    hasher.combine(answer)
    hasher.combine(text)
    hasher.combine(linkId)
    hasher.combine(securityLabelNumber)
  }
}
