//
//  EvidenceVariableCharacteristicDefinitionX.swift
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

open class EvidenceVariableCharacteristicDefinitionX: Element {
  public var reference: Reference?
  public var canonical: AsclepiusPrimitive<Canonical>?
  public var codeableConcept: CodeableConcept?
  public var expression: Expression?
  public var dataRequirement: DataRequirement?
  public var triggerDefinition: TriggerDefinition?
  
  // MARK: - Class Functions
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    reference: Reference? = nil,
    canonical: AsclepiusPrimitive<Canonical>? = nil,
    codeableConcept: CodeableConcept? = nil,
    expression: Expression? = nil,
    dataRequirement: DataRequirement? = nil,
    triggerDefinition: TriggerDefinition? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.reference = reference
    self.canonical = canonical
    self.codeableConcept = codeableConcept
    self.expression = expression
    self.dataRequirement = dataRequirement
    self.triggerDefinition = triggerDefinition
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case reference
    case canonical; case _canonical
    case codeableConcept
    case expression
    case dataRequirement
    case triggerDefinition
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.reference = try Reference(from: codingKeyContainer, forKeyIfPresent: .reference)
    self.canonical = try AsclepiusPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .canonical, auxKey: ._canonical)
    self.codeableConcept = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .codeableConcept)
    self.expression = try Expression(from: codingKeyContainer, forKeyIfPresent: .expression)
    self.dataRequirement = try DataRequirement(from: codingKeyContainer, forKeyIfPresent: .dataRequirement)
    self.triggerDefinition = try TriggerDefinition(from: codingKeyContainer, forKeyIfPresent: .triggerDefinition)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try reference?.encode(on: &codingKeyContainer, forKey: .reference)
    try canonical?.encode(on: &codingKeyContainer, forKey: .canonical, auxKey: ._canonical)
    try codeableConcept?.encode(on: &codingKeyContainer, forKey: .codeableConcept)
    try expression?.encode(on: &codingKeyContainer, forKey: .expression)
    try dataRequirement?.encode(on: &codingKeyContainer, forKey: .dataRequirement)
    try triggerDefinition?.encode(on: &codingKeyContainer, forKey: .triggerDefinition)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? EvidenceVariableCharacteristicDefinitionX else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return reference == _other.reference
    && canonical == _other.canonical
    && codeableConcept == _other.codeableConcept
    && expression == _other.expression
    && dataRequirement == _other.dataRequirement
    && triggerDefinition == _other.triggerDefinition
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(reference)
    hasher.combine(canonical)
    hasher.combine(codeableConcept)
    hasher.combine(expression)
    hasher.combine(dataRequirement)
    hasher.combine(triggerDefinition)
  }
}
