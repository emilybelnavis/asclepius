//
//  SampledData.swift
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
 A series of measurements taken by a device with upper and lower limits. There may be more than one
 dimension in the data.
 */
open class SampledData: Element {
  /// zero value and units
  public var origin: Quantity
  
  /// number of milliseconds between samples (resolution)
  public var period: FHIRKitPrimitive<FHIRKitDecimal>
  
  /// multiply data by this value before adding to origin
  public var factor: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// lower detection bound
  public var lowerLimit: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// upper detection bound
  public var upperLimit: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// number of sample points at each time point
  public var dimensions: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// decimal values with spaces, or "E" | "U" | "L"
  public var data: FHIRKitPrimitive<FHIRKitString>?
  
  public init(origin: Quantity, period: FHIRKitPrimitive<FHIRKitDecimal>, dimensions: FHIRKitPrimitive<FHIRKitPositiveInteger>) {
    self.origin = origin
    self.period = period
    self.dimensions = dimensions
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    origin: Quantity,
    period: FHIRKitPrimitive<FHIRKitDecimal>,
    factor: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    lowerLimit: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    upperLimit: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    dimensions: FHIRKitPrimitive<FHIRKitPositiveInteger>,
    data: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init(origin: origin, period: period, dimensions: dimensions)
    self.`extension` = `extension`
    self.id = id
    self.factor = factor
    self.lowerLimit = lowerLimit
    self.upperLimit = upperLimit
    self.data = data
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case origin
    case period; case _period
    case factor; case _factor
    case lowerLimit; case _lowerLimit
    case upperLimit; case _upperLimit
    case dimensions; case _dimensions
    case data; case _data
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.origin = try Quantity(from: _container, forKey: .origin)
    self.period = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKey: .period, auxiliaryKey: ._period)
    self.factor = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKeyIfPresent: .factor, auxiliaryKey: ._factor)
    self.lowerLimit = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKeyIfPresent: .lowerLimit, auxiliaryKey: ._lowerLimit)
    self.upperLimit = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKeyIfPresent: .upperLimit, auxiliaryKey: ._upperLimit)
    self.dimensions = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKey: .dimensions, auxiliaryKey: ._dimensions)
    self.data = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .data, auxiliaryKey: ._data)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try origin.encode(on: &_container, forKey: .origin)
    try period.encode(on: &_container, forKey: .period, auxiliaryKey: ._period)
    try factor?.encode(on: &_container, forKey: .factor, auxiliaryKey: ._factor)
    try lowerLimit?.encode(on: &_container, forKey: .lowerLimit, auxiliaryKey: ._lowerLimit)
    try upperLimit?.encode(on: &_container, forKey: .upperLimit, auxiliaryKey: ._upperLimit)
    try dimensions.encode(on: &_container, forKey: .dimensions, auxiliaryKey: ._dimensions)
    try data?.encode(on: &_container, forKey: .data, auxiliaryKey: ._data)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? SampledData else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return origin == _other.origin
    && period == _other.period
    && factor == _other.factor
    && lowerLimit == _other.lowerLimit
    && upperLimit == _other.upperLimit
    && dimensions == _other.dimensions
    && data == _other.data
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(origin)
    hasher.combine(period)
    hasher.combine(factor)
    hasher.combine(lowerLimit)
    hasher.combine(upperLimit)
    hasher.combine(dimensions)
    hasher.combine(data)
  }
}