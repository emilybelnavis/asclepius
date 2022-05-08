//
//  DosageDoseAndRate.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/// The amount of medication administered
open class DosageDoseAndRate: Element {
  /// All possible types for `dose`
  public enum DoseX: Hashable {
    case quantity(Quantity)
    case range(Range)
  }
  
  /// All possible types for `rate`
  public enum RateX: Hashable {
    case quantity(Quantity)
    case range(Range)
    case ratio(Ratio)
  }
  
  /// The kind of dose or rate specified
  public var type: CodeableConcept?
  
  /// Amount of medication per dose
  public var dose: DoseX?
  
  /// Amount of medication per unit of time
  public var rate: RateX?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    type: CodeableConcept? = nil,
    dose: DoseX? = nil,
    rate: RateX? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.type = type
    self.dose = dose
    self.rate = rate
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type
    case doseQuantity
    case doseRange
    case rateQuantity
    case rateRange
    case rateRatio
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    // decode Dose
    var tempDose: DoseX?
    
    if let doseQuantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .doseQuantity) {
      if tempDose != nil {
        throw DecodingError.dataCorruptedError(forKey: .doseQuantity, in: codingKeyContainer, debugDescription: "More than one value provided for \"dose\"")
      }
      tempDose = .quantity(doseQuantity)
    }
    
    if let doseRange = try Range(from: codingKeyContainer, forKeyIfPresent: .doseRange) {
      if tempDose != nil {
        throw DecodingError.dataCorruptedError(forKey: .doseRange, in: codingKeyContainer, debugDescription: "More than one value provided for \"dose\"")
      }
      tempDose = .range(doseRange)
    }
    
    // decode Rate
    var tempRate: RateX?
    if let rateQuantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .rateQuantity) {
      if tempRate != nil {
        throw DecodingError.dataCorruptedError(forKey: .rateQuantity, in: codingKeyContainer, debugDescription: "More than one value provided for \"rate\"")
      }
      tempRate = .quantity(rateQuantity)
    }
    
    if let rateRange = try Range(from: codingKeyContainer, forKeyIfPresent: .rateRange) {
      if tempRate != nil {
        throw DecodingError.dataCorruptedError(forKey: .rateRange, in: codingKeyContainer, debugDescription: "More than one value provided for \"rate\"")
      }
      tempRate = .range(rateRange)
    }
    
    if let rateRatio = try Ratio(from: codingKeyContainer, forKeyIfPresent: .rateRatio) {
      if tempRate != nil {
        throw DecodingError.dataCorruptedError(forKey: .rateRatio, in: codingKeyContainer, debugDescription: "More than one value provided for \"rate\"")
      }
      
      tempRate = .ratio(rateRatio)
    }
    
    self.type = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.dose = tempDose
    self.rate = tempRate
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    
    if let enumDose = dose {
      switch enumDose {
      case .quantity(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .doseQuantity)
      case .range(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .doseRange)
      }
    }
    
    if let enumRate = rate {
      switch enumRate {
      case .quantity(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .rateQuantity)
      case .range(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .rateRange)
      case .ratio(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .rateRatio)
      }
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DosageDoseAndRate else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && dose == _other.dose
    && rate == _other.rate
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(dose)
    hasher.combine(rate)
  }
}
