//
//  AllergyIntoleranceReaction.swift
//  FHIRKit
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

import FHIRKitCore

/// Details about each adverse reaction event linked to an exposure to the identified substance
open class AllergyIntoleranceReaction: BackboneElement {
  /// Specific substance or pharmaceutical product considered to be responsible for the event
  public var substance: CodableConcept?
  
  /// Clinical symptoms/signs associated with the event
  public var manifestation: [CodableConcept]
  
  /// Description of the event as a whole
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  
  /// Date(and if available, time) when manifestations occured
  public var onset: FHIRKitPrimitive<FHIRKitDateTime>?
  
  /// Clinical assessment of the severity of the reaction event as a whole. Potentially considering multiple
  /// different manifestations
  public var severity: FHIRKitPrimitive<AllergyIntoleranceSeverity>?

  /// How the subject was exposed to the substance
  public var exposureRoute: CodableConcept?
  
  /// Details about event not captured in other fields
  public var note: [Annotation]?
  
  public init(manifestation: [CodableConcept]) {
    self.manifestation = manifestation
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    substance: CodableConcept? = nil,
    manifestation: [CodableConcept],
    fhirDescription: FHIRKitPrimitive<FHIRKitString>? = nil,
    onset: FHIRKitPrimitive<FHIRKitDateTime>? = nil,
    severity: FHIRKitPrimitive<AllergyIntoleranceSeverity>? = nil,
    exposureRoute: CodableConcept? = nil,
    note: [Annotation]? = nil
  ) {
    self.init(manifestation: manifestation)
    self.fhirExtension = fhirExtension
    self.id = id
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
    
    self.substance = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .substance)
    self.manifestation = try [CodableConcept](from: codingKeyContainer, forKey: .manifestation)
    self.fhirDescription = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.onset = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .onset, auxKey: ._onset)
    self.severity = try FHIRKitPrimitive<AllergyIntoleranceSeverity>(from: codingKeyContainer, forKeyIfPresent: .severity, auxKey: ._severity)
    self.exposureRoute = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .exposureRoute)
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