//
//  AuditEventEntityDetail.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/// Tagged value pairs for conveying additional information about the entity
open class AuditEventEntityDetail: BackboneElement {
  public enum ValueX: Hashable {
    case base64binary(AlexandriaHRMPrimitive<AlexandriaHRMBase64Binary>)
    case string(AlexandriaHRMPrimitive<AlexandriaHRMString>)
  }
  
  /// name of the property
  public var type: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
  /// property value
  public var value: ValueX
  
  public init(type: AlexandriaHRMPrimitive<AlexandriaHRMString>, value: ValueX) {
    self.type = type
    self.value = value
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    type: AlexandriaHRMPrimitive<AlexandriaHRMString>,
    value: ValueX
  ) {
    self.init(type: type, value: value)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
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
    if let valueBase64Binary = try AlexandriaHRMPrimitive<AlexandriaHRMBase64Binary>(from: codingKeyContainer, forKeyIfPresent: .valueBase64Binary, auxKey: ._valueBase64Binary) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBase64Binary, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .base64binary(valueBase64Binary)
    }
    if let valueString = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .valueString, auxKey: ._valueString) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueString, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .string(valueString)
    }
    
    self.type = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.value = tempValue!
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
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
  override public func isEqual(to _other: Any?) -> Bool {
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
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(value)
  }
}
