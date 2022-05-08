//
//  ClaimDiagnosis.swift
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
 Pertinent diagnosis information - Information about diagnoses that are relevant to the claim item(s).
 */
open class ClaimDiagnosis: BackboneElement {
  public enum DiagnosisX: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  /// Diagnosis instance identifier
  public var sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>
  
  /// Nature of illness or problem
  public var diagnosisX: DiagnosisX
  
  /// Timing or nature of the diagnosis
  public var type: [CodableConcept]?
  
  /// Present on admission
  public var onAdmission: CodableConcept?
  
  /// Package billing code
  public var packageCode: CodableConcept?
  
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
    type: [CodableConcept]? = nil,
    onAdmission: CodableConcept? = nil,
    packageCode: CodableConcept? = nil
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
    case diagnosisCodableConcept
    case diagnosisReference
    case type
    case onAdmission
    case packageCode
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempDiagnosisX: DiagnosisX?
    if let diagnosisCodableConcept = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .diagnosisCodableConcept) {
      if tempDiagnosisX != nil {
        throw DecodingError.dataCorruptedError(forKey: .diagnosisCodableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"diagnosis\"")
      }
      tempDiagnosisX = .codableConcept(diagnosisCodableConcept)
    }
    
    if let diagnosisReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .diagnosisReference) {
      if tempDiagnosisX != nil {
        throw DecodingError.dataCorruptedError(forKey: .diagnosisReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"diagnosis\"")
      }
      tempDiagnosisX = .reference(diagnosisReference)
    }
    
    self.sequence = try AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.diagnosisX = tempDiagnosisX!
    self.type = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .type)
    self.onAdmission = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .onAdmission)
    self.packageCode = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .packageCode)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    switch diagnosisX {
    case .codableConcept(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .diagnosisCodableConcept)
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
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(diagnosisX)
    hasher.combine(type)
    hasher.combine(onAdmission)
    hasher.combine(packageCode)
  }
}
