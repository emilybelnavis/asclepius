//
//  GroupCharacteristic.swift
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

/// Identifies traits whos presence or absence are shared by members of the group
open class GroupCharacteristic: BackboneElement {
  public enum ValueX: Hashable {
    case boolean(FHIRKitPrimitive<FHIRKitBool>)
    case codableConcept(CodableConcept)
    case quantity(Quantity)
    case range(Range)
    case reference(Reference)
  }
  
  ///  type of characteristic
  public var code: CodableConcept
  
  /// value held by characteristic
  public var valueX: ValueX
  
  /// group includes or excludes
  public var exclude: FHIRKitPrimitive<FHIRKitBool>
  
  /// period over which characteristic is tested
  public var period: Period?

  public init(code: CodableConcept, valueX: ValueX, exclude: FHIRKitPrimitive<FHIRKitBool>) {
    self.code = code
    self.valueX = valueX
    self.exclude = exclude
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    code: CodableConcept,
    valueX: ValueX,
    exclude: FHIRKitPrimitive<FHIRKitBool>,
    period: Period? = nil
  ) {
    self.init(code: code, valueX: valueX, exclude: exclude)
    self.fhirExtension = fhirExtension
    self.id = id
    self.period = period
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code
    case valueBool; case _valueBool
    case valueCodableConcept
    case valueQuantity
    case valueRange
    case valueReference
    case exclude; case _exclude
    case period
  }
  
  // swiftlint:disable cyclomatic_complexity
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    // Validate that the expanded properties `value` contains at least one of the mandatory properties
    guard codingKeyContainer.contains(CodingKeys.valueBool) || codingKeyContainer.contains(CodingKeys.valueCodableConcept) || codingKeyContainer.contains(CodingKeys.valueQuantity) || codingKeyContainer.contains(CodingKeys.valueRange) || codingKeyContainer.contains(CodingKeys.valueReference) else { // swiftlint:disable:this line_length
      throw DecodingError.valueNotFound(Any.self, DecodingError.Context(codingPath: [
        CodingKeys.valueBool,
        CodingKeys.valueCodableConcept,
        CodingKeys.valueQuantity,
        CodingKeys.valueRange,
        CodingKeys.valueReference
      ], debugDescription: "Must have at least one value for \"value\" but have none"))
    }
    
    // decode values for expanded prop. `value`
    var tempValueX: ValueX? = nil // swiftlint:disable:this redundant_optional_initialization
    if let valueBool = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .valueBool, auxKey: ._valueBool) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBool, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .boolean(valueBool)
    }
    
    if let valueCodableConcept = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .valueCodableConcept) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCodableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .codableConcept(valueCodableConcept)
    }
    
    if let valueQuantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .valueQuantity) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueQuantity, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .quantity(valueQuantity)
    }
    
    if let valueRange = try Range(from: codingKeyContainer, forKeyIfPresent: .valueRange) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRange, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .range(valueRange)
    }
    
    if let valueReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .valueReference) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .reference(valueReference)
    }
    
    self.code = try CodableConcept(from: codingKeyContainer, forKey: .code)
    self.valueX = tempValueX!
    self.exclude = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKey: .exclude, auxKey: ._exclude)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    switch valueX {
    case .boolean(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueBool)
    case .codableConcept(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueCodableConcept)
    case .quantity(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueQuantity)
    case .range(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueRange)
    case .reference(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueReference)
    }
    
    try code.encode(on: &codingKeyContainer, forKey: .code)
    try exclude.encode(on: &codingKeyContainer, forKey: .exclude, auxKey: ._exclude)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? GroupCharacteristic else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return code == _other.code
    && valueX == _other.valueX
    && exclude == _other.exclude
    && period == _other.period
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(valueX)
    hasher.combine(exclude)
    hasher.combine(period)
  }
}
