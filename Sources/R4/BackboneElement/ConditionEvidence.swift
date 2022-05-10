//
//  ConditionEvidence.swift
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

/// Supporting evidence/manifestations that are the basis of the Condition's verification status, such as
/// evidence that confirmed or refuted the condition
open class ConditionEvidence: BackboneElement {
  /// Manifestation/symptom
  public var code: [CodeableConcept]?
  
  /// Supporting information found elsewhere
  public var detail: [Reference]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    code: [CodeableConcept]? = nil,
    detail: [Reference]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.code = code
    self.detail = detail
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code
    case detail
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.code = try [CodeableConcept](from: codingKeyContainer, forKey: .code)
    self.detail = try [Reference](from: codingKeyContainer, forKey: .detail)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try code?.encode(on: &codingKeyContainer, forKey: .code)
    try detail?.encode(on: &codingKeyContainer, forKey: .detail)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ConditionEvidence else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return code == _other.code
    && detail == _other.detail
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(detail)
  }
}
