//
//  SampledData.swift
//  Asclepius
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

import AsclepiusCore

/**
 A series of measurements taken by a device with upper and lower limits. There may be more than one
 dimension in the data.
 */
open class SampledData: Element {
  /// zero value and units
  public var origin: Quantity
  
  /// number of milliseconds between samples (resolution)
  public var period: AsclepiusPrimitive<AsclepiusDecimal>
  
  /// multiply data by this value before adding to origin
  public var factor: AsclepiusPrimitive<AsclepiusDecimal>?
  
  /// lower detection bound
  public var lowerLimit: AsclepiusPrimitive<AsclepiusDecimal>?
  
  /// upper detection bound
  public var upperLimit: AsclepiusPrimitive<AsclepiusDecimal>?
  
  /// number of sample points at each time point
  public var dimensions: AsclepiusPrimitive<AsclepiusPositiveInteger>
  
  /// decimal values with spaces, or "E" | "U" | "L"
  public var data: AsclepiusPrimitive<AsclepiusString>?
  
  public init(origin: Quantity, period: AsclepiusPrimitive<AsclepiusDecimal>, dimensions: AsclepiusPrimitive<AsclepiusPositiveInteger>) {
    self.origin = origin
    self.period = period
    self.dimensions = dimensions
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    origin: Quantity,
    period: AsclepiusPrimitive<AsclepiusDecimal>,
    factor: AsclepiusPrimitive<AsclepiusDecimal>? = nil,
    lowerLimit: AsclepiusPrimitive<AsclepiusDecimal>? = nil,
    upperLimit: AsclepiusPrimitive<AsclepiusDecimal>? = nil,
    dimensions: AsclepiusPrimitive<AsclepiusPositiveInteger>,
    data: AsclepiusPrimitive<AsclepiusString>? = nil
  ) {
    self.init(origin: origin, period: period, dimensions: dimensions)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
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
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.origin = try Quantity(from: codingKeyContainer, forKey: .origin)
    self.period = try AsclepiusPrimitive<AsclepiusDecimal>(from: codingKeyContainer, forKey: .period, auxKey: ._period)
    self.factor = try AsclepiusPrimitive<AsclepiusDecimal>(from: codingKeyContainer, forKeyIfPresent: .factor, auxKey: ._factor)
    self.lowerLimit = try AsclepiusPrimitive<AsclepiusDecimal>(from: codingKeyContainer, forKeyIfPresent: .lowerLimit, auxKey: ._lowerLimit)
    self.upperLimit = try AsclepiusPrimitive<AsclepiusDecimal>(from: codingKeyContainer, forKeyIfPresent: .upperLimit, auxKey: ._upperLimit)
    self.dimensions = try AsclepiusPrimitive<AsclepiusPositiveInteger>(from: codingKeyContainer, forKey: .dimensions, auxKey: ._dimensions)
    self.data = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .data, auxKey: ._data)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try origin.encode(on: &codingKeyContainer, forKey: .origin)
    try period.encode(on: &codingKeyContainer, forKey: .period, auxKey: ._period)
    try factor?.encode(on: &codingKeyContainer, forKey: .factor, auxKey: ._factor)
    try lowerLimit?.encode(on: &codingKeyContainer, forKey: .lowerLimit, auxKey: ._lowerLimit)
    try upperLimit?.encode(on: &codingKeyContainer, forKey: .upperLimit, auxKey: ._upperLimit)
    try dimensions.encode(on: &codingKeyContainer, forKey: .dimensions, auxKey: ._dimensions)
    try data?.encode(on: &codingKeyContainer, forKey: .data, auxKey: ._data)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
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
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
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
