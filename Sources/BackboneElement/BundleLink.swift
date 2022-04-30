//
//  BundleLink.swift
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

/// A series of links that provide context to this bundle
open class BundleLink: BackboneElement {
  /// See http://www.iana.org/assignments/link-relations.xhtml#link-relations-1
  public var relation: FHIRKitPrimitive<FHIRKitString>
  
  /// Reference details for the link
  public var url: FHIRKitPrimitive<FHIRKitURI>

  public init(relation: FHIRKitPrimitive<FHIRKitString>, url: FHIRKitPrimitive<FHIRKitURI>) {
    self.relation = relation
    self.url = url
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    relation: FHIRKitPrimitive<FHIRKitString>,
    url: FHIRKitPrimitive<FHIRKitURI>
  ) {
    self.init(relation: relation, url: url)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case relation; case _relation
    case url; case _url
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.relation = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .relation, auxKey: ._relation)
    self.url = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKey: .url, auxKey: ._url)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try relation.encode(on: &codingKeyContainer, forKey: .relation, auxKey: ._relation)
    try url.encode(on: &codingKeyContainer, forKey: .url, auxKey: ._url)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(relation)
    hasher.combine(url)
  }
}
