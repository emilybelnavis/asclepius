//
//  CoverageEligibilityResponseInsuranceItemBenefit.swift
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
 Benefits summary; Benefits used to date
 */
open class CoverageEligibilityResponseInsuranceItemBenefit: BackboneElement {
  public enum AllowedX: Hashable {
    case money(Money)
    case string(FHIRKitPrimitive<FHIRKitString>)
    case unsignedInteger(FHIRKitPrimitive<FHIRKitUnsignedInteger>)
  }
  
  public enum UsedX: Hashable {
    case money(Money)
    case string(FHIRKitPrimitive<FHIRKitString>)
    case unsignedInteger(FHIRKitPrimitive<FHIRKitUnsignedInteger>)
  }
  
  /// Benefit classification
  public var type: CodableConcept
  
  /// Benefits allowed
  public var allowed: AllowedX?
  
  /// Benefits used
  public var used: UsedX?
  
  public init(type: CodableConcept) {
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: CodableConcept,
    allowed: AllowedX?,
    used: UsedX?
  ) {
    self.init(type: type)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.allowed = allowed
    self.used = used
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type
    case allowedMoney
    case allowedString; case _allowedString
    case allowedUnsignedInteger; case _allowedUnsignedInteger
    case usedMoney
    case usedString; case _usedString
    case usedUnsignedInteger; case _usedUnsignedInteger
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempAllowed: AllowedX?
    if let allowedMoney = try Money(from: codingKeyContainer, forKeyIfPresent: .allowedMoney) {
      if tempAllowed != nil {
        throw DecodingError.dataCorruptedError(forKey: .allowedMoney, in: codingKeyContainer, debugDescription: "More than one value provided for \"allowed\"")
      }
      tempAllowed = .money(allowedMoney)
    }
    
    if let allowedString = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: ._allowedString, auxKey: ._allowedString) {
      if tempAllowed != nil {
        throw DecodingError.dataCorruptedError(forKey: .allowedString, in: codingKeyContainer, debugDescription: "More than one value provided for \"allowed\"")
      }
      tempAllowed = .string(allowedString)
    }
    
    if let allowedUnsignedInteger = try FHIRKitPrimitive<FHIRKitUnsignedInteger>(from: codingKeyContainer, forKeyIfPresent: ._allowedUnsignedInteger, auxKey: ._allowedUnsignedInteger) {
      if tempAllowed != nil {
        throw DecodingError.dataCorruptedError(forKey: .allowedUnsignedInteger, in: codingKeyContainer, debugDescription: "More than one value provided for \"allowed\"")
      }
      tempAllowed = .unsignedInteger(allowedUnsignedInteger)
    }
    
    var tempUsed: UsedX?
    if let usedMoney = try Money(from: codingKeyContainer, forKeyIfPresent: .usedMoney) {
      if tempUsed != nil {
        throw DecodingError.dataCorruptedError(forKey: .usedMoney, in: codingKeyContainer, debugDescription: "More than one value provided for \"used\"")
      }
      tempUsed = .money(usedMoney)
    }
    
    if let usedString = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .usedString, auxKey: ._usedString) {
      if tempUsed != nil {
        throw DecodingError.dataCorruptedError(forKey: .usedString, in: codingKeyContainer, debugDescription: "More than one value provided for \"used\"")
      }
      tempUsed = .string(usedString)
    }
    
    if let usedUnsignedInteger = try FHIRKitPrimitive<FHIRKitUnsignedInteger>(from: codingKeyContainer, forKeyIfPresent: .usedUnsignedInteger, auxKey: ._usedUnsignedInteger) {
      if tempUsed != nil {
        throw DecodingError.dataCorruptedError(forKey: .usedUnsignedInteger, in: codingKeyContainer, debugDescription: "More than one value provided for \"used\"")
      }
      tempUsed = .unsignedInteger(usedUnsignedInteger)
    }
    
    self.type = try CodableConcept(from: codingKeyContainer, forKey: .type)
    self.allowed = tempAllowed
    self.used = tempUsed
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumAllowed = allowed {
      switch enumAllowed {
      case .money(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .allowedMoney)
      case .string(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .allowedString, auxKey: ._allowedString)
      case .unsignedInteger(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .allowedUnsignedInteger, auxKey: ._allowedUnsignedInteger)
      }
    }
    
    if let enumUsed = used {
      switch enumUsed {
      case .money(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .usedMoney)
      case .string(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .usedString, auxKey: ._usedString)
      case .unsignedInteger(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .usedUnsignedInteger, auxKey: ._usedUnsignedInteger)
      }
    }
    
    try type.encode(on: &codingKeyContainer, forKey: .type)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CoverageEligibilityResponseInsuranceItemBenefit else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && allowed == _other.allowed
    && used == _other.used
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(allowed)
    hasher.combine(used)
  }
}
