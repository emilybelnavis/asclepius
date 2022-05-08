//
//  CoverageEligibilityRequestItemDiagnosis.swift
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
 Applicable diagnosis; Patient diagnosis for which care is sought
 */
open class CoverageEligibilityRequestItemDiagnosis: BackboneElement {
  public enum DiagnosisX: Hashable {
    case codeableConcept(CodeableConcept)
    case reference(Reference)
  }
  
  public var diagnosis: DiagnosisX?
  
  public override init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    diagnosis: DiagnosisX? = nil
  ) {
    self.init()
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case diagnosisCodeableConcept
    case diagnosisReference
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempDiagnosis: DiagnosisX?
    if let diagnosisCodeableConcept = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .diagnosisCodeableConcept) {
      if tempDiagnosis != nil {
        throw DecodingError.dataCorruptedError(forKey: .diagnosisCodeableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"diagnosis\"")
      }
      tempDiagnosis = .codeableConcept(diagnosisCodeableConcept)
    }
    
    if let diagnosisReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .diagnosisReference) {
      if tempDiagnosis != nil {
        throw DecodingError.dataCorruptedError(forKey: .diagnosisReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"diagnosis\"")
      }
      tempDiagnosis = .reference(diagnosisReference)
    }
    
    self.diagnosis = tempDiagnosis
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumDiagnosis = diagnosis {
      switch enumDiagnosis {
      case .codeableConcept(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .diagnosisCodeableConcept)
      case .reference(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .diagnosisReference)
      }
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CoverageEligibilityRequestItemDiagnosis else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return diagnosis == _other.diagnosis
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(diagnosis)
  }
}
