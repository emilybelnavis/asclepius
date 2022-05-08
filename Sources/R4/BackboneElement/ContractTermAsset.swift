//
//  ContractTermAsset.swift
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

/// Contract Term Asset List
open class ContractTermAsset: BackboneElement {
  /// Range of asset
  public var scope: CodeableConcept?
  
  /// Asset category
  public var type: [CodeableConcept]?
  
  /// Associated entities
  public var typeReference: [Reference]?
  
  /// Asset sub-category
  public var subType: [CodeableConcept]?
  
  /// Relationship of the asset
  public var relationship: Coding?
  
  /// Circumstances of the asset
  public var context: [ContractTermAssetContext]?
  
  /// Quality description of the asset
  public var condition: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Asset availability types
  public var periodType: [CodeableConcept]?
  
  /// Time period of the asset
  public var period: [Period]?
  
  /// Time period
  public var usePeriod: [Period]?
  
  /// Asset clause or question text
  public var text: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Pointer to asset text
  public var linkId: [AlexandriaHRMPrimitive<AlexandriaHRMString>]?
  
  /// Response to assets
  public var answer: [ContractTermOfferAnswer]?
  
  /// Asset restriction numbers
  public var securityLabelNumber: [AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>]?
  
  /// Contract Valued Item List
  public var valuedItem: [ContractTermAssetValuedItem]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    scope: CodeableConcept? = nil,
    type: [CodeableConcept]? = nil,
    typeReference: [Reference]? = nil,
    subType: [CodeableConcept]? = nil,
    relationship: Coding? = nil,
    context: [ContractTermAssetContext]? = nil,
    condition: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    periodType: [CodeableConcept]? = nil,
    period: [Period]? = nil,
    usePeriod: [Period]? = nil,
    text: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    linkId: [AlexandriaHRMPrimitive<AlexandriaHRMString>]? = nil,
    answer: [ContractTermOfferAnswer]? = nil,
    securityLabelNumber: [AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>]? = nil,
    valuedItem: [ContractTermAssetValuedItem]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.scope = scope
    self.type = type
    self.typeReference = typeReference
    self.subType = subType
    self.relationship = relationship
    self.context = context
    self.condition = condition
    self.periodType = periodType
    self.period = period
    self.usePeriod = usePeriod
    self.text = text
    self.linkId = linkId
    self.answer = answer
    self.securityLabelNumber = securityLabelNumber
    self.valuedItem = valuedItem
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case scope
    case type
    case typeReference
    case subType
    case relationship
    case context
    case condition; case _condition
    case periodType
    case period
    case usePeriod
    case text; case _text
    case linkId; case _linkId
    case answer
    case securityLabelNumber; case _securityLabelNumber
    case valuedItem
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.scope = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .scope)
    self.type = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .type)
    self.typeReference = try [Reference](from: codingKeyContainer, forKeyIfPresent: .typeReference)
    self.subType = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .subType)
    self.relationship = try Coding(from: codingKeyContainer, forKeyIfPresent: .relationship)
    self.context = try [ContractTermAssetContext](from: codingKeyContainer, forKeyIfPresent: .context)
    self.condition = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .condition, auxKey: ._condition)
    self.periodType = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .periodType)
    self.period = try [Period](from: codingKeyContainer, forKeyIfPresent: .period)
    self.usePeriod = try [Period](from: codingKeyContainer, forKeyIfPresent: .usePeriod)
    self.text = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .text, auxKey: ._text)
    self.linkId = try [AlexandriaHRMPrimitive<AlexandriaHRMString>](from: codingKeyContainer, forKeyIfPresent: .linkId, auxKey: ._linkId)
    self.answer = try [ContractTermOfferAnswer](from: codingKeyContainer, forKeyIfPresent: .answer)
    self.securityLabelNumber = try [AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>](from: codingKeyContainer, forKeyIfPresent: .securityLabelNumber, auxKey: ._securityLabelNumber)
    self.valuedItem = try [ContractTermAssetValuedItem](from: codingKeyContainer, forKeyIfPresent: .valuedItem)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try scope?.encode(on: &codingKeyContainer, forKey: .scope)
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try typeReference?.encode(on: &codingKeyContainer, forKey: .typeReference)
    try subType?.encode(on: &codingKeyContainer, forKey: .subType)
    try relationship?.encode(on: &codingKeyContainer, forKey: .relationship)
    try context?.encode(on: &codingKeyContainer, forKey: .context)
    try condition?.encode(on: &codingKeyContainer, forKey: .condition, auxKey: ._condition)
    try periodType?.encode(on: &codingKeyContainer, forKey: .periodType)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    try usePeriod?.encode(on: &codingKeyContainer, forKey: .usePeriod)
    try text?.encode(on: &codingKeyContainer, forKey: .text, auxKey: ._text)
    try linkId?.encode(on: &codingKeyContainer, forKey: .linkId, auxKey: ._linkId)
    try answer?.encode(on: &codingKeyContainer, forKey: .answer)
    try securityLabelNumber?.encode(on: &codingKeyContainer, forKey: .securityLabelNumber, auxKey: ._securityLabelNumber)
    try valuedItem?.encode(on: &codingKeyContainer, forKey: .valuedItem)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContractTermAsset else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return scope == _other.scope
    && type == _other.type
    && typeReference == _other.typeReference
    && subType == _other.subType
    && relationship == _other.relationship
    && context == _other.context
    && condition == _other.condition
    && periodType == _other.periodType
    && period == _other.period
    && usePeriod == _other.usePeriod
    && text == _other.text
    && linkId == _other.linkId
    && answer == _other.answer
    && securityLabelNumber == _other.securityLabelNumber
    && valuedItem == _other.valuedItem
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(scope)
    hasher.combine(type)
    hasher.combine(typeReference)
    hasher.combine(subType)
    hasher.combine(relationship)
    hasher.combine(context)
    hasher.combine(condition)
    hasher.combine(periodType)
    hasher.combine(period)
    hasher.combine(usePeriod)
    hasher.combine(text)
    hasher.combine(linkId)
    hasher.combine(answer)
    hasher.combine(securityLabelNumber)
    hasher.combine(valuedItem)
  }
}
