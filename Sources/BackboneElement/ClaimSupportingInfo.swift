//
//  ClaimSupportingInfo.swift
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
 Supporting information for a Claim. Additional information codes regarding exceptions, special considerations,
 the condition, situation, prior and/or concurrent issues
 */
open class ClaimSupportingInfo: BackboneElement {
  public enum _Timing: Hashable {
    case date(FHIRKitPrimitive<FHIRKitDate>)
    case period(Period)
  }
  
  public enum _Value: Hashable {
    case attachment(Attachment)
    case boolean(FHIRKitPrimitive<FHIRKitBool>)
    case quantity(Quantity)
    case reference(Reference)
    case string(FHIRKitPrimitive<FHIRKitString>)
  }
  
  /// Information instance identifier
  public var sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// Classification of the supplied information
  public var category: CodableConcept
  
  /// Type of information
  public var code: CodableConcept?
  
  /// When it occured
  public var timing: _Timing?
  
  /// Data to be provided
  public var value: _Value
  
  /// Explaination for the information
  public var reason: CodableConcept?
  
  public init(sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>, category: CodableConcept, value: _Value) {
    self.sequence = sequence
    self.category = category
    self.value = value
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>,
    category: CodableConcept,
    code: CodableConcept? = nil,
    timing: _Timing?,
    value: _Value,
    reason: CodableConcept? = nil
  ) {
    self.init(sequence: sequence, category: category, value: value)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.code = code
    self.timing = timing
    self.reason = reason
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case category
    case code
    case timingDate; case _timingDate
    case timingPeriod
    case valueAttachment
    case valueBoolean; case _valueBoolean
    case valueQuantity
    case valueReference
    case valueString; case _valueString
    case reason
  }
  
  // swiftlint:disable cyclomatic_complexity
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    var _timing: _Timing? = nil
    if let timingDate = try FHIRKitPrimitive<FHIRKitDate>(from: _container, forKeyIfPresent: .timingDate, auxiliaryKey: ._timingDate) {
      if _timing != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingDate, in: _container, debugDescription: "More than one value provided for \"timing\"")
      }
      _timing = .date(timingDate)
    }
    
    if let timingPeriod = try Period(from: _container, forKeyIfPresent: .timingPeriod) {
      if _timing != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingPeriod, in: _container, debugDescription: "More than one value provided for \"timing\"")
      }
      _timing = .period(timingPeriod)
    }
    
    var _value: _Value? = nil
    if let valueAttachment = try Attachment(from: _container, forKeyIfPresent: .valueAttachment) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAttachment, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .attachment(valueAttachment)
    }
    
    if let valueBoolean = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKeyIfPresent: .valueBoolean, auxiliaryKey: ._valueBoolean) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBoolean, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .boolean(valueBoolean)
    }
    
    if let valueQuantity = try Quantity(from: _container, forKeyIfPresent: .valueQuantity) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueQuantity, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .quantity(valueQuantity)
    }
    
    if let valueReference = try Reference(from: _container, forKeyIfPresent: .valueReference) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueReference, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .reference(valueReference)
    }
    
    if let valueString = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .valueString, auxiliaryKey: ._valueString) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueString, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _value = .string(valueString)
    }
    
    self.sequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKey: .sequence, auxiliaryKey: ._sequence)
    self.category = try CodableConcept(from: _container, forKey: .category)
    self.code = try CodableConcept(from: _container, forKeyIfPresent: .code)
    self.timing = _timing
    self.value = _value!
    self.reason = try CodableConcept(from: _container, forKeyIfPresent: .reason)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    if let _timing = timing {
      switch _timing {
      case .date(let _value):
        try _value.encode(on: &_container, forKey: .timingDate, auxiliaryKey: ._timingDate)
      case .period(let _value):
        try _value.encode(on: &_container, forKey: .timingPeriod)
      }
    }
    
    switch value {
    case .attachment(let _value):
      try _value.encode(on: &_container, forKey: .valueAttachment)
    case .boolean(let _value):
      try _value.encode(on: &_container, forKey: .valueBoolean, auxiliaryKey: ._valueBoolean)
    case .quantity(let _value):
      try _value.encode(on: &_container, forKey: .valueQuantity)
    case .reference(let _value):
      try _value.encode(on: &_container, forKey: .valueReference)
    case .string(let _value):
      try _value.encode(on: &_container, forKey: .valueString, auxiliaryKey: ._valueString)
    }
    
    try sequence.encode(on: &_container, forKey: .sequence, auxiliaryKey: ._sequence)
    try category.encode(on: &_container, forKey: .category)
    try code?.encode(on: &_container, forKey: .code)
    try reason?.encode(on: &_container, forKey: .reason)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimSupportingInfo else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return sequence == _other.sequence
    && category == _other.category
    && code == _other.code
    && timing == _other.timing
    && value == _other.value
    && reason == _other.reason
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(category)
    hasher.combine(code)
    hasher.combine(timing)
    hasher.combine(value)
    hasher.combine(reason)
  }
}
