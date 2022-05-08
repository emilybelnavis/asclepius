//
//  RelatedArtifact.swift
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

/// Related artifacts such as additional documentation, justification, or bibliograpic references
open class RelatedArtifact: Element {
  /// the type of relationship to the related artifact
  public var type: AlexandriaHRMPrimitive<RelatedArtifactType>
  
  /// short label
  public var label: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// a brief description of the related artifact
  public var display: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// bibliographic citation for the artifact
  public var citation: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// where the artifact can be accessed
  public var url: AlexandriaHRMPrimitive<AlexandriaHRMURI>?
  
  /// what document is being referenced
  public var document: Attachment?
  
  /// what resource is being referenced
  public var resource: AlexandriaHRMPrimitive<Canonical>?
  
  public init(type: AlexandriaHRMPrimitive<RelatedArtifactType>) {
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    type: AlexandriaHRMPrimitive<RelatedArtifactType>,
    label: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    display: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    citation: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    url: AlexandriaHRMPrimitive<AlexandriaHRMURI>? = nil,
    document: Attachment? = nil,
    resource: AlexandriaHRMPrimitive<Canonical>? = nil
  ) {
    self.init(type: type)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.label = label
    self.display = display
    self.citation = citation
    self.url = url
    self.document = document
    self.resource = resource
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type; case _type
    case label; case _label
    case display; case _display
    case citation; case _citation
    case url; case _url
    case document
    case resource; case _resource
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try AlexandriaHRMPrimitive<RelatedArtifactType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.label = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .label, auxKey: ._label)
    self.display = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .display, auxKey: ._display)
    self.citation = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .citation, auxKey: ._citation)
    self.url = try AlexandriaHRMPrimitive<AlexandriaHRMURI>(from: codingKeyContainer, forKeyIfPresent: .url, auxKey: ._url)
    self.document = try Attachment(from: codingKeyContainer, forKeyIfPresent: .document)
    self.resource = try AlexandriaHRMPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .resource, auxKey: ._resource)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try label?.encode(on: &codingKeyContainer, forKey: .label, auxKey: .label)
    try display?.encode(on: &codingKeyContainer, forKey: .display, auxKey: ._display)
    try citation?.encode(on: &codingKeyContainer, forKey: .citation, auxKey: ._citation)
    try url?.encode(on: &codingKeyContainer, forKey: .url, auxKey: ._url)
    try document?.encode(on: &codingKeyContainer, forKey: .document)
    try resource?.encode(on: &codingKeyContainer, forKey: .resource, auxKey: ._resource)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? RelatedArtifact else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && label == _other.label
    && display == _other.display
    && citation == _other.citation
    && url == _other.url
    && document == _other.document
    && resource == _other.resource
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(label)
    hasher.combine(display)
    hasher.combine(citation)
    hasher.combine(url)
    hasher.combine(document)
    hasher.combine(resource)
  }
}
