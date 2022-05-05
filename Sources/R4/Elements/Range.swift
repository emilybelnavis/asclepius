//
//  Range.swift
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
 Set of values bounded by low and high.
 
 A set of ordered Quantities defined by a low and high limit
 */
open class Range: Element {
  /// Low limit
  public var low: Quantity?
  
  /// High limit
  public var high: Quantity?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    low: Quantity? = nil,
    high: Quantity? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.low = low
    self.high = high
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case low
    case high
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.low = try Quantity(from: codingKeyContainer, forKeyIfPresent: .low)
    self.high = try Quantity(from: codingKeyContainer, forKeyIfPresent: .high)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    try low?.encode(on: &codingKeyContainer, forKey: .low)
    try high?.encode(on: &codingKeyContainer, forKey: .high)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Range else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return low == _other.low
    && high == _other.high
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(low)
    hasher.combine(high)
  }
}
