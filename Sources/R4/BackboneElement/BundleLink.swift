//
//  BundleLink.swift
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

/// A series of links that provide context to this bundle
open class BundleLink: BackboneElement {
  /// See http://www.iana.org/assignments/link-relations.xhtml#link-relations-1
  public var relation: AsclepiusPrimitive<AsclepiusString>
  
  /// Reference details for the link
  public var url: AsclepiusPrimitive<AsclepiusURI>

  public init(relation: AsclepiusPrimitive<AsclepiusString>, url: AsclepiusPrimitive<AsclepiusURI>) {
    self.relation = relation
    self.url = url
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    relation: AsclepiusPrimitive<AsclepiusString>,
    url: AsclepiusPrimitive<AsclepiusURI>
  ) {
    self.init(relation: relation, url: url)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case relation; case _relation
    case url; case _url
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.relation = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .relation, auxKey: ._relation)
    self.url = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKey: .url, auxKey: ._url)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try relation.encode(on: &codingKeyContainer, forKey: .relation, auxKey: ._relation)
    try url.encode(on: &codingKeyContainer, forKey: .url, auxKey: ._url)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? BundleLink else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return relation == _other.relation
    && url == _other.url
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(relation)
    hasher.combine(url)
  }
}
