//
//  CoverageEligibilityResponseInsurance.swift
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
 Patient insurance information; Financial instruments for reimbursement for the healthcare products and services
 */
open class CoverageEligibilityResponseInsurance: BackboneElement {
  /// Insurance information
  public var coverage: Reference
  
  /// Coverage inforce indicator
  public var inForce: AsclepiusPrimitive<AsclepiusBool>?
  
  /// When the benefits are applicable
  public var benefitPeriod: Period?
  
  /// Benefits and authorization details
  public var item: [CoverageEligibilityResponseInsuranceItem]?
  
  public init(coverage: Reference) {
    self.coverage = coverage
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    coverage: Reference,
    inForce: AsclepiusPrimitive<AsclepiusBool>? = nil,
    benefitPeriod: Period? = nil,
    item: [CoverageEligibilityResponseInsuranceItem]? = nil
  ) {
    self.init(coverage: coverage)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.inForce = inForce
    self.benefitPeriod = benefitPeriod
    self.item = item
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case coverage
    case inForce; case _inForce
    case benefitPeriod
    case item
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.coverage = try Reference(from: codingKeyContainer, forKey: .coverage)
    self.inForce = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .inForce, auxKey: ._inForce)
    self.benefitPeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .benefitPeriod)
    self.item = try [CoverageEligibilityResponseInsuranceItem](from: codingKeyContainer, forKeyIfPresent: .item)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try coverage.encode(on: &codingKeyContainer, forKey: .coverage)
    try inForce?.encode(on: &codingKeyContainer, forKey: .inForce, auxKey: ._inForce)
    try benefitPeriod?.encode(on: &codingKeyContainer, forKey: .benefitPeriod)
    try item?.encode(on: &codingKeyContainer, forKey: .item)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CoverageEligibilityResponseInsurance else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return coverage == _other.coverage
    && inForce == _other.inForce
    && benefitPeriod == _other.benefitPeriod
    && item == _other.item
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(coverage)
    hasher.combine(inForce)
    hasher.combine(benefitPeriod)
    hasher.combine(item)
  }
}
