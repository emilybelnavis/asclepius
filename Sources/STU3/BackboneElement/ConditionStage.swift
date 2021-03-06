//
//  ConditionStage.swift
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
 Clinical stage or grade of a condition, may include formal severity assessments
 */
open class ConditionStage: BackboneElement {
  /// Simple summary (disease specific)
  public var summary: CodeableConcept?
  
  /// Formal record of assessment
  public var assessment: [Reference]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    summary: CodeableConcept? = nil,
    assessment: [Reference]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.summary = summary
    self.assessment = assessment
  }
  
   // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case summary
    case assessment
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.summary = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .summary)
    self.assessment = try [Reference](from: codingKeyContainer, forKeyIfPresent: .assessment)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try summary?.encode(on: &codingKeyContainer, forKey: .summary)
    try assessment?.encode(on: &codingKeyContainer, forKey: .assessment)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ConditionStage else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return summary == _other.summary
    && assessment == _other.assessment
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(summary)
    hasher.combine(assessment)
  }
}
