//
//  CodeSystemConceptDesignation.swift
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
 Additional representations for the concept - other languages, aliases, specialized purposes, used for particular
 purposes, etc
 */
open class CodeSystemConceptDesignation: BackboneElement {
  /// Human language of the designation
  public var language: AsclepiusPrimitive<AsclepiusString>?
  
  /// Details how this designation would be used
  public var use: Coding?
  
  /// The text value for this designation
  public var value: AsclepiusPrimitive<AsclepiusString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    language: AsclepiusPrimitive<AsclepiusString>? = nil,
    use: Coding? = nil,
    value: AsclepiusPrimitive<AsclepiusString>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.language = language
    self.use = use
    self.value = value
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case language; case _language
    case use
    case value; case _value
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.language = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .language, auxKey: ._language)
    self.use = try Coding(from: codingKeyContainer, forKeyIfPresent: .use)
    self.value = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .value, auxKey: ._value)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try language?.encode(on: &codingKeyContainer, forKey: .language, auxKey: ._language)
    try use?.encode(on: &codingKeyContainer, forKey: .use)
    try value?.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CodeSystemConceptDesignation else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return language == _other.language
    && use === _other.use
    && value == _other.value
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(language)
    hasher.combine(use)
    hasher.combine(value)
  }
}
