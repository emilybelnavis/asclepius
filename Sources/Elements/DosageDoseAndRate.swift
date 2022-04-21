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
  public enum Dose: Hashable {
    case quantity(Quantity)
    case range(Range)
  }
  
  /// All possible types for `rate`
  public enum Rate: Hashable {
    case quantity(Quantity)
    case range(Range)
    case ratio(Ratio)
  }
  
  /// The kind of dose or rate specified
  public var type: CodableConcept?
  
  /// Amount of medication per dose
  public var dose: Dose?
  
  /// Amount of medication per unit of time
  public var rate: Rate?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: CodableConcept? = nil,
    dose: Dose? = nil,
    rate: Rate? = nil
  ) {
    self.init()
    self.`extension` = `extension`
    self.id = id
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try CodableConcept(from: _container, forKeyIfPresent: .type)
    
    // decode Dose
    var tempDose: Dose? = nil
    
    if let doseQuantity = try Quantity(from: _container, forKeyIfPresent: .doseQuantity) {
      if tempDose != nil {
        throw DecodingError.dataCorruptedError(forKey: .doseQuantity, in: _container, debugDescription: "More than one value provided for \"dose\"")
      }
      tempDose = .quantity(doseQuantity)
    }
    
    if let doseRange = try Range(from: _container, forKeyIfPresent: .doseRange) {
      if tempDose != nil {
        throw DecodingError.dataCorruptedError(forKey: .doseRange, in: _container, debugDescription: "More than one value provided for \"dose\"")
      }
      tempDose = .range(doseRange)
    }
    self.dose = tempDose
    
    // decode Rate
    var tempRate: Rate? = nil
    if let rateQuantity = try Quantity(from: _container, forKeyIfPresent: .rateQuantity) {
      if tempRate != nil {
        throw DecodingError.dataCorruptedError(forKey: .rateQuantity, in: _container, debugDescription: "More than one value provided for \"rate\"")
      }
      tempRate = .quantity(rateQuantity)
    }
    
    if let rateRange = try Range(from: _container, forKeyIfPresent: .rateRange) {
      if tempRate != nil {
        throw DecodingError.dataCorruptedError(forKey: .rateRange, in: _container, debugDescription: "More than one value provided for \"rate\"")
      }
      tempRate = .range(rateRange)
    }
    
    if let rateRatio = try Ratio(from: _container, forKeyIfPresent: .rateRatio) {
      if tempRate != nil {
        throw DecodingError.dataCorruptedError(forKey: .rateRatio, in: _container, debugDescription: "More than one value provided for \"rate\"")
      }
      
      tempRate = .ratio(rateRatio)
    }
    
    self.rate = tempRate
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try type?.encode(on: &_container, forKey: .type)
    
    if let _dose = dose {
      switch _dose {
        case .quantity(let _value):
          try _value.encode(on: &_container, forKey: .doseQuantity)
        case .range(let _value):
          try _value.encode(on: &_container, forKey: .doseRange)
      }
    }
    
    if let _rate = rate {
      switch _rate {
        case .quantity(let _value):
          try _value.encode(on: &_container, forKey: .rateQuantity)
        case .range(let _value):
          try _value.encode(on: &_container, forKey: .rateRange)
        case .ratio(let _value):
          try _value.encode(on: &_container, forKey: .rateRatio)
      }
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
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
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(dose)
    hasher.combine(rate)
  }
}
