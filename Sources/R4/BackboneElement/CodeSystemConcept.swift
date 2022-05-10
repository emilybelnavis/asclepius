//
//  CodeSystemConcept.swift
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
 Concepts that are in the code system. The concept definitions are inherently hierarchical, but the definitions
 must be consulted to determine what the meanings of the hierarchical relationships are
 */
open class CodeSystemConcept: BackboneElement {
  /// Code that identifies concept
  public var code: AsclepiusPrimitive<AsclepiusString>
  
  /// Text to display to the user
  public var display: AsclepiusPrimitive<AsclepiusString>?
  
  /// Formal definition
  public var definition: AsclepiusPrimitive<AsclepiusString>?
  
  /// Additional representations for the concept
  public var designation: [CodeSystemConceptDesignation]?
  
  /// Property value for the concept
  public var property: [CodeSystemConceptProperty]?
  
  /// Child Concepts (`is-a`, `contains`, `categorizes`)
  public var concept: [CodeSystemConcept]?
  
  public init(code: AsclepiusPrimitive<AsclepiusString>) {
    self.code = code
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    code: AsclepiusPrimitive<AsclepiusString>,
    display: AsclepiusPrimitive<AsclepiusString>? = nil,
    definition: AsclepiusPrimitive<AsclepiusString>? = nil,
    designation: [CodeSystemConceptDesignation]? = nil,
    property: [CodeSystemConceptProperty]? = nil,
    concept: [CodeSystemConcept]? = nil
  ) {
    self.init(code: code)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.display = display
    self.definition = definition
    self.designation = designation
    self.property = property
    self.concept = concept
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code; case _code
    case display; case _display
    case definition; case _definition
    case designation
    case property
    case concept
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.code = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .code, auxKey: ._code)
    self.display = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .display, auxKey: ._display)
    self.definition = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .definition, auxKey: ._definition)
    self.designation = try [CodeSystemConceptDesignation](from: codingKeyContainer, forKeyIfPresent: .designation)
    self.property = try [CodeSystemConceptProperty](from: codingKeyContainer, forKeyIfPresent: .property)
    self.concept = try [CodeSystemConcept](from: codingKeyContainer, forKeyIfPresent: .concept)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try code.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    try display?.encode(on: &codingKeyContainer, forKey: .display, auxKey: ._display)
    try definition?.encode(on: &codingKeyContainer, forKey: .definition, auxKey: ._definition)
    try designation?.encode(on: &codingKeyContainer, forKey: .designation)
    try property?.encode(on: &codingKeyContainer, forKey: .property)
    try concept?.encode(on: &codingKeyContainer, forKey: .concept)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CodeSystemConcept else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return code == _other.code
    && display == _other.display
    && definition == _other.definition
    && designation == _other.designation
    && property == _other.property
    && concept == _other.concept
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(display)
    hasher.combine(definition)
    hasher.combine(designation)
    hasher.combine(property)
    hasher.combine(concept)
  }
}
