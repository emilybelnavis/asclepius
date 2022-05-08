//
//  CodeSystemConceptProperty.swift
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

/// A property value for this concept
open class CodeSystemConceptProperty: BackboneElement {
  /// all possible types for `value[x]`
  public enum ValueX: Hashable {
    case boolean(AlexandriaHRMPrimitive<AlexandriaHRMBool>)
    case code(AlexandriaHRMPrimitive<AlexandriaHRMString>)
    case coding(Coding)
    case dateTime(AlexandriaHRMPrimitive<AlexandriaHRMDateTime>)
    case decimal(AlexandriaHRMPrimitive<AlexandriaHRMDecimal>)
    case integer(AlexandriaHRMPrimitive<AlexandriaHRMInteger>)
    case string(AlexandriaHRMPrimitive<AlexandriaHRMString>)
  }
  
  /// Reference to CodeSystem.property.code
  public var code: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
  /// Value of the property for this concept
  public var value: ValueX
  
  public init(code: AlexandriaHRMPrimitive<AlexandriaHRMString>, value: ValueX) {
    self.code = code
    self.value = value
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    code: AlexandriaHRMPrimitive<AlexandriaHRMString>,
    value: ValueX
  ) {
    self.init(code: code, value: value)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.code = code
    self.value = value
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code; case _code
    case valueBoolean; case _valueBoolean
    case valueCode; case _valueCode
    case valueCoding
    case valueDateTime; case _valueDateTime
    case valueDecimal; case _valueDecimal
    case valueInteger; case _valueInteger
    case valueString; case _valueString
  }
  
  // swiftlint:disable cyclomatic_complexity
  // todo: refactor this mess into a class
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempValue: ValueX?
    if let valueBoolean = try AlexandriaHRMPrimitive<AlexandriaHRMBool>(from: codingKeyContainer, forKeyIfPresent: .valueBoolean, auxKey: ._valueBoolean) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBoolean, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .boolean(valueBoolean)
    }
    
    if let valueCode = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .valueCode, auxKey: ._valueCode) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCode, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .code(valueCode)
    }
    
    if let valueCoding = try Coding(from: codingKeyContainer, forKeyIfPresent: .valueCoding) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCoding, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .coding(valueCoding)
    }
    
    if let valueDateTime = try AlexandriaHRMPrimitive<AlexandriaHRMDateTime>(from: codingKeyContainer, forKeyIfPresent: .valueDateTime, auxKey: ._valueDateTime) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDateTime, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .dateTime(valueDateTime)
    }
    
    if let valueDecimal = try AlexandriaHRMPrimitive<AlexandriaHRMDecimal>(from: codingKeyContainer, forKeyIfPresent: .valueDecimal, auxKey: ._valueDecimal) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDecimal, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .decimal(valueDecimal)
    }
    
    if let valueInteger = try AlexandriaHRMPrimitive<AlexandriaHRMInteger>(from: codingKeyContainer, forKeyIfPresent: .valueInteger, auxKey: ._valueInteger) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueInteger, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .integer(valueInteger)
    }
    
    if let valueString = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .valueString, auxKey: ._valueString) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueString, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .string(valueString)
    }
    
    self.code = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKey: .code, auxKey: ._code)
    self.value = tempValue!
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    switch value {
    case .boolean(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueBoolean, auxKey: ._valueBoolean)
    case .code(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueCode, auxKey: ._valueCode)
    case .coding(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueCoding)
    case .dateTime(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueDateTime, auxKey: ._valueDateTime)
    case .decimal(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueDecimal, auxKey: ._valueDecimal)
    case .integer(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueInteger, auxKey: ._valueInteger)
    case .string(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueString, auxKey: ._valueString)
    }
    
    try code.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CodeSystemConceptProperty else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return code == _other.code
    && value == _other.value
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(value)
  }
}
