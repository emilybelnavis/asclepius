//
//  Annotation.swift
//  FHIRKit
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

import FHIRKitCore

/**
 Text note with attribution
 
 A text note which also contains informatoin about who made the statement and when
 */
open class Annotation: Element {
  public enum AuthorX: Hashable {
    case reference(Reference)
    case string(FHIRKitPrimitive<FHIRKitString>)
  }
  
  /// Individual responsible for the annotation
  public var author: AuthorX?
  
  /// When the annotation was made
  public var time: FHIRKitPrimitive<FHIRKitDateTime>?
  
  /// The annotation - text content (as markdown
  public var text: FHIRKitPrimitive<FHIRKitString>?
  
  public init(text: FHIRKitPrimitive<FHIRKitString>) {
    self.text = text
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    author: AuthorX? = nil,
    time: FHIRKitPrimitive<FHIRKitDateTime>? = nil,
    text: FHIRKitPrimitive<FHIRKitString>
  ) {
    self.init(text: text)
    self.fhirExtension = fhirExtension
    self.id = id
    self.author = author
    self.time = time
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case authorReference
    case authorString; case _authorString
    case time; case _time
    case text; case _text
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempAuthor: AuthorX?
    if let authorReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .authorReference) {
      if tempAuthor != nil {
        throw DecodingError.dataCorruptedError(forKey: .authorReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"Author\"")
      }
      tempAuthor = .reference(authorReference)
    }
    
    if let authorString = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .authorString, auxKey: ._authorString) {
      if tempAuthor != nil {
        throw DecodingError.dataCorruptedError(forKey: .authorString, in: codingKeyContainer, debugDescription: "More than one value provided for \"Author\"")
      }
      tempAuthor = .string(authorString)
    }
    
    self.author = tempAuthor
    self.time = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .time, auxKey: ._time)
    self.text = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .text, auxKey: ._text)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumAuthor = author {
      switch enumAuthor {
      case.reference(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .authorReference)
      case .string(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .authorString, auxKey: ._authorString)
      }
    }
    
    try time?.encode(on: &codingKeyContainer, forKey: .time, auxKey: ._time)
    try text?.encode(on: &codingKeyContainer, forKey: .text, auxKey: ._text)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Annotation else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return author == _other.author
    && time == _other.time
    && text == _other.text
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(author)
    hasher.combine(time)
    hasher.combine(text)
  }
}
