//
//  ClaimSupportingInfo.swift
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

/**
 Supporting information for a Claim. Additional information codes regarding exceptions, special considerations,
 the condition, situation, prior and/or concurrent issues
 */
open class ClaimSupportingInfo: BackboneElement {
  public enum TimingX: Hashable {
    case date(FHIRKitPrimitive<FHIRKitDate>)
    case period(Period)
  }
  
  public enum ValueX: Hashable {
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
  public var timingX: TimingX?
  
  /// Data to be provided
  public var valueX: ValueX
  
  /// Explaination for the information
  public var reason: CodableConcept?
  
  public init(sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>, category: CodableConcept, valueX: ValueX) {
    self.sequence = sequence
    self.category = category
    self.valueX = valueX
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>,
    category: CodableConcept,
    code: CodableConcept? = nil,
    timingX: TimingX,
    valueX: ValueX,
    reason: CodableConcept? = nil
  ) {
    self.init(sequence: sequence, category: category, valueX: valueX)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.code = code
    self.timingX = timingX
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
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempTimingX: TimingX?
    if let timingDate = try FHIRKitPrimitive<FHIRKitDate>(from: codingKeyContainer, forKeyIfPresent: .timingDate, auxKey: ._timingDate) {
      if tempTimingX != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingDate, in: codingKeyContainer, debugDescription: "More than one value provided for \"timing\"")
      }
      tempTimingX = .date(timingDate)
    }
    
    if let timingPeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .timingPeriod) {
      if tempTimingX != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingPeriod, in: codingKeyContainer, debugDescription: "More than one value provided for \"timing\"")
      }
      tempTimingX = .period(timingPeriod)
    }
    
    var tempValueX: ValueX?
    if let valueAttachment = try Attachment(from: codingKeyContainer, forKeyIfPresent: .valueAttachment) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAttachment, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .attachment(valueAttachment)
    }
    
    if let valueBoolean = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .valueBoolean, auxKey: ._valueBoolean) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBoolean, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .boolean(valueBoolean)
    }
    
    if let valueQuantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .valueQuantity) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueQuantity, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .quantity(valueQuantity)
    }
    
    if let valueReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .valueReference) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .reference(valueReference)
    }
    
    if let valueString = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .valueString, auxKey: ._valueString) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueString, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .string(valueString)
    }
    
    self.sequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.category = try CodableConcept(from: codingKeyContainer, forKey: .category)
    self.code = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .code)
    self.timingX = tempTimingX
    self.valueX = tempValueX!
    self.reason = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .reason)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumTiming = timingX {
      switch enumTiming {
      case .date(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .timingDate, auxKey: ._timingDate)
      case .period(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .timingPeriod)
      }
    }
    
    switch valueX {
    case .attachment(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueAttachment)
    case .boolean(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueBoolean, auxKey: ._valueBoolean)
    case .quantity(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueQuantity)
    case .reference(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueReference)
    case .string(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueString, auxKey: ._valueString)
    }
    
    try sequence.encode(on: &codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    try category.encode(on: &codingKeyContainer, forKey: .category)
    try code?.encode(on: &codingKeyContainer, forKey: .code)
    try reason?.encode(on: &codingKeyContainer, forKey: .reason)
    
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
    && timingX == _other.timingX
    && valueX == _other.valueX
    && reason == _other.reason
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(category)
    hasher.combine(code)
    hasher.combine(timingX)
    hasher.combine(valueX)
    hasher.combine(reason)
  }
}