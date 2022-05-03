//
//  ElementDefinitionMapping.swift
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

/**
 Map element to another set of definitions; Identifies a concept from external specification that roughly
 corresponds to this element
 */
open class ElementDefinitionMapping: Element {
  /// Reference to mapping declaration
  public var identity: FHIRKitPrimitive<FHIRKitString>
  
  /// Computable language of mapping
  public var language: FHIRKitPrimitive<FHIRKitString>?
  
  /// Details of the mapping
  public var map: FHIRKitPrimitive<FHIRKitString>
  
  /// Comments about the mapping or its use
  public var comment: FHIRKitPrimitive<FHIRKitString>?
  
  public init(identity: FHIRKitPrimitive<FHIRKitString>, map: FHIRKitPrimitive<FHIRKitString>) {
    self.identity = identity
    self.map = map
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    identity: FHIRKitPrimitive<FHIRKitString>,
    language: FHIRKitPrimitive<FHIRKitString>? = nil,
    map: FHIRKitPrimitive<FHIRKitString>,
    comment: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init(identity: identity, map: map)
    self.fhirExtension = fhirExtension
    self.id = id
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
    
    self.identity = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .identity, auxKey: ._identity)
    self.language = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .language, auxKey: ._language)
    self.map = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .map, auxKey: ._map)
    self.comment = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .comment, auxKey: ._comment)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try identity.encode(on: &codingKeyContainer, forKey: .identity, auxKey: ._identity)
    try language?.encode(on: &codingKeyContainer, forKey: .language, auxKey: ._language)
    try map.encode(on: &codingKeyContainer, forKey: .map, auxKey: ._map)
    try comment?.encode(on: &codingKeyContainer, forKey: .comment, auxKey: ._comment)
    
    try super.encode(to: encoder)
  }
}
