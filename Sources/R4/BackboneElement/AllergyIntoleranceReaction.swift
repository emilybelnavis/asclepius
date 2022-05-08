//
//  AllergyIntoleranceReaction.swift
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

/// Details about each adverse reaction event linked to an exposure to the identified substance
open class AllergyIntoleranceReaction: BackboneElement {
  /// Specific substance or pharmaceutical product considered to be responsible for the event
  public var substance: CodeableConcept?
  
  /// Clinical symptoms/signs associated with the event
  public var manifestation: [CodeableConcept]
  
  /// Description of the event as a whole
  public var fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Date(and if available, time) when manifestations occured
  public var onset: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>?
  
  /// Clinical assessment of the severity of the reaction event as a whole. Potentially considering multiple
  /// different manifestations
  public var severity: AlexandriaHRMPrimitive<AllergyIntoleranceSeverity>?

  /// How the subject was exposed to the substance
  public var exposureRoute: CodeableConcept?
  
  /// Details about event not captured in other fields
  public var note: [Annotation]?
  
  public init(manifestation: [CodeableConcept]) {
    self.manifestation = manifestation
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    substance: CodeableConcept? = nil,
    manifestation: [CodeableConcept],
    fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    onset: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>? = nil,
    severity: AlexandriaHRMPrimitive<AllergyIntoleranceSeverity>? = nil,
    exposureRoute: CodeableConcept? = nil,
    note: [Annotation]? = nil
  ) {
    self.init(manifestation: manifestation)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.substance = substance
    self.fhirDescription = fhirDescription
    self.onset = onset
    self.severity = severity
    self.exposureRoute = exposureRoute
    self.note = note
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case substance
    case manifestation
    case fhirDescription; case _fhirDescription
    case onset; case _onset
    case severity; case _severity
    case exposureRoute
    case note
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.substance = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .substance)
    self.manifestation = try [CodeableConcept](from: codingKeyContainer, forKey: .manifestation)
    self.fhirDescription = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.onset = try AlexandriaHRMPrimitive<AlexandriaHRMDateTime>(from: codingKeyContainer, forKeyIfPresent: .onset, auxKey: ._onset)
    self.severity = try AlexandriaHRMPrimitive<AllergyIntoleranceSeverity>(from: codingKeyContainer, forKeyIfPresent: .severity, auxKey: ._severity)
    self.exposureRoute = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .exposureRoute)
    self.note = try [Annotation](from: codingKeyContainer, forKeyIfPresent: .note)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try substance?.encode(on: &codingKeyContainer, forKey: .substance)
    try manifestation.encode(on: &codingKeyContainer, forKey: .manifestation)
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try onset?.encode(on: &codingKeyContainer, forKey: .onset, auxKey: ._onset)
    try severity?.encode(on: &codingKeyContainer, forKey: .severity, auxKey: ._severity)
    try exposureRoute?.encode(on: &codingKeyContainer, forKey: .exposureRoute)
    try note?.encode(on: &codingKeyContainer, forKey: .note)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? AllergyIntoleranceReaction else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return substance == _other.substance
    && manifestation == _other.manifestation
    && fhirDescription == _other.fhirDescription
    && onset == _other.onset
    && severity == _other.severity
    && exposureRoute == _other.exposureRoute
    && note == _other.note
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(substance)
    hasher.combine(manifestation)
    hasher.combine(fhirDescription)
    hasher.combine(onset)
    hasher.combine(severity)
    hasher.combine(exposureRoute)
    hasher.combine(note)
  }
}
