//
//  ElementDefinitionMapping.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/**
 Map element to another set of definitions; Identifies a concept from external specification that roughly
 corresponds to this element
 */
open class ElementDefinitionMapping: Element {
  /// Reference to mapping declaration
  public var identity: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
  /// Computable language of mapping
  public var language: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Details of the mapping
  public var map: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
  /// Comments about the mapping or its use
  public var comment: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  public init(identity: AlexandriaHRMPrimitive<AlexandriaHRMString>, map: AlexandriaHRMPrimitive<AlexandriaHRMString>) {
    self.identity = identity
    self.map = map
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    identity: AlexandriaHRMPrimitive<AlexandriaHRMString>,
    language: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    map: AlexandriaHRMPrimitive<AlexandriaHRMString>,
    comment: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil
  ) {
    self.init(identity: identity, map: map)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.language = language
    self.comment = comment
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case identity; case _identity
    case language; case _language
    case map; case _map
    case comment; case _comment
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.identity = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKey: .identity, auxKey: ._identity)
    self.language = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .language, auxKey: ._language)
    self.map = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKey: .map, auxKey: ._map)
    self.comment = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .comment, auxKey: ._comment)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try identity.encode(on: &codingKeyContainer, forKey: .identity, auxKey: ._identity)
    try language?.encode(on: &codingKeyContainer, forKey: .language, auxKey: ._language)
    try map.encode(on: &codingKeyContainer, forKey: .map, auxKey: ._map)
    try comment?.encode(on: &codingKeyContainer, forKey: .comment, auxKey: ._comment)
    
    try super.encode(to: encoder)
  }
}
