//
//  GroupCharacteristic.swift
//  Asclepius
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

import AsclepiusCore
/// Identifies traits whos presence or absence are shared by members of the group
open class GroupCharacteristic: BackboneElement {
  public enum ValueX: Hashable {
    case boolean(AsclepiusPrimitive<AsclepiusBool>)
    case codeableConcept(CodeableConcept)
    case quantity(Quantity)
    case range(Range)
    case reference(Reference)
  }
  
  ///  type of characteristic
  public var code: CodeableConcept
  
  /// value held by characteristic
  public var valueX: ValueX
  
  /// group includes or excludes
  public var exclude: AsclepiusPrimitive<AsclepiusBool>
  
  /// period over which characteristic is tested
  public var period: Period?

  public init(code: CodeableConcept, valueX: ValueX, exclude: AsclepiusPrimitive<AsclepiusBool>) {
    self.code = code
    self.valueX = valueX
    self.exclude = exclude
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    code: CodeableConcept,
    valueX: ValueX,
    exclude: AsclepiusPrimitive<AsclepiusBool>,
    period: Period? = nil
  ) {
    self.init(code: code, valueX: valueX, exclude: exclude)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.period = period
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code
    case valueBool; case _valueBool
    case valueCodeableConcept
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
    guard codingKeyContainer.contains(CodingKeys.valueBool) || codingKeyContainer.contains(CodingKeys.valueCodeableConcept) || codingKeyContainer.contains(CodingKeys.valueQuantity) || codingKeyContainer.contains(CodingKeys.valueRange) || codingKeyContainer.contains(CodingKeys.valueReference) else { // swiftlint:disable:this line_length
      throw DecodingError.valueNotFound(Any.self, DecodingError.Context(codingPath: [
        CodingKeys.valueBool,
        CodingKeys.valueCodeableConcept,
        CodingKeys.valueQuantity,
        CodingKeys.valueRange,
        CodingKeys.valueReference
      ], debugDescription: "Must have at least one value for \"value\" but have none"))
    }
    
    // decode values for expanded prop. `value`
    var tempValueX: ValueX? = nil // swiftlint:disable:this redundant_optional_initialization
    if let valueBool = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .valueBool, auxKey: ._valueBool) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBool, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .boolean(valueBool)
    }
    
    if let valueCodeableConcept = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .valueCodeableConcept) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCodeableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .codeableConcept(valueCodeableConcept)
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
    
    self.code = try CodeableConcept(from: codingKeyContainer, forKey: .code)
    self.valueX = tempValueX!
    self.exclude = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKey: .exclude, auxKey: ._exclude)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    switch valueX {
    case .boolean(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueBool)
    case .codeableConcept(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueCodeableConcept)
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
  override public func isEqual(to _other: Any?) -> Bool {
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
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(valueX)
    hasher.combine(exclude)
    hasher.combine(period)
  }
}
