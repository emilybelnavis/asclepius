//
//  ClinicalImpressionInvestigation.swift
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
 One or more sets of investigations (signs, symptoms, etc...). The actual grouping of investigations varies greatly
 depending on the type and context of the assessment. These investigations may include data generated
 during the assessment process, or data that was previously generated and recorded that is pertinent to the
 outcomes
 */
open class ClinicalImpressionInvestigation: BackboneElement {
  /// A name/code for the set
  public var code: CodeableConcept
  
  /// Record of a specific investigation
  public var item: [Reference]?
  
  public init(code: CodeableConcept) {
    self.code = code
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    code: CodeableConcept,
    item: [Reference]?
  ) {
    self.init(code: code)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.item = item
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code
    case item
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.code = try CodeableConcept(from: codingKeyContainer, forKey: .code)
    self.item = try [Reference](from: codingKeyContainer, forKeyIfPresent: .item)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try code.encode(on: &codingKeyContainer, forKey: .code)
    try item?.encode(on: &codingKeyContainer, forKey: .item)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClinicalImpressionInvestigation else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return code == _other.code
    && item == _other.item
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(item)
  }
}
