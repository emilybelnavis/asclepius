//
//  CarePlanActivity.swift
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
 Identifies a planned action to occur as part of the care plan. For example, a medication to be used, lab tests
 to perform, self-monitoring, patient education, etc...
 
 https://www.hl7.org/fhir/careplan-definitions.html#CarePlan.activity
 */
open class CarePlanActivity: BackboneElement {
  /// Results of the activity
  public var outcomeCodeableConcept: [CodeableConcept]?
  
  /// Appointment, Encounter, Procedure, etc...
  public var outcomeReference: [Reference]?
  
  /// Comments about the activity status/progress
  public var progress: [Annotation]?
  
  /// Activity details defined in specific resource
  public var reference: Reference?
  
  /// In-line definition of activity
  public var detail: CarePlanActivityDetail?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    outcomeCodeableConcept: [CodeableConcept]? = nil,
    outcomeReference: [Reference]? = nil,
    progress: [Annotation]? = nil,
    reference: Reference? = nil,
    detail: CarePlanActivityDetail? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.outcomeCodeableConcept = outcomeCodeableConcept
    self.outcomeReference = outcomeReference
    self.progress = progress
    self.reference = reference
    self.detail = detail
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case outcomeCodeableConcept
    case outcomeReference
    case progress
    case reference
    case detail
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.outcomeCodeableConcept = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .outcomeReference)
    self.outcomeReference = try [Reference](from: codingKeyContainer, forKeyIfPresent: .outcomeReference)
    self.progress = try [Annotation](from: codingKeyContainer, forKeyIfPresent: .progress)
    self.reference = try Reference(from: codingKeyContainer, forKeyIfPresent: .reference)
    self.detail = try CarePlanActivityDetail(from: codingKeyContainer, forKeyIfPresent: .detail)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try outcomeCodeableConcept?.encode(on: &codingKeyContainer, forKey: .outcomeCodeableConcept)
    try outcomeReference?.encode(on: &codingKeyContainer, forKey: .outcomeReference)
    try progress?.encode(on: &codingKeyContainer, forKey: .progress)
    try reference?.encode(on: &codingKeyContainer, forKey: .reference)
    try detail?.encode(on: &codingKeyContainer, forKey: .detail)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CarePlanActivity else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return outcomeCodeableConcept == _other.outcomeCodeableConcept
    && outcomeReference == _other.outcomeReference
    && progress == _other.progress
    && reference == _other.reference
    && detail == _other.detail
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(outcomeCodeableConcept)
    hasher.combine(outcomeReference)
    hasher.combine(reference)
    hasher.combine(detail)
  }
}
