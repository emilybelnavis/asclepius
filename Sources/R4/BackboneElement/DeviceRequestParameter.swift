//
//  DeviceRequestParameter.swift
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
 Device details; Specific parameters for the ordered item
 */
open class DeviceRequestParameter: BackboneElement {
  public enum ValueX: Hashable {
    case boolean(FHIRKitPrimitive<FHIRKitBool>)
    case codableConcept(CodableConcept)
    case quantity(Quantity)
    case range(Range)
  }
  
  /// Device detail
  public var code: CodableConcept?
  
  /// Value of detail
  public var value: ValueX?
  
  public override init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    code: CodableConcept? = nil,
    value: ValueX? = nil
  ) {
    self.init()
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
    case valueCodableConcept
    case valueQuantity
    case valueRange
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
    
    if let valueCodableConcept = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .valueCodableConcept) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCodableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .codableConcept(valueCodableConcept)
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
    
    self.code = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .code)
    self.value = tempValue
  
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumValue = value {
      switch enumValue {
      case .boolean(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueBoolean, auxKey: ._valueBoolean)
      case .codableConcept(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueCodableConcept)
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
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(value)
  }
}
