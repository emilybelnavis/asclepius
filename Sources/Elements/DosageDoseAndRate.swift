//
//  DosageDoseAndRate.swift
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
  public var type: CodableConcept?
  
  /// Amount of medication per dose
  public var doseX: DoseX?
  
  /// Amount of medication per unit of time
  public var rateX: RateX?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: CodableConcept? = nil,
    doseX: DoseX? = nil,
    rateX: RateX? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.type = type
    self.doseX = doseX
    self.rateX = rateX
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
    var tempDoseX: DoseX?
    
    if let doseQuantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .doseQuantity) {
      if tempDoseX != nil {
        throw DecodingError.dataCorruptedError(forKey: .doseQuantity, in: codingKeyContainer, debugDescription: "More than one value provided for \"dose\"")
      }
      tempDoseX = .quantity(doseQuantity)
    }
    
    if let doseRange = try Range(from: codingKeyContainer, forKeyIfPresent: .doseRange) {
      if tempDoseX != nil {
        throw DecodingError.dataCorruptedError(forKey: .doseRange, in: codingKeyContainer, debugDescription: "More than one value provided for \"dose\"")
      }
      tempDoseX = .range(doseRange)
    }
    
    // decode Rate
    var tempRateX: RateX?
    if let rateQuantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .rateQuantity) {
      if tempRateX != nil {
        throw DecodingError.dataCorruptedError(forKey: .rateQuantity, in: codingKeyContainer, debugDescription: "More than one value provided for \"rate\"")
      }
      tempRateX = .quantity(rateQuantity)
    }
    
    if let rateRange = try Range(from: codingKeyContainer, forKeyIfPresent: .rateRange) {
      if tempRateX != nil {
        throw DecodingError.dataCorruptedError(forKey: .rateRange, in: codingKeyContainer, debugDescription: "More than one value provided for \"rate\"")
      }
      tempRateX = .range(rateRange)
    }
    
    if let rateRatio = try Ratio(from: codingKeyContainer, forKeyIfPresent: .rateRatio) {
      if tempRateX != nil {
        throw DecodingError.dataCorruptedError(forKey: .rateRatio, in: codingKeyContainer, debugDescription: "More than one value provided for \"rate\"")
      }
      
      tempRateX = .ratio(rateRatio)
    }
    
    self.type = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.doseX = tempDoseX
    self.rateX = tempRateX
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    
    if let enumDose = doseX {
      switch enumDose {
      case .quantity(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .doseQuantity)
      case .range(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .doseRange)
      }
    }
    
    if let enumRate = rateX {
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
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DosageDoseAndRate else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && doseX == _other.doseX
    && rateX == _other.rateX
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(doseX)
    hasher.combine(rateX)
  }
}
