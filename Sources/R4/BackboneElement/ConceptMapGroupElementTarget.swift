//
//  ConceptMapGroupElementTarget.swift
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

/// A concept from the target value set that this concept maps to
open class ConceptMapGroupElementTarget: BackboneElement {
  /// Code that identifies the target element
  public var code: AsclepiusPrimitive<AsclepiusString>?
  
  /// Display for the code
  public var display: AsclepiusPrimitive<AsclepiusString>?
  
  /// The equivalence between the source and target concepts (counting for the dependencies and products).
  /// The equivalence is read from target to source (e.g. the target is "wider" than the "source".)
  public var equivalence: AsclepiusPrimitive<ConceptMapEquivalence>
  
  /// Description of status/issues in mapping
  public var comment: AsclepiusPrimitive<AsclepiusString>?
  
  /// Other elements required for this mapping (from context)
  public var dependsOn: [ConceptMapGroupElementTargetDependsOn]?
  
  /// Other concepts that this mapping produces
  public var product: [ConceptMapGroupElementTargetDependsOn]?
  
  public init(equivalence: AsclepiusPrimitive<ConceptMapEquivalence>) {
    self.equivalence = equivalence
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    code: AsclepiusPrimitive<AsclepiusString>? = nil,
    display: AsclepiusPrimitive<AsclepiusString>? = nil,
    equivalence: AsclepiusPrimitive<ConceptMapEquivalence>,
    comment: AsclepiusPrimitive<AsclepiusString>? = nil,
    dependsOn: [ConceptMapGroupElementTargetDependsOn]? = nil,
    product: [ConceptMapGroupElementTargetDependsOn]? = nil
  ) {
    self.init(equivalence: equivalence)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.code = code
    self.display = display
    self.comment = comment
    self.dependsOn = dependsOn
    self.product = product
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code; case _code
    case display; case _display
    case equivalence; case _equjvalence
    case comment; case _comment
    case dependsOn
    case product
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.code = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .code, auxKey: ._code)
    self.display = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .display, auxKey: ._display)
    self.equivalence = try AsclepiusPrimitive<ConceptMapEquivalence>(from: codingKeyContainer, forKey: .equivalence, auxKey: ._equjvalence)
    self.comment = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .comment, auxKey: ._comment)
    self.dependsOn = try [ConceptMapGroupElementTargetDependsOn](from: codingKeyContainer, forKeyIfPresent: .dependsOn)
    self.product = try [ConceptMapGroupElementTargetDependsOn](from: codingKeyContainer, forKeyIfPresent: .product)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try code?.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    try display?.encode(on: &codingKeyContainer, forKey: .display, auxKey: ._display)
    try equivalence.encode(on: &codingKeyContainer, forKey: .equivalence, auxKey: ._equjvalence)
    try comment?.encode(on: &codingKeyContainer, forKey: .comment, auxKey: ._comment)
    try dependsOn?.encode(on: &codingKeyContainer, forKey: .dependsOn)
    try product?.encode(on: &codingKeyContainer, forKey: .product)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ConceptMapGroupElementTarget else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return code == _other.code
    && display == _other.display
    && equivalence == _other.equivalence
    && comment == _other.comment
    && dependsOn == _other.dependsOn
    && product == _other.product
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(display)
    hasher.combine(equivalence)
    hasher.combine(comment)
    hasher.combine(dependsOn)
    hasher.combine(product)
  }
}
