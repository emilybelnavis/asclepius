//
//  CodeSystemConceptProperty.swift
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

/// A property value for this concept
open class CodeSystemConceptProperty: BackboneElement {
  public enum ValueX: Hashable {
    case boolean(FHIRKitPrimitive<FHIRKitBool>)
    case code(FHIRKitPrimitive<FHIRKitString>)
    case coding(Coding)
    case dateTime(FHIRKitPrimitive<FHIRKitDateTime>)
    case decimal(FHIRKitPrimitive<FHIRKitDecimal>)
    case integer(FHIRKitPrimitive<FHIRKitInteger>)
    case string(FHIRKitPrimitive<FHIRKitString>)
  }
  
  public var code: FHIRKitPrimitive<FHIRKitString>
  public var value: ValueX
  
  public init(code: FHIRKitPrimitive<FHIRKitString>, value: ValueX) {
    self.code = code
    self.value = value
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    code: FHIRKitPrimitive<FHIRKitString>,
    value: ValueX
  ) {
    self.init(code: code, value: value)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.code = code
    self.value = value
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code
    case valueBoolean; case _valueBoolean
    case valueCode; case _valueCode
    case valueCoding
    case valueDateTime; case _valueDateTime
    case valueDecimal; case _valueDecimal
    case valueInteger; case _valueInteger
    case valueString; case _valueString
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempValue: ValueX?
    if let valueBoolean = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .valueBoolean, auxKey: ._valueBoolean) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBoolean, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .boolean(valueBoolean)
    }
    
    if let valueCode = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .valueCode, auxKey: ._valueCode) {
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
    
    if let valueDateTime = try FHIRKitPrimitive<FHIRKitDateTime>(from: coding, forKeyIfPresent: <#T##CodingKey#>, auxKey: <#T##CodingKey?#>)
  }
}
