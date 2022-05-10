//
//  ClaimInsurance.swift
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
 Patient insurance informatoin. Financial instruments for reimbursement for the healthcare products and
 services specified on the claim.
 */
open class ClaimInsurance: BackboneElement {
  /// Insurance instance identifier
  public var sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>
  
  /// Coverage to be used for adjudication
  public var focal: AsclepiusPrimitive<AsclepiusBool>
  
  /// Pre-assigned claim number
  public var identifier: Identifier?
  
  /// Insurance information
  public var coverage: Reference
  
  /// Additional provider contract number
  public var businessArrangement: AsclepiusPrimitive<AsclepiusString>?
  
  /// Prior authorization reference number
  public var preAuthRef: [AsclepiusPrimitive<AsclepiusString>]?
  
  /// Adjudication results
  public var claimResponse: Reference?
  
  public init(sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>, focal: AsclepiusPrimitive<AsclepiusBool>, coverage: Reference) {
    self.sequence = sequence
    self.focal = focal
    self.coverage = coverage
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>,
    focal: AsclepiusPrimitive<AsclepiusBool>,
    coverage: Reference,
    businessArrangement: AsclepiusPrimitive<AsclepiusString>? = nil,
    preAuthRef: [AsclepiusPrimitive<AsclepiusString>]? = nil,
    claimResponse: Reference? = nil
  ) {
    self.init(sequence: sequence, focal: focal, coverage: coverage)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.businessArrangement = businessArrangement
    self.preAuthRef = preAuthRef
    self.claimResponse = claimResponse
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case focal; case _focal
    case coverage
    case businessArrangement; case _businessArrangement
    case preAuthRef; case _preAuthRef
    case claimResponse
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.sequence = try AsclepiusPrimitive<AsclepiusPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.focal = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKey: .focal, auxKey: ._focal)
    self.coverage = try Reference(from: codingKeyContainer, forKey: .coverage)
    self.businessArrangement = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .businessArrangement, auxKey: ._businessArrangement)
    self.preAuthRef = try [AsclepiusPrimitive<AsclepiusString>](from: codingKeyContainer, forKeyIfPresent: .preAuthRef, auxKey: ._preAuthRef)
    self.claimResponse = try Reference(from: codingKeyContainer, forKeyIfPresent: .claimResponse)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try sequence.encode(on: &codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    try focal.encode(on: &codingKeyContainer, forKey: .focal, auxKey: ._focal)
    try coverage.encode(on: &codingKeyContainer, forKey: .coverage)
    try businessArrangement?.encode(on: &codingKeyContainer, forKey: .businessArrangement, auxKey: ._businessArrangement)
    try preAuthRef?.encode(on: &codingKeyContainer, forKey: .preAuthRef, auxKey: ._preAuthRef)
    try claimResponse?.encode(on: &codingKeyContainer, forKey: .claimResponse)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimInsurance else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return sequence == _other.sequence
    && focal == _other.focal
    && coverage == _other.coverage
    && businessArrangement == _other.businessArrangement
    && preAuthRef == _other.preAuthRef
    && claimResponse == _other.claimResponse
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(focal)
    hasher.combine(coverage)
    hasher.combine(businessArrangement)
    hasher.combine(preAuthRef)
    hasher.combine(claimResponse)
  }
}
