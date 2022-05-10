//
//  ClaimResponseItem.swift
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
 Adudication for claim line items; A claim line containing either a simple item (a product or service) or a "group"
 of details which can also be either simple items or groups of sub-details
 */
open class ClaimResponseItem: BackboneElement {
  /// Claim item instance identifier
  public var itemSequence: AsclepiusPrimitive<AsclepiusPositiveInteger>
  
  /// Applicable note numbers
  public var noteNumber: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Adjudication details
  public var adjudication: [ClaimResponseItemAdjudication]
  
  /// Adjudication for claim details
  public var detail: [ClaimResponseItemDetail]?
  
  public init(itemSequence: AsclepiusPrimitive<AsclepiusPositiveInteger>, adjudication: [ClaimResponseItemAdjudication]) {
    self.itemSequence = itemSequence
    self.adjudication = adjudication
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    itemSequence: AsclepiusPrimitive<AsclepiusPositiveInteger>,
    noteNumber: [AsclepiusPrimitive<AsclepiusPositiveInteger>]? = nil,
    adjudication: [ClaimResponseItemAdjudication],
    detail: [ClaimResponseItemDetail]? = nil
  ) {
    self.init(itemSequence: itemSequence, adjudication: adjudication)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.noteNumber = noteNumber
    self.detail = detail
  }

  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case itemSequence; case _itemSequence
    case noteNumber; case _noteNumber
    case adjudication
    case detail
  }

  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)

    self.itemSequence = try AsclepiusPrimitive<AsclepiusPositiveInteger>(from: codingKeyContainer, forKey: .itemSequence, auxKey: ._itemSequence)
    self.noteNumber = try [AsclepiusPrimitive<AsclepiusPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .noteNumber, auxKey: ._noteNumber)
    self.adjudication = try [ClaimResponseItemAdjudication](from: codingKeyContainer, forKey: .adjudication)
    self.detail = try [ClaimResponseItemDetail](from: codingKeyContainer, forKeyIfPresent: .detail)
    
    try super.init(from: decoder)
  }
 
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try itemSequence.encode(on: &codingKeyContainer, forKey: .itemSequence, auxKey: ._itemSequence)
    try noteNumber?.encode(on: &codingKeyContainer, forKey: .noteNumber, auxKey: ._noteNumber)
    try adjudication.encode(on: &codingKeyContainer, forKey: .adjudication)
    try detail?.encode(on: &codingKeyContainer, forKey: .detail)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseItem else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return itemSequence == _other.itemSequence
    && noteNumber == _other.noteNumber
    && adjudication == _other.adjudication
    && detail == _other.detail
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(itemSequence)
    hasher.combine(noteNumber)
    hasher.combine(adjudication)
    hasher.combine(detail)
  }
}
