//
//  Ratio.swift
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

/**
 A ratio of two `Quantity` values - a numerator and a denominator
 
 A relationship of two `Quantity` values expressed as a numerator and denominator
 */
open class Ratio: Element {
  /// Numerator value
  public var numerator: Quantity?
  
  /// Denominator value
  public var denominator: Quantity?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    numerator: Quantity? = nil,
    denominator: Quantity? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.numerator = numerator
    self.denominator = denominator
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case numerator
    case denominator
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.numerator = try Quantity(from: codingKeyContainer, forKeyIfPresent: .numerator)
    self.denominator = try Quantity(from: codingKeyContainer, forKeyIfPresent: .denominator)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try numerator?.encode(on: &codingKeyContainer, forKey: .numerator)
    try denominator?.encode(on: &codingKeyContainer, forKey: .denominator)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Ratio else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return numerator == _other.numerator
    && denominator == _other.denominator
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(numerator)
    hasher.combine(denominator)
  }
}
