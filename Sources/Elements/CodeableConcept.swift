//
//  CodableConcept.swift
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
 Concept - reference to a terminology or just text
 
 A concept that may be defined by a formal reference to a terminology, ontology, or may be provided by text
 */
open class CodableConcept: Element {
  /// Code defined by a terminology system
  public var coding: [Coding]?
  
  /// Plain text representation of the concept
  public var text: FHIRKitPrimitive<FHIRKitString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    coding: [Coding]? = nil,
    text: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init()
    self.`extension` = `extension`
    self.id = id
    self.coding = coding
    self.text = text
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case coding
    case text; case _text
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.coding = try [Coding](from: _container, forKeyIfPresent: .coding)
    self.text = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .text, auxiliaryKey: ._text)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try coding?.encode(on: &_container, forKey: .coding)
    try text?.encode(on: &_container, forKey: .text, auxiliaryKey: ._text)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CodableConcept else {
      return false
    }
    
    guard _other.isEqual(to: _other) else {
      return false
    }
    
    return coding == _other.coding
    && text == _other.text
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    
    hasher.combine(coding)
    hasher.combine(text)
  }
}
