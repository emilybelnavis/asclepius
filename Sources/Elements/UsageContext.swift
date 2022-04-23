//
//  UsageContext.swift
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
 Specifies clinical/business/etc. metadat athat can be used to retrieve, index, and/or categorize an artifact.
 This metadata can either be specific to the applicable population (e.g. age category, DRG) or the specific
 context of care (e.g. venue, care setting, provider of care)
 */
open class UsageContext: Element {
  public enum _Value: Hashable {
    case codableConcept(CodableConcept)
    case quantity(Quantity)
    case range(Range)
    case reference(Reference)
  }
  
  /// the type of context being specified
  public var code: Coding

  /// value that defines the context
  public var value: _Value
  
  public init(code: Coding, value: _Value) {
    self.code = code
    self.value = value
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    code: Coding,
    value: _Value
  ) {
    self.init(code: code, value: value)
    self.`extension` = `extension`
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code
    case valueCodableConcept
    case valueQuantity
    case valueRange
    case valueReference
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    var _value: _Value?
    if let valueCodableConcept = try CodableConcept(from: _container, forKeyIfPresent: .valueCodableConcept) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCodableConcept, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .codableConcept(valueCodableConcept)
    }
    
    if let valueQuantity = try Quantity(from: _container, forKeyIfPresent: .valueQuantity) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueQuantity, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .quantity(valueQuantity)
    }
    
    if let valueRange = try Range(from: _container, forKeyIfPresent: .valueRange) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRange, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .range(valueRange)
    }
    
    if let valueReference = try Reference(from: _container, forKeyIfPresent: .valueReference) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueReference, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .reference(valueReference)
    }
    
    self.code = try Coding(from: _container, forKey: .code)
    self.value = _value!
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
  
    try code.encode(on: &_container, forKey: .code)
    
    switch value {
    case .codableConcept(let _value):
      try _value.encode(on: &_container, forKey: .valueCodableConcept)
    case .quantity(let _value):
      try _value.encode(on: &_container, forKey: .valueQuantity)
    case .range(let _value):
      try _value.encode(on: &_container, forKey: .valueRange)
    case .reference(let _value):
      try _value.encode(on: &_container, forKey: .valueReference)
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? UsageContext else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    return code == _other.code
    && value == _other.value
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(value)
  }
}
