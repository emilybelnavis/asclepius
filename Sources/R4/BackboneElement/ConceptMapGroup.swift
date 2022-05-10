//
//  ConceptMapGroup.swift
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
 A group of mappings that all have the same source and target systems
 */
open class ConceptMapGroup: BackboneElement {
  /// Source system where concept to be mapped are defined
  public var source: AsclepiusPrimitive<AsclepiusURI>?
  
  /// Specific version of the code system
  public var sourceVersion: AsclepiusPrimitive<AsclepiusString>?
  
  /// Target system that the concepts are mapped to
  public var target: AsclepiusPrimitive<AsclepiusURI>?
  
  /// Specific version of the code system
  public var targetVersion: AsclepiusPrimitive<AsclepiusString>?
  
  /// Mappings for a concept from the source set
  public var element: [ConceptMapGroupElement]
  
  /// What to do when there is no mapping for the source concept
  public var unmapped: ConceptMapGroupUnmapped?
  
  public init (element: [ConceptMapGroupElement]) {
    self.element = element
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    source: AsclepiusPrimitive<AsclepiusURI>? = nil,
    sourceVersion: AsclepiusPrimitive<AsclepiusString>? = nil,
    target: AsclepiusPrimitive<AsclepiusURI>? = nil,
    targetVersion: AsclepiusPrimitive<AsclepiusString>? = nil,
    element: [ConceptMapGroupElement],
    unmapped: ConceptMapGroupUnmapped? = nil
  ) {
    self.init(element: element)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.source = source
    self.sourceVersion = sourceVersion
    self.target = target
    self.targetVersion = targetVersion
    self.unmapped = unmapped
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case source; case _source
    case sourceVersion; case _sourceVersion
    case target; case _target
    case targetVersion; case _targetVersion
    case element
    case unmapped
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.source = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .source, auxKey: ._source)
    self.sourceVersion = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .sourceVersion, auxKey: ._sourceVersion)
    self.target = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .target, auxKey: ._target)
    self.targetVersion = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .targetVersion, auxKey: ._targetVersion)
    self.element = try [ConceptMapGroupElement](from: codingKeyContainer, forKey: .element)
    self.unmapped = try ConceptMapGroupUnmapped(from: codingKeyContainer, forKeyIfPresent: .unmapped)
  
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try source?.encode(on: &codingKeyContainer, forKey: .source, auxKey: ._source)
    try sourceVersion?.encode(on: &codingKeyContainer, forKey: .sourceVersion, auxKey: ._sourceVersion)
    try target?.encode(on: &codingKeyContainer, forKey: .target, auxKey: ._target)
    try targetVersion?.encode(on: &codingKeyContainer, forKey: .targetVersion, auxKey: ._targetVersion)
    try element.encode(on: &codingKeyContainer, forKey: .element)
    try unmapped?.encode(on: &codingKeyContainer, forKey: .unmapped)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ConceptMapGroup else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return source == _other.source
    && sourceVersion == _other.sourceVersion
    && target == _other.target
    && targetVersion == _other.targetVersion
    && element == _other.element
    && unmapped == _other.unmapped
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(source)
    hasher.combine(sourceVersion)
    hasher.combine(target)
    hasher.combine(targetVersion)
    hasher.combine(element)
    hasher.combine(unmapped)
  }
}
