//
//  RelatedArtifact.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

/// Related artifacts such as additional documentation, justification, or bibliograpic references
open class RelatedArtifact: Element {
  /// the type of relationship to the related artifact
  public var type: FHIRKitPrimitive<RelatedArtifactType>
  
  /// short label
  public var label: FHIRKitPrimitive<FHIRKitString>?
  
  /// a brief description of the related artifact
  public var display: FHIRKitPrimitive<FHIRKitString>?
  
  /// bibliographic citation for the artifact
  public var citation: FHIRKitPrimitive<FHIRKitString>?
  
  /// where the artifact can be accessed
  public var url: FHIRKitPrimitive<FHIRKitURI>?
  
  /// what document is being referenced
  public var document: Attachment?
  
  /// what resource is being referenced
  public var resource: FHIRKitPrimitive<Canonical>?
  
  public init(type: FHIRKitPrimitive<RelatedArtifactType>) {
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<RelatedArtifactType>,
    label: FHIRKitPrimitive<FHIRKitString>? = nil,
    display: FHIRKitPrimitive<FHIRKitString>? = nil,
    citation: FHIRKitPrimitive<FHIRKitString>? = nil,
    url: FHIRKitPrimitive<FHIRKitURI>? = nil,
    document: Attachment? = nil,
    resource: FHIRKitPrimitive<Canonical>? = nil
  ) {
    self.init(type: type)
    self.fhirExtension = fhirExtension
    self.id = id
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
    
    self.type = try FHIRKitPrimitive<RelatedArtifactType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.label = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .label, auxKey: ._label)
    self.display = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .display, auxKey: ._display)
    self.citation = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .citation, auxKey: ._citation)
    self.url = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .url, auxKey: ._url)
    self.document = try Attachment(from: codingKeyContainer, forKeyIfPresent: .document)
    self.resource = try FHIRKitPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .resource, auxKey: ._resource)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
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
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
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
