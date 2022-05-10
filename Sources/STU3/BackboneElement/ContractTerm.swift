//
//  ContractTerm.swift
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

/// Contract Term List - One or more `Contract Provisions`, which may be related and conveyed as a
/// group, and may contain nested groups
open class ContractTerm: BackboneElement {
  public enum TopicX: Hashable {
    case codeableConcept(CodeableConcept)
    case reference(Reference)
  }
  
  /// Contract Term Number
  public var identifier: Identifier?
  
  /// Contract Term Issue Date/Time
  public var issued: AsclepiusPrimitive<AsclepiusDateTime>?
  
  /// Contract Term Effective Period
  public var applies: Period?
  
  /// Term Concern
  public var topic: TopicX?
  
  /// Contract Term Type or Form
  public var type: CodeableConcept?
  
  /// Contract Term Type specific classification
  public var subType: CodeableConcept?
  
  /// Term statement
  public var text: AsclepiusPrimitive<AsclepiusString>?
  
  /// Protection for the term
  public var securityLabel: [ContractTermSecurityLabel]?
  
  /// Context of the Contract term
  public var offer: ContractTermOffer
  
  /// Contract Term Asset List
  public var asset: [ContractTermAsset]?
  
  /// Entity being ascribed responsibility
  public var action: [ContractTermAction]?
  
  /// Nested Contract Term Group
  public var group: [ContractTerm]?
 
  public init(offer: ContractTermOffer) {
    self.offer = offer
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    identifier: Identifier? = nil,
    issued: AsclepiusPrimitive<AsclepiusDateTime>? = nil,
    applies: Period? = nil,
    topic: TopicX? = nil,
    type: CodeableConcept? = nil,
    subType: CodeableConcept? = nil,
    text: AsclepiusPrimitive<AsclepiusString>? = nil,
    securityLabel: [ContractTermSecurityLabel]? = nil,
    offer: ContractTermOffer,
    asset: [ContractTermAsset]? = nil,
    action: [ContractTermAction]? = nil,
    group: [ContractTerm]? = nil
  ) {
    self.init(offer: offer)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.identifier = identifier
    self.issued = issued
    self.applies = applies
    self.topic = topic
    self.type = type
    self.subType = subType
    self.text = text
    self.securityLabel = securityLabel
    self.asset = asset
    self.action = action
    self.group = group
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case identifier
    case issued; case _issued
    case applies
    case topicCodeableConcept
    case topicReference
    case type
    case subType
    case text; case _text
    case securityLabel
    case offer
    case asset
    case action
    case group
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tTopic: TopicX?
    if let topicCodeableConcept = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .topicCodeableConcept) {
      if tTopic != nil {
        throw DecodingError.dataCorruptedError(forKey: .topicCodeableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"topic\"")
      }
      tTopic = .codeableConcept(topicCodeableConcept)
    }
    
    if let topicReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .topicReference) {
      if tTopic != nil {
        throw DecodingError.dataCorruptedError(forKey: .topicReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"topic\"")
      }
      tTopic = .reference(topicReference)
    }
    
    self.identifier = try Identifier(from: codingKeyContainer, forKey: .identifier)
    self.issued = try AsclepiusPrimitive<AsclepiusDateTime>(from: codingKeyContainer, forKeyIfPresent: .issued, auxKey: ._issued)
    self.applies = try Period(from: codingKeyContainer, forKeyIfPresent: .applies)
    self.topic = tTopic
    self.type = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.subType = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .subType)
    self.text = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .text, auxKey: ._text)
    self.securityLabel = try [ContractTermSecurityLabel](from: codingKeyContainer, forKeyIfPresent: .securityLabel)
    self.offer = try ContractTermOffer(from: codingKeyContainer, forKey: .offer)
    self.asset = try [ContractTermAsset](from: codingKeyContainer, forKeyIfPresent: .asset)
    self.action = try [ContractTermAction](from: codingKeyContainer, forKeyIfPresent: .action)
    self.group = try [ContractTerm](from: codingKeyContainer, forKeyIfPresent: .group)
  
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumTopic = topic {
      switch enumTopic {
      case .codeableConcept(let codeableConcept):
        try codeableConcept.encode(on: &codingKeyContainer, forKey: .topicCodeableConcept)
      case .reference(let reference):
        try reference.encode(on: &codingKeyContainer, forKey: .topicReference)
      }
    }
    
    try identifier?.encode(on: &codingKeyContainer, forKey: .identifier)
    try issued?.encode(on: &codingKeyContainer, forKey: .issued, auxKey: ._issued)
    try applies?.encode(on: &codingKeyContainer, forKey: .applies)
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try subType?.encode(on: &codingKeyContainer, forKey: .subType)
    try text?.encode(on: &codingKeyContainer, forKey: .text, auxKey: ._text)
    try securityLabel?.encode(on: &codingKeyContainer, forKey: .securityLabel)
    try offer.encode(on: &codingKeyContainer, forKey: .offer)
    try asset?.encode(on: &codingKeyContainer, forKey: .asset)
    try action?.encode(on: &codingKeyContainer, forKey: .action)
    try group?.encode(on: &codingKeyContainer, forKey: .group)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContractTerm else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return identifier == _other.identifier
    && issued == _other.issued
    && applies == _other.applies
    && topic == _other.topic
    && type == _other.type
    && subType == _other.subType
    && text == _other.text
    && securityLabel == _other.securityLabel
    && offer == _other.offer
    && asset == _other.asset
    && action == _other.action
    && group == _other.group
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(identifier)
    hasher.combine(issued)
    hasher.combine(applies)
    hasher.combine(topic)
    hasher.combine(type)
    hasher.combine(subType)
    hasher.combine(text)
    hasher.combine(securityLabel)
    hasher.combine(offer)
    hasher.combine(asset)
    hasher.combine(action)
    hasher.combine(group)
  }
}
