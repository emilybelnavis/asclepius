//
//  ClaimDiagnosis.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/**
 Pertinent diagnosis information - Information about diagnoses that are relevant to the claim item(s).
 */
open class ClaimDiagnosis: BackboneElement {
  public enum DiagnosisX: Hashable {
    case codeableConcept(CodeableConcept)
    case reference(Reference)
  }
  
  /// Diagnosis instance identifier
  public var sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>
  
  /// Nature of illness or problem
  public var diagnosisX: DiagnosisX
  
  /// Timing or nature of the diagnosis
  public var type: [CodeableConcept]?
  
  /// Present on admission
  public var onAdmission: CodeableConcept?
  
  /// Package billing code
  public var packageCode: CodeableConcept?
  
  public init(sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>, diagnosisX: DiagnosisX) {
    self.sequence = sequence
    self.diagnosisX = diagnosisX
    super.init()
  }

  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>,
    diagnosisX: DiagnosisX,
    type: [CodeableConcept]? = nil,
    onAdmission: CodeableConcept? = nil,
    packageCode: CodeableConcept? = nil
  ) {
    self.init(sequence: sequence, diagnosisX: diagnosisX)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.type = type
    self.onAdmission = onAdmission
    self.packageCode = packageCode
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case diagnosisCodeableConcept
    case diagnosisReference
    case type
    case onAdmission
    case packageCode
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempDiagnosisX: DiagnosisX?
    if let diagnosisCodeableConcept = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .diagnosisCodeableConcept) {
      if tempDiagnosisX != nil {
        throw DecodingError.dataCorruptedError(forKey: .diagnosisCodeableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"diagnosis\"")
      }
      tempDiagnosisX = .codeableConcept(diagnosisCodeableConcept)
    }
    
    if let diagnosisReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .diagnosisReference) {
      if tempDiagnosisX != nil {
        throw DecodingError.dataCorruptedError(forKey: .diagnosisReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"diagnosis\"")
      }
      tempDiagnosisX = .reference(diagnosisReference)
    }
    
    self.sequence = try AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.diagnosisX = tempDiagnosisX!
    self.type = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .type)
    self.onAdmission = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .onAdmission)
    self.packageCode = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .packageCode)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    switch diagnosisX {
    case .codeableConcept(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .diagnosisCodeableConcept)
    case .reference(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .diagnosisReference)
    }
    
    try sequence.encode(on: &codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try onAdmission?.encode(on: &codingKeyContainer, forKey: .onAdmission)
    try packageCode?.encode(on: &codingKeyContainer, forKey: .packageCode)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimDiagnosis else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return sequence == _other.sequence
    && diagnosisX == _other.diagnosisX
    && type == _other.type
    && onAdmission == _other.onAdmission
    && packageCode == _other.packageCode
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(diagnosisX)
    hasher.combine(type)
    hasher.combine(onAdmission)
    hasher.combine(packageCode)
  }
}
