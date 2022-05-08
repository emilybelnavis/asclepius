//
//  CoverageEligibilityRequestInsurance.swift
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
 Patient insurance information; Financial instruments for reimbursement for the healthcare products and services
 */
open class CoverageEligiblityRequestInsurance: BackboneElement {
  /// Applicable coverage
  public var focal: AlexandriaHRMPrimitive<AlexandriaHRMBool>?
  
  /// Insurance information
  public var coverage: Reference
  
  /// Additional provider contract number
  public var businessArrangement: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  public init(coverage: Reference) {
    self.coverage = coverage
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    focal: AlexandriaHRMPrimitive<AlexandriaHRMBool>? = nil,
    coverage: Reference,
    buisnessArrangement: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil
  ) {
    self.init(coverage: coverage)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.focal = focal
    self.businessArrangement = businessArrangement
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case focal; case _focal
    case coverage
    case businessArangement; case _businessArrangement
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.focal = try AlexandriaHRMPrimitive<AlexandriaHRMBool>(from: codingKeyContainer, forKeyIfPresent: .focal, auxKey: ._focal)
    self.coverage = try Reference(from: codingKeyContainer, forKey: .coverage)
    self.businessArrangement = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .businessArangement, auxKey: ._businessArrangement)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try focal?.encode(on: &codingKeyContainer, forKey: .focal, auxKey: ._focal)
    try coverage.encode(on: &codingKeyContainer, forKey: .coverage)
    try businessArrangement?.encode(on: &codingKeyContainer, forKey: .businessArangement, auxKey: ._businessArrangement)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CoverageEligiblityRequestInsurance else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return focal == _other.focal
    && coverage == _other.coverage
    && businessArrangement == _other.businessArrangement
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(focal)
    hasher.combine(coverage)
    hasher.combine(businessArrangement)
  }
}
