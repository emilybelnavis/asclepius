//
//  ClaimResponseProcessNote.swift
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
 Note concerning adjudication; A note that describes or explains adjudication results in a human-readable form
 */
open class ClaimResponseProcessNote: BackboneElement {
  /// Note instance identifier
  public var number: FHIRKitPrimitive<FHIRKitPositiveInteger>?
  
  /// The business purpose of the note text
  public var type: FHIRKitPrimitive<NoteType>?
  
  /// Note explanatory text
  public var text: FHIRKitPrimitive<FHIRKitString>
  
  /// Language of the text
  public var language: CodableConcept?
  
  public init(text: FHIRKitPrimitive<FHIRKitString>) {
    self.text = text
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    number: FHIRKitPrimitive<FHIRKitPositiveInteger>? = nil,
    type: FHIRKitPrimitive<NoteType>? = nil,
    text: FHIRKitPrimitive<FHIRKitString>,
    language: CodableConcept? = nil
  ) {
    self.init(text: text)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.number = number
    self.type = type
    self.language = language
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case number; case _number
    case type; case _type
    case text; case _text
    case language
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.number = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: codingKeyContainer, forKey: .number, auxKey: ._number)
    self.type = try FHIRKitPrimitive<NoteType>(from: codingKeyContainer, forKeyIfPresent: .type, auxKey: ._type)
    self.text = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .text, auxKey: ._text)
    self.language = try CodableConcept(from: codingKeyContainer, forKey: .language)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try number?.encode(on: &codingKeyContainer, forKey: .number, auxKey: ._number)
    try type?.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try text.encode(on: &codingKeyContainer, forKey: .text, auxKey: ._text)
    try language?.encode(on: &codingKeyContainer, forKey: .language)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseProcessNote else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return number == _other.number
    && type == _other.type
    && text == _other.text
    && language == _other.language
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(number)
    hasher.combine(type)
    hasher.combine(text)
    hasher.combine(language)
  }
}
