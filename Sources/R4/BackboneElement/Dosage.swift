//
//  Dosage.swift
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
 Indicates how the medication is/was taken or should be taken by the patient.
 */
open class Dosage: BackboneElement {
  /// All possible types for `asNeeded`
  public enum AsNeeded: Hashable {
    case boolean(AlexandriaHRMPrimitive<AlexandriaHRMBool>)
    case codeableConcept(CodeableConcept)
  }
  
  /// The order of the dosage instructiions
  public var sequence: AlexandriaHRMPrimitive<AlexandriaHRMInteger>?
  
  /// Free text dosage instructions
  public var text: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Supplemental instructions or warnings to the patient
  public var additionalInstruction: [CodeableConcept]?
  
  /// Patient or consumer oriented instructions
  public var patientInstruction: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// When medication should be administered
  public var timing: Timing?
  
  /// Take "as needed"
  public var asNeeded: AsNeeded?
  
  /// Body site to administer to
  public var site: CodeableConcept?
  
  /// How the drug should enter the body
  public var route: CodeableConcept?
  
  /// Technique for adminstering medication
  public var method: CodeableConcept?
  
  /// Amount of medication administered
  public var doseAndRate: [DosageDoseAndRate]?
  
  /// Upper limit on medication per unit of time
  public var maxDosePerPeriod: Ratio?
  
  /// Upper limit on medication per administration
  public var maxDosePerAdministration: Quantity?
  
  /// Upper limit on medication per lifetime of the patient
  public var maxDosePerLifetime: Quantity?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    sequence: AlexandriaHRMPrimitive<AlexandriaHRMInteger>? = nil,
    text: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    additionalInstruction: [CodeableConcept]? = nil,
    patientInstruction: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    timing: Timing? = nil,
    asNeeded: AsNeeded? = nil,
    site: CodeableConcept? = nil,
    route: CodeableConcept? = nil,
    method: CodeableConcept? = nil,
    doseAndRate: [DosageDoseAndRate]? = nil,
    maxDosePerPeriod: Ratio? = nil,
    maxDosePerAdministration: Quantity? = nil,
    maxDosePerLifetime: Quantity? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.sequence = sequence
    self.text = text
    self.additionalInstruction = additionalInstruction
    self.patientInstruction = patientInstruction
    self.timing = timing
    self.asNeeded = asNeeded
    self.site = site
    self.route = route
    self.method = method
    self.doseAndRate = doseAndRate
    self.maxDosePerPeriod = maxDosePerPeriod
    self.maxDosePerAdministration = maxDosePerAdministration
    self.maxDosePerLifetime = maxDosePerLifetime
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case text; case _text
    case additionalInstruction
    case patientInstruction; case _patientInstruction
    case timing
    case asNeededBoolean; case _asNeededBoolean
    case asNeededCodeableConcept
    case site
    case route
    case method
    case doseAndRate
    case maxDosePerPeriod
    case maxDosePerAdministration
    case maxDosePerLifetime
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = decoder.container(keyedBy: CodingKeys.self)
    
    var tAsNeeded: AsNeeded?
    if let asNeededBoolean = try AlexandriaHRMPrimitive<AlexandriaHRMBool>(from: codingKeyContainer, forKeyIfPresent: .asNeededBoolean, auxKey: ._asNeededBoolean) {
      if tAsNeeded != nil {
        throw DecodingError.dataCorruptedError(forKey: .asNeededBoolean, in: codingKeyContainer, debugDescription: "More than one value provided for \"asNeeded\"")
      }
      tAsNeeded = .boolean(asNeededBoolean)
    }
    
    if let asNeededCodeableConcept = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .asNeededCodeableConcept) {
      if tAsNeeded != nil {
        throw DecodingError.dataCorruptedError(forKey: .asNeededCodeableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"asNeeded\"")
      }
      tAsNeeded = .codeableConcept(asNeededCodeableConcept)
    }
    
    self.sequence = try AlexandriaHRMPrimitive<AlexandriaHRMInteger>(from: codingKeyContainer, forKeyIfPresent: .sequence, auxKey: ._sequence)
    self.text = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .text, auxKey: ._text)
    self.additionalInstruction = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .additionalInstruction)
    self.patientInstruction = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .patientInstruction, auxKey: ._patientInstruction)
    self.timing = try Timing(from: codingKeyContainer, forKeyIfPresent: .timing)
    self.asNeeded = tAsNeeded
    self.site = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .site)
    self.route = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .route)
    self.method = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .method)
    self.doseAndRate = try [DosageDoseAndRate](from: codingKeyContainer, forKeyIfPresent: .doseAndRate)
    self.maxDosePerPeriod = try Ratio(from: codingKeyContainer, forKeyIfPresent: .maxDosePerPeriod)
    self.maxDosePerAdministration = try Quantity(from: codingKeyContainer, forKeyIfPresent: .maxDosePerAdministration)
    self.maxDosePerLifetime = try Quantity(from: codingKeyContainer, forKeyIfPresent: .maxDosePerLifetime)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumAsNeeded = asNeeded {
      switch enumAsNeeded {
      case .boolean(let boolean):
        try boolean.encode(on: &codingKeyContainer, forKey: .asNeededBoolean)
      case .codeableConcept(let codeableConcept):
        try codeableConcept.encode(on: &codingKeyContainer, forKey: .asNeededCodeableConcept)
      }
    }
    
    try sequence?.encode(on: &codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    try text?.encode(on: &codingKeyContainer, forKey: .text, auxKey: ._text)
    try additionalInstruction?.encode(on: &codingKeyContainer, forKey: .additionalInstruction)
    try patientInstruction?.encode(on: &codingKeyContainer, forKey: .patientInstruction, auxKey: ._patientInstruction)
    try timing?.encode(on: &codingKeyContainer, forKey: .timing)
    try site?.encode(on: &codingKeyContainer, forKey: .site)
    try route?.encode(on: &codingKeyContainer, forKey: .route)
    try method?.encode(on: &codingKeyContainer, forKey: .method)
    try doseAndRate?.encode(on: &codingKeyContainer, forKey: .doseAndRate)
    try maxDosePerPeriod?.encode(on: &codingKeyContainer, forKey: .maxDosePerPeriod)
    try maxDosePerAdministration?.encode(on: &codingKeyContainer, forKey: .maxDosePerAdministration)
    try maxDosePerLifetime?.encode(on: &codingKeyContainer, forKey: .maxDosePerLifetime)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Dosage else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return sequence == _other.sequence
    && text == _other.text
    && additionalInstruction == _other.additionalInstruction
    && patientInstruction == _other.patientInstruction
    && timing == _other.timing
    && asNeeded == _other.asNeeded
    && site == _other.site
    && route == _other.route
    && method == _other.method
    && doseAndRate == _other.doseAndRate
    && maxDosePerPeriod == _other.maxDosePerPeriod
    && maxDosePerAdministration == _other.maxDosePerAdministration
    && maxDosePerLifetime == _other.maxDosePerLifetime
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(text)
    hasher.combine(additionalInstruction)
    hasher.combine(patientInstruction)
    hasher.combine(timing)
    hasher.combine(asNeeded)
    hasher.combine(site)
    hasher.combine(route)
    hasher.combine(method)
    hasher.combine(doseAndRate)
    hasher.combine(maxDosePerPeriod)
    hasher.combine(maxDosePerAdministration)
    hasher.combine(maxDosePerLifetime)
  }
}
