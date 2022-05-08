//
//  ElementDefinitionSlicing.swift
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
 This is element is sliced, slices to follow; Indicates that the element is sliced into a set of alternative definitions
 (i.e. in a `StructureDefinition`, there are multiple different constraints on a single element in the base
 resource). Slicing can be used in any resource that has cardinality `..*` on the base resource, or any resource
 with a choice of types. The set of slices is any elements that come after this in the element sequence that have
 the same path, until a shorter path occurs (the shorter path terminates the set).
 */
open class ElementDefinitionSlicing: Element {
  /// Element values that are used to distinguish the slices
  public var discriminator: [ElementDefinitionSlicingDiscriminator]?
  
  /// Text description of how slicing works (or not)
  public var fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// If elements must be in the same order as slices
  public var ordered: AlexandriaHRMPrimitive<AlexandriaHRMBool>?
  
  /// Whether additional slices are allowed or not. When the slices are ordered, profile authors can also
  /// specifiy that additional slices are only allowed at the end.
  public var rules: AlexandriaHRMPrimitive<SlicingRules>
  
  public init(rules: AlexandriaHRMPrimitive<SlicingRules>) {
    self.rules = rules
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    discriminator: [ElementDefinitionSlicingDiscriminator]? = nil,
    fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    ordered: AlexandriaHRMPrimitive<AlexandriaHRMBool>? = nil,
    rules: AlexandriaHRMPrimitive<SlicingRules>
  ) {
    self.init(rules: rules)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.discriminator = discriminator
    self.fhirDescription = fhirDescription
    self.ordered = ordered
    self.rules = rules
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case discriminator
    case fhirDescription; case _fhirDescription
    case ordered; case _ordered
    case rules; case _rules
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.discriminator = try [ElementDefinitionSlicingDiscriminator](from: codingKeyContainer, forKeyIfPresent: .discriminator)
    self.fhirDescription = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.ordered = try AlexandriaHRMPrimitive<AlexandriaHRMBool>(from: codingKeyContainer, forKeyIfPresent: .ordered, auxKey: ._ordered)
    self.rules = try AlexandriaHRMPrimitive<SlicingRules>(from: codingKeyContainer, forKey: .rules, auxKey: ._rules)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try discriminator?.encode(on: &codingKeyContainer, forKey: .discriminator)
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try ordered?.encode(on: &codingKeyContainer, forKey: .ordered, auxKey: ._ordered)
    try rules.encode(on: &codingKeyContainer, forKey: .rules, auxKey: ._rules)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ElementDefinitionSlicing else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return discriminator == _other.discriminator
    && fhirDescription == _other.fhirDescription
    && ordered == _other.ordered
    && rules == _other.rules
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(discriminator)
    hasher.combine(fhirDescription)
    hasher.combine(ordered)
    hasher.combine(rules)
  }
}
