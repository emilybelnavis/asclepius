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
  public enum _Value: Hashable {
    case boolean(FHIRKitPrimitive<FHIRKitBool>)
    case codableConcept(CodableConcept)
    case quantity(Quantity)
    case range(Range)
    case reference(Reference)
  }
  
  ///  type of characteristic
  public var code: CodableConcept
  
  /// value held by characteristic
  public var value: _Value
  
  /// group includes or excludes
  public var exclude: FHIRKitPrimitive<FHIRKitBool>
  
  /// period over which characteristic is tested
  public var period: Period?

  public init(code: CodableConcept, value: _Value, exclude: FHIRKitPrimitive<FHIRKitBool>) {
    self.code = code
    self.value = value
    self.exclude = exclude
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    code: CodableConcept,
    value: _Value,
    exclude: FHIRKitPrimitive<FHIRKitBool>,
    period: Period? = nil
  ) {
    self.init(code: code, value: value, exclude: exclude)
    self.`extension` = `extension`
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    // Validate that the expanded properties `value` contains at least one of the mandatory properties
    guard _container.contains(CodingKeys.valueBool) || _container.contains(CodingKeys.valueCodableConcept) || _container.contains(CodingKeys.valueQuantity) || _container.contains(CodingKeys.valueRange) || _container.contains(CodingKeys.valueReference) else { // swiftlint:disable:this line_length
      throw DecodingError.valueNotFound(Any.self, DecodingError.Context(codingPath: [
        CodingKeys.valueBool,
        CodingKeys.valueCodableConcept,
        CodingKeys.valueQuantity,
        CodingKeys.valueRange,
        CodingKeys.valueReference
      ], debugDescription: "Must have at least one value for \"value\" but have none"))
    }
    
    // decode values for expanded prop. `value`
    var _value: _Value? = nil // swiftlint:disable:this redundant_optional_initialization
    if let valueBool = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKeyIfPresent: .valueBool, auxiliaryKey: ._valueBool) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBool, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .boolean(valueBool)
    }
    
    if let valueCodableConcept = try CodableConcept(from: _container, forKeyIfPresent: .valueCodableConcept) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCodableConcept, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .codableConcept(valueCodableConcept)
    }
    
    if let valueQuantity = try Quantity(from: _container, forKeyIfPresent: .valueQuantity) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueQuantity, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .quantity(valueQuantity)
    }
    
    if let valueRange = try Range(from: _container, forKeyIfPresent: .valueRange) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRange, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .range(valueRange)
    }
    
    if let valueReference = try Reference(from: _container, forKeyIfPresent: .valueReference) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueReference, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .reference(valueReference)
    }
    
    self.code = try CodableConcept(from: _container, forKey: .code)
    self.value = _value!
    self.exclude = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKey: .exclude, auxiliaryKey: ._exclude)
    self.period = try Period(from: _container, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    switch value {
    case .boolean(let _value):
      try _value.encode(on: &_container, forKey: .valueBool)
    case .codableConcept(let _value):
      try _value.encode(on: &_container, forKey: .valueCodableConcept)
    case .quantity(let _value):
      try _value.encode(on: &_container, forKey: .valueQuantity)
    case .range(let _value):
      try _value.encode(on: &_container, forKey: .valueRange)
    case .reference(let _value):
      try _value.encode(on: &_container, forKey: .valueReference)
    }
    
    try code.encode(on: &_container, forKey: .code)
    try exclude.encode(on: &_container, forKey: .exclude, auxiliaryKey: ._exclude)
    try period?.encode(on: &_container, forKey: .period)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? GroupCharacteristic else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return code == _other.code
    && value == _other.value
    && exclude == _other.exclude
    && period == _other.period
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(value)
    hasher.combine(exclude)
    hasher.combine(period)
  }
}
