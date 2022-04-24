//
//  AuditEventEntityDetail.swift
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

/// Tagged value pairs for conveying additional information about the entity
open class AuditEventEntityDetail: BackboneElement {
  public enum _Value: Hashable {
    case base64binary(FHIRKitPrimitive<FHIRKitBase64Binary>)
    case string(FHIRKitPrimitive<FHIRKitString>)
  }
  
  /// name of the property
  public var type: FHIRKitPrimitive<FHIRKitString>
  
  /// property value
  public var value: _Value
  
  public init(type: FHIRKitPrimitive<FHIRKitString>, value: _Value) {
    self.type = type
    self.value = value
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<FHIRKitString>,
    value: _Value
  ) {
    self.init(type: type, value: value)
    self.`extension` = `extension`
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type; case _type
    case valueBase64Binary; case _valueBase64Binary
    case valueString; case _valueString
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    // validate that the expanded property `value` has at least one of it's mandatory properties
    guard _container.contains(CodingKeys.valueBase64Binary) || _container.contains(CodingKeys.valueString) else {
      throw DecodingError.valueNotFound(Any.self, DecodingError.Context(codingPath: [CodingKeys.valueBase64Binary, CodingKeys.valueString],
                                                                        debugDescription: "Must have at least one value for \"value\", but has none"))
    }
    
    var _value: _Value? = nil
    if let valueBase64Binary = try FHIRKitPrimitive<FHIRKitBase64Binary>(from: _container, forKeyIfPresent: .valueBase64Binary, auxiliaryKey: ._valueBase64Binary) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBase64Binary, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .base64binary(valueBase64Binary)
    }
    if let valueString = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .valueString, auxiliaryKey: ._valueString) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueString, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .string(valueString)
    }
    
    self.type = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKey: .type, auxiliaryKey: ._type)
    self.value = _value!
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    try type.encode(on: &_container, forKey: .type, auxiliaryKey: ._type)
    
    switch value {
    case .base64binary(let _value):
      try _value.encode(on: &_container, forKey: .valueBase64Binary, auxiliaryKey: ._valueBase64Binary)
    case .string(let _value):
      try _value.encode(on: &_container, forKey: .valueString, auxiliaryKey: .valueString)
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? AuditEventEntityDetail else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && value == _other.value
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(value)
  }
}
