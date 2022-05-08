//
//  ContractTermOfferAnswer.swift
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

/// Response to offer text
open class ContractTermOfferAnswer: BackboneElement {
  public enum ValueX: Hashable {
    case attachment(Attachment)
    case boolean(FHIRKitPrimitive<FHIRKitBool>)
    case coding(Coding)
    case date(FHIRKitPrimitive<FHIRKitDate>)
    case dateTime(FHIRKitPrimitive<FHIRKitDateTime>)
    case decimal(FHIRKitPrimitive<FHIRKitDecimal>)
    case integer(FHIRKitPrimitive<FHIRKitInteger>)
    case quantity(Quantity)
    case reference(Reference)
    case string(FHIRKitPrimitive<FHIRKitString>)
    case time(FHIRKitPrimitive<FHIRKitTime>)
    case uri(FHIRKitPrimitive<FHIRKitURI>)
  }
  
  /// The actual answer response
  public var value: ValueX
  
  public init(value: ValueX) {
    self.value = value
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    value: ValueX
  ) {
    self.init(value: value)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case valueAttachment
    case valueBoolean; case _valueBoolean
    case valueCoding
    case valueDate; case _valueDate
    case valueDateTime; case _valueDateTime
    case valueDecimal; case _valueDecimal
    case valueInteger; case _valueInteger
    case valueQuantity
    case valueReference
    case valueString; case _valueString
    case valueTime; case _valueTime
    case valueUri; case _valueUri
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tValue: ValueX?
    if let valueAttachment = try Attachment(from: codingKeyContainer, forKeyIfPresent: .valueAttachment) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAttachment, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tValue = .attachment(valueAttachment)
    }
    
    if let valueBoolean = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .valueBoolean, auxKey: ._valueBoolean) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBoolean, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tValue = .boolean(valueBoolean)
    }
    
    if let valueCoding = try Coding(from: codingKeyContainer, forKeyIfPresent: .valueCoding) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCoding, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tValue = .coding(valueCoding)
    }
    
    if let valueDate = try FHIRKitPrimitive<FHIRKitDate>(from: codingKeyContainer, forKeyIfPresent: .valueDate, auxKey: ._valueDate) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDate, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tValue = .date(valueDate)
    }
    
    if let valueDateTime = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .valueDateTime, auxKey: ._valueDateTime) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDateTime, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tValue = .dateTime(valueDateTime)
    }
    
    if let valueDecimal = try FHIRKitPrimitive<FHIRKitDecimal>(from: codingKeyContainer, forKeyIfPresent: .valueDecimal, auxKey: ._valueDecimal) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDecimal, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tValue = .decimal(valueDecimal)
    }
    
    if let valueInteger = try FHIRKitPrimitive<FHIRKitInteger>(from: codingKeyContainer, forKeyIfPresent: .valueInteger, auxKey: ._valueInteger) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueInteger, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tValue = .integer(valueInteger)
    }
    
    if let valueQuantity = try Quantity(from: codingKeyContainer, forKey: .valueQuantity) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueQuantity, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tValue = .quantity(valueQuantity)
    }
    
    if let valueReference = try Reference(from: codingKeyContainer, forKey: .valueReference) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
    }
    
    if let valueString = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .valueString, auxKey: ._valueString) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueString, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tValue = .string(valueString)
    }
    
    if let valueTime = try FHIRKitPrimitive<FHIRKitTime>(from: codingKeyContainer, forKeyIfPresent: .valueTime, auxKey: ._valueTime) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueTime, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tValue = .time(valueTime)
    }
    
    if let valueUri = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .valueUri, auxKey: ._valueUri) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUri, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tValue = .uri(valueUri)
    }
    
    self.value = tValue!
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    switch value {
    case .attachment(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueAttachment)
    case .boolean(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueBoolean, auxKey: ._valueBoolean)
    case .coding(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueCoding)
    case .date(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueDate, auxKey: ._valueDate)
    case .dateTime(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueDateTime, auxKey: ._valueDateTime)
    case .decimal(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueDecimal, auxKey: ._valueDecimal)
    case .integer(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueInteger, auxKey: ._valueInteger)
    case .quantity(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueQuantity)
    case .reference(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueReference)
    case .string(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueString, auxKey: ._valueString)
    case .time(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueTime, auxKey: ._valueTime)
    case .uri(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueUri, auxKey: ._valueUri)
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContractTermOfferAnswer else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return value == _other.value
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(value)
  }
}
