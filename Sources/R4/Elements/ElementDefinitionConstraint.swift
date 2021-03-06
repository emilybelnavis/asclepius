//
//  ElementDefinitionConstraint.swift
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
 Condition that must evaluate to `true` - Formal constraints such as co-occurence and other constraints
 that can be computationally evaluated within the context of the instance.
 */
open class ElementDefinitionConstraint: Element {
  /// Target of `condition` reference
  public var key: AsclepiusPrimitive<AsclepiusString>
  
  /// Why this constraint is necessary or appropriate
  public var requirements: AsclepiusPrimitive<AsclepiusString>?
  
  /// Identifies the impact constraint violation has on the conformance of the instance.
  public var severity: AsclepiusPrimitive<ConstraintSeverity>
  
  /// Human readable description of the constraint
  public var human: AsclepiusPrimitive<AsclepiusString>
  
  /// FHIRPath expression of the constraint
  public var expression: AsclepiusPrimitive<AsclepiusString>?
  
  /// XPath expression of the constraint
  public var xpath: AsclepiusPrimitive<AsclepiusString>?
  
  /// Reference to the original source of the constraint
  public var source: AsclepiusPrimitive<Canonical>?
  
  public init(key: AsclepiusPrimitive<AsclepiusString>, severity: AsclepiusPrimitive<ConstraintSeverity>, human: AsclepiusPrimitive<AsclepiusString>) {
    self.key = key
    self.severity = severity
    self.human = human
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    key: AsclepiusPrimitive<AsclepiusString>,
    requirements: AsclepiusPrimitive<AsclepiusString>? = nil,
    severity: AsclepiusPrimitive<ConstraintSeverity>,
    human: AsclepiusPrimitive<AsclepiusString>,
    expression: AsclepiusPrimitive<AsclepiusString>? = nil,
    xpath: AsclepiusPrimitive<AsclepiusString>? = nil,
    source: AsclepiusPrimitive<Canonical>? = nil
  ) {
    self.init(key: key, severity: severity, human: human)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.requirements = requirements
    self.expression = expression
    self.xpath = xpath
    self.source =  source
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case key; case _key
    case requirements; case _requirements
    case severity; case _severity
    case human; case _human
    case expression; case _expression
    case xpath; case _xpath
    case source; case _source
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.key = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .key, auxKey: ._key)
    self.requirements = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .requirements, auxKey: ._requirements)
    self.severity = try AsclepiusPrimitive<ConstraintSeverity>(from: codingKeyContainer, forKey: .severity, auxKey: ._severity)
    self.human = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .human, auxKey: ._human)
    self.expression = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .expression, auxKey: ._expression)
    self.xpath = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .xpath, auxKey: ._xpath)
    self.source = try AsclepiusPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .source, auxKey: ._source)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try key.encode(on: &codingKeyContainer, forKey: .key, auxKey: ._key)
    try requirements?.encode(on: &codingKeyContainer, forKey: .requirements, auxKey: ._requirements)
    try severity.encode(on: &codingKeyContainer, forKey: .severity, auxKey: ._severity)
    try human.encode(on: &codingKeyContainer, forKey: .human, auxKey: ._human)
    try expression?.encode(on: &codingKeyContainer, forKey: .expression, auxKey: ._expression)
    try xpath?.encode(on: &codingKeyContainer, forKey: .xpath, auxKey: ._xpath)
    try source?.encode(on: &codingKeyContainer, forKey: .source, auxKey: ._source)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ElementDefinitionConstraint else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return key == _other.key
    && requirements == _other.requirements
    && severity == _other.severity
    && human == _other.human
    && expression == _other.expression
    && xpath == _other.xpath
    && source == _other.source
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(key)
    hasher.combine(requirements)
    hasher.combine(severity)
    hasher.combine(human)
    hasher.combine(expression)
    hasher.combine(xpath)
    hasher.combine(source)
  }
}
