//
//  DocumentReferenceContext.swift
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
 The clinical context in which the document was prepared
 */
open class DocumentReferenceContext: BackboneElement {
  /// Context of the document content
  public var encounter: [Reference]?
  
  /// Main clinical acts documented
  public var event: [CodeableConcept]?
  
  /// Time of service that is being documented
  public var period: Period?
  
  /// Kind of facility where patient was seen
  public var facilityType: CodeableConcept?
  
  /// Additional details about where the content was created (e.g. clinical specialty)
  public var practiceSetting: CodeableConcept?
  
  /// Patient demographics from source
  public var sourcePatientInfo: Reference?
  
  /// Related identifiers or resources
  public var related: [Reference]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    encounter: [Reference]? = nil,
    event: [CodeableConcept]? = nil,
    period: Period? = nil,
    facilityType: CodeableConcept? = nil,
    practiceSetting: CodeableConcept? = nil,
    sourcePatientInfo: Reference? = nil,
    related: [Reference]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.encounter = encounter
    self.event = event
    self.period = period
    self.facilityType = facilityType
    self.practiceSetting = practiceSetting
    self.sourcePatientInfo = sourcePatientInfo
    self.related = related
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case encounter
    case event
    case period
    case facilityType
    case practiceSetting
    case sourcePatientInfo
    case related
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.encounter = try [Reference](from: codingKeyContainer, forKeyIfPresent: .encounter)
    self.event = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .event)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    self.facilityType = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .facilityType)
    self.practiceSetting = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .practiceSetting)
    self.sourcePatientInfo = try Reference(from: codingKeyContainer, forKeyIfPresent: .sourcePatientInfo)
    self.related = try [Reference](from: codingKeyContainer, forKeyIfPresent: .related)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try encounter?.encode(on: &codingKeyContainer, forKey: .encounter)
    try event?.encode(on: &codingKeyContainer, forKey: .event)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    try facilityType?.encode(on: &codingKeyContainer, forKey: .facilityType)
    try practiceSetting?.encode(on: &codingKeyContainer, forKey: .practiceSetting)
    try sourcePatientInfo?.encode(on: &codingKeyContainer, forKey: .sourcePatientInfo)
    try related?.encode(on: &codingKeyContainer, forKey: .related)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DocumentReferenceContext else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return encounter == _other.encounter
    && event == _other.event
    && period == _other.period
    && facilityType == _other.facilityType
    && practiceSetting == _other.practiceSetting
    && sourcePatientInfo == _other.sourcePatientInfo
    && related == _other.related
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(encounter)
    hasher.combine(event)
    hasher.combine(period)
    hasher.combine(facilityType)
    hasher.combine(practiceSetting)
    hasher.combine(sourcePatientInfo)
    hasher.combine(related)
  }
}
