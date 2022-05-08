//
//  ClaimResponseError.swift
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
 Processing Errors - Errors encountered during the processing of the adjudication
 */
open class ClaimResponseError: BackboneElement {
  /// Item sequence number
  public var itemSequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>?
  
  /// Detail sequence number
  public var detailSequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>?
  
  /// Subdetail sequence number
  public var subDetailSequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>?
  
  /// Error code detailing processing issues
  public var code: CodeableConcept
  
  public init(code: CodeableConcept) {
    self.code = code
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    itemSequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>? = nil,
    detailSequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>? = nil,
    subDetailSequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>? = nil,
    code: CodeableConcept
  ) {
    self.init(code: code)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.itemSequence = itemSequence
    self.detailSequence = detailSequence
    self.subDetailSequence = subDetailSequence
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case itemSequence; case _itemSequence
    case detailSequence; case _detailSequence
    case subDetailSequence; case _subDetailSequence
    case code
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.itemSequence = try AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: .itemSequence, auxKey: .itemSequence)
    self.detailSequence = try AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: .detailSequence, auxKey: ._detailSequence)
    self.subDetailSequence = try AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: .subDetailSequence, auxKey: ._subDetailSequence)
    self.code = try CodeableConcept(from: codingKeyContainer, forKey: .code)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try itemSequence?.encode(on: &codingKeyContainer, forKey: .itemSequence, auxKey: ._itemSequence)
    try detailSequence?.encode(on: &codingKeyContainer, forKey: .detailSequence, auxKey: ._detailSequence)
    try subDetailSequence?.encode(on: &codingKeyContainer, forKey: .subDetailSequence, auxKey: ._subDetailSequence)
    try code.encode(on: &codingKeyContainer, forKey: .code)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseError else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return itemSequence == _other.itemSequence
    && detailSequence == _other.detailSequence
    && subDetailSequence == _other.subDetailSequence
    && code == _other.code
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(itemSequence)
    hasher.combine(detailSequence)
    hasher.combine(subDetailSequence)
    hasher.combine(code)
  }
}
