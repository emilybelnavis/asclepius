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
  public enum ValueX: Hashable {
    case base64binary(FHIRKitPrimitive<FHIRKitBase64Binary>)
    case string(FHIRKitPrimitive<FHIRKitString>)
  }
  
  /// name of the property
  public var type: FHIRKitPrimitive<FHIRKitString>
  
  /// property value
  public var value: ValueX
  
  public init(type: FHIRKitPrimitive<FHIRKitString>, value: ValueX) {
    self.type = type
    self.value = value
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<FHIRKitString>,
    value: ValueX
  ) {
    self.init(type: type, value: value)
    self.fhirExtension = fhirExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type; case _type
    case valueBase64Binary; case _valueBase64Binary
    case valueString; case _valueString
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    // validate that the expanded property `value` has at least one of it's mandatory properties
    guard codingKeyContainer.contains(CodingKeys.valueBase64Binary) || codingKeyContainer.contains(CodingKeys.valueString) else {
      throw DecodingError.valueNotFound(Any.self, DecodingError.Context(codingPath: [CodingKeys.valueBase64Binary, CodingKeys.valueString],
                                                                        debugDescription: "Must have at least one value for \"value\", but has none"))
    }
    
    var tempValue: ValueX?
    if let valueBase64Binary = try FHIRKitPrimitive<FHIRKitBase64Binary>(from: codingKeyContainer, forKeyIfPresent: .valueBase64Binary, auxKey: ._valueBase64Binary) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBase64Binary, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .base64binary(valueBase64Binary)
    }
    if let valueString = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .valueString, auxKey: ._valueString) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueString, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .string(valueString)
    }
    
    self.type = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.value = tempValue!
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    
    switch value {
    case .base64binary(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueBase64Binary, auxKey: ._valueBase64Binary)
    case .string(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueString, auxKey: .valueString)
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
