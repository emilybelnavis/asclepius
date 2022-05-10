//
//  Count.swift
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

/**
 A measured or measurable amount
 
 A measured amount (or an amount that can be potentially measured). Note that measured amounts include
 amounts that are not precisely quantified, including amounts involving arbitrary units and floating currencies
 */
open class Count: Quantity {
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    code: AsclepiusPrimitive<AsclepiusString>? = nil,
    comparator: AsclepiusPrimitive<QuantityComparator>? = nil,
    system: AsclepiusPrimitive<AsclepiusURI>? = nil,
    unit: AsclepiusPrimitive<AsclepiusString>? = nil,
    value: AsclepiusPrimitive<AsclepiusDecimal>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.code = code
    self.comparator = comparator
    self.system = system
    self.unit = unit
    self.value = value
  }
  
  // MARK: - Codable
  public required init(from decoder: Decoder) throws {
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Count else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return true
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
  }
}
