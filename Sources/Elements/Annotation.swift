//
//  Annotation.swift
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
 Text note with attribution
 
 A text note which also contains informatoin about who made the statement and when
 */
open class Annotation: Element {
  public enum AuthorX: Hashable {
    case reference(Reference)
    case string(FHIRKitPrimitive<FHIRKitString>)
  }
  
  /// Individual responsible for the annotation
  public var authorX: AuthorX?
  
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
    authorX: AuthorX? = nil,
    time: FHIRKitPrimitive<FHIRKitDateTime>? = nil,
    text: FHIRKitPrimitive<FHIRKitString>
  ) {
    self.init(text: text)
    self.fhirExtension = fhirExtension
    self.id = id
    self.authorX = authorX
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
    
    var tempAuthorX: AuthorX?
    if let authorReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .authorReference) {
      if tempAuthorX != nil {
        throw DecodingError.dataCorruptedError(forKey: .authorReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"Author\"")
      }
      tempAuthorX = .reference(authorReference)
    }
    
    if let authorString = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .authorString, auxKey: ._authorString) {
      if tempAuthorX != nil {
        throw DecodingError.dataCorruptedError(forKey: .authorString, in: codingKeyContainer, debugDescription: "More than one value provided for \"Author\"")
      }
      tempAuthorX = .string(authorString)
    }
    
    self.authorX = tempAuthorX
    self.time = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .time, auxKey: ._time)
    self.text = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .text, auxKey: ._text)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumAuthorX = authorX {
      switch enumAuthorX {
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
    
    return authorX == _other.authorX
    && time == _other.time
    && text == _other.text
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(authorX)
    hasher.combine(time)
    hasher.combine(text)
  }
}
