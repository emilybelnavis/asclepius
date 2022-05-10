//
//  ClaimResponseItemDetail.swift
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
 Adjudication for claim details;  A claim detail containing either a simple item (a product or service) or a "group"
 of sub-details which are simple items
 */
open class ClaimResponseItemDetail: BackboneElement {
  /// Claim detail instance identifier
  public var detailSequence: AsclepiusPrimitive<AsclepiusPositiveInteger>
  
  /// Applicable note numbers
  public var noteNumber: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Detail level adjudication details
  public var adjudication: [ClaimResponseItemAdjudication]
  
  /// Adjudication for claim sub-details
  public var subDetail: [ClaimResponseItemDetailSubDetail]?
  
  public init(detailSequence: AsclepiusPrimitive<AsclepiusPositiveInteger>, adjudication: [ClaimResponseItemAdjudication]) {
    self.detailSequence = detailSequence
    self.adjudication = adjudication
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    detailSequence: AsclepiusPrimitive<AsclepiusPositiveInteger>,
    noteNumber: [AsclepiusPrimitive<AsclepiusPositiveInteger>]? = nil,
    adjudication: [ClaimResponseItemAdjudication],
    subDetail: [ClaimResponseItemDetailSubDetail]? = nil
  ) {
    self.init(detailSequence: detailSequence, adjudication: adjudication)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.detailSequence = detailSequence
    self.noteNumber = noteNumber
    self.adjudication = adjudication
    self.subDetail = subDetail
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case detailSequence; case _detailSequence
    case noteNumber; case _noteNumber
    case adjudication
    case subDetail
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.detailSequence = try AsclepiusPrimitive<AsclepiusPositiveInteger>(from: codingKeyContainer, forKey: .detailSequence, auxKey: ._detailSequence)
    self.noteNumber = try [AsclepiusPrimitive<AsclepiusPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .noteNumber, auxKey: ._noteNumber)
    self.adjudication = try [ClaimResponseItemAdjudication](from: codingKeyContainer, forKey: .adjudication)
    self.subDetail = try [ClaimResponseItemDetailSubDetail](from: codingKeyContainer, forKeyIfPresent: .subDetail)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try detailSequence.encode(on: &codingKeyContainer, forKey: .detailSequence, auxKey: ._detailSequence)
    try noteNumber?.encode(on: &codingKeyContainer, forKey: .noteNumber, auxKey: ._noteNumber)
    try adjudication.encode(on: &codingKeyContainer, forKey: .adjudication)
    try subDetail?.encode(on: &codingKeyContainer, forKey: .subDetail)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseItemDetail else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return detailSequence == _other.detailSequence
    && noteNumber == _other.noteNumber
    && adjudication == _other.adjudication
    && subDetail == _other.subDetail
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(detailSequence)
    hasher.combine(noteNumber)
    hasher.combine(adjudication)
    hasher.combine(subDetail)
  }
}
