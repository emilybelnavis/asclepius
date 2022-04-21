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
  public enum Author: Hashable {
    case reference(Reference)
    case string(FHIRKitPrimitive<FHIRKitString>)
  }
  
  /// Individual responsible for the annotation
  public var author: Author?
  
  /// When the annotation was made
  public var time: FHIRKitPrimitive<FHIRKitDateTime>?
  
  /// The annotation - text content (as markdown
  public var text: FHIRKitPrimitive<FHIRKitString>?
  
  public init(text: FHIRKitPrimitive<FHIRKitString>) {
    self.text = text
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    author: Author? = nil,
    time: FHIRKitPrimitive<FHIRKitDateTime>? = nil,
    text: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init()
    self.`extension` = `extension`
    self.id = id
    self.author = author
    self.time = time
    self.text = text
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case authorReference
    case authorString; case _authorString
    case time; case _time
    case text; case _text
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    var _t_author: Author? = nil
    if let authorReference = try Reference(from: _container, forKeyIfPresent: .authorReference) {
      if _t_author != nil {
        throw DecodingError.dataCorruptedError(forKey: .authorReference, in: _container, debugDescription: "More than one value provided for \"Author\"")
      }
      _t_author = .reference(authorReference)
    }
    
    if let authorString = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .authorString, auxiliaryKey: ._authorString) {
      if _t_author != nil {
        throw DecodingError.dataCorruptedError(forKey: .authorString, in: _container, debugDescription: "More than one value provided for \"Author\"")
      }
      _t_author = .string(authorString)
    }
    
    self.author = _t_author
    self.time = try FHIRKitPrimitive<FHIRKitDateTime>(from: _container, forKeyIfPresent: .time, auxiliaryKey: ._time)
    self.text = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKey: .text, auxiliaryKey: ._text)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    if let _enum = author {
      switch _enum {
        case.reference(let _value):
          try _value.encode(on: &_container, forKey: .authorReference)
        case .string(let _value):
          try _value.encode(on: &_container, forKey: .authorString, auxiliaryKey: ._authorString)
      }
    }
    
    try time?.encode(on: &_container, forKey: .time, auxiliaryKey: ._time)
    try text?.encode(on: &_container, forKey: .text, auxiliaryKey: ._text)
    
    try super.encode(to: encoder)
  }
  
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
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(author)
    hasher.combine(time)
    hasher.combine(text)
  }
}
