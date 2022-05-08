//
//  DeviceRequestParameter.swift
//  AlexandriaHRM
//  Module: STU3
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

/**
 Device details; Specific parameters for the ordered item
 */
open class DeviceRequestParameter: BackboneElement {
  public enum ValueX: Hashable {
    case boolean(AlexandriaHRMPrimitive<AlexandriaHRMBool>)
    case codeableConcept(CodeableConcept)
    case quantity(Quantity)
    case range(Range)
  }
  
  /// Device detail
  public var code: CodeableConcept?
  
  /// Value of detail
  public var value: ValueX?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    code: CodeableConcept? = nil,
    value: ValueX? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.code = code
    self.value = value
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code
    case valueBoolean; case _valueBoolean
    case valueCodeableConcept
    case valueQuantity
    case valueRange
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempValue: ValueX?
    if let valueBoolean = try AlexandriaHRMPrimitive<AlexandriaHRMBool>(from: codingKeyContainer, forKeyIfPresent: .valueBoolean, auxKey: ._valueBoolean) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBoolean, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .boolean(valueBoolean)
    }
    
    if let valueCodeableConcept = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .valueCodeableConcept) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCodeableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .codeableConcept(valueCodeableConcept)
    }
    
    if let valueQuantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .valueQuantity) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueQuantity, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .quantity(valueQuantity)
    }
    
    if let valueRange = try Range(from: codingKeyContainer, forKeyIfPresent: .valueRange) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRange, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .range(valueRange)
    }
    
    self.code = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .code)
    self.value = tempValue
  
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumValue = value {
      switch enumValue {
      case .boolean(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueBoolean, auxKey: ._valueBoolean)
      case .codeableConcept(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueCodeableConcept)
      case .quantity(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueQuantity)
      case .range(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueRange)
      }
    }
    
    try code?.encode(on: &codingKeyContainer, forKey: .code)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DeviceRequestParameter else {
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
