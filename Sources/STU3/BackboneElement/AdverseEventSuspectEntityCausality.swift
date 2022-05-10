//
//  AdverseEventSuspectEntityCausality.swift
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

/// Information on the possible cause of the adverse event
open class AdverseEventSuspectEntityCausality: BackboneElement {
  /// Assessment of if the entity caused the event
  public var assessment: CodeableConcept?
  
  /// AdverseEvent.suspectEntity.causalityProductRelatedness
  public var productRelatedness: AsclepiusPrimitive<AsclepiusString>?
  
  /// AdverseEvent.suspectEntity.causalityAuthor
  public var author: Reference?
  
  /// ProbabilityScale | Bayesian | Checklist
  public var method: CodeableConcept?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    assessment: CodeableConcept? = nil,
    productRelatedness: AsclepiusPrimitive<AsclepiusString>? = nil,
    author: Reference? = nil,
    method: CodeableConcept? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.assessment = assessment
    self.productRelatedness = productRelatedness
    self.author = author
    self.method = method
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case assessment
    case productRelatedness; case _productRelatedness
    case author
    case method
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.assessment = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .assessment)
    self.productRelatedness = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .productRelatedness, auxKey: ._productRelatedness)
    self.author = try Reference(from: codingKeyContainer, forKeyIfPresent: .author)
    self.method = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .method)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try assessment?.encode(on: &codingKeyContainer, forKey: .assessment)
    try productRelatedness?.encode(on: &codingKeyContainer, forKey: .productRelatedness, auxKey: ._productRelatedness)
    try author?.encode(on: &codingKeyContainer, forKey: .author)
    try method?.encode(on: &codingKeyContainer, forKey: .method)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? AdverseEventSuspectEntityCausality else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return assessment == _other.assessment
    && productRelatedness == _other.productRelatedness
    && author == _other.author
    && method == _other.method
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(assessment)
    hasher.combine(productRelatedness)
    hasher.combine(author)
    hasher.combine(method)
  }
}
