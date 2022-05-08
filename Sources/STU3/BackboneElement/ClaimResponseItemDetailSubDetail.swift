//
//  ClaimResponseItemDetailSubDetail.swift
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
 Adjudication for claim sub-details; A sub-detail adjudication of a simple product or service
 */
open class ClaimResponseItemDetailSubDetail: BackboneElement {
  /// Claim sub-detail instance identifier
  public var subDetailSequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>
  
  /// Applicable note numbers
  public var noteNumber: [AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>]?
  
  /// Subdetaul level adjudication details
  public var adjudication: [ClaimResponseItemAdjudication]?
  
  public init(subDetailSequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>) {
    self.subDetailSequence = subDetailSequence
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    subDetailSequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>,
    noteNumber: [AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>]? = nil,
    adjudication: [ClaimResponseItemAdjudication]? = nil
  ) {
    self.init(subDetailSequence: subDetailSequence)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.noteNumber = noteNumber
    self.adjudication = adjudication
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case subDetailSequence; case _subDetailSequence
    case noteNumber; case _noteNumber
    case adjudication
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.subDetailSequence = try AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>(from: codingKeyContainer, forKey: .subDetailSequence, auxKey: ._subDetailSequence)
    self.noteNumber = try [AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .noteNumber, auxKey: ._noteNumber)
    self.adjudication = try [ClaimResponseItemAdjudication](from: codingKeyContainer, forKeyIfPresent: .adjudication)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try subDetailSequence.encode(on: &codingKeyContainer, forKey: .subDetailSequence, auxKey: ._subDetailSequence)
    try noteNumber?.encode(on: &codingKeyContainer, forKey: .noteNumber, auxKey: ._noteNumber)
    try adjudication?.encode(on: &codingKeyContainer, forKey: .adjudication)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseItemDetailSubDetail else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return subDetailSequence == _other.subDetailSequence
    && noteNumber == _other.noteNumber
    && adjudication == _other.adjudication
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(subDetailSequence)
    hasher.combine(noteNumber)
    hasher.combine(adjudication)
  }
}
