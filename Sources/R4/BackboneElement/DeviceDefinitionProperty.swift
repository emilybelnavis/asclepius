//
//  DeviceDefinitionProperty.swift
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
 The actual configuration settings of a device as it actually operates (e.g regulation status, time properties)
 */
open class DeviceDefinitionProperty: BackboneElement {
  /// Code that specifies the property `DeviceDefinitionPropertyCode` (extensible
  public var type: CodeableConcept
  
  /// Property value as a quantity
  public var valueQuantity: [Quantity]?
  
  /// Property value as a code (e.g. NTP4 (synced to NTP))
  public var valueCode: [CodeableConcept]?
  
  public init(type: CodeableConcept) {
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    type: CodeableConcept,
    valueQuantity: [Quantity]? = nil,
    valueCode: [CodeableConcept]? = nil
  ) {
    self.init(type: type)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.valueQuantity = valueQuantity
    self.valueCode = valueCode
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type
    case valueQuantity
    case valueCode
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try CodeableConcept(from: codingKeyContainer, forKey: .type)
    self.valueQuantity = try [Quantity](from: codingKeyContainer, forKeyIfPresent: .valueQuantity)
    self.valueCode = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .valueCode)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &codingKeyContainer, forKey: .type)
    try valueQuantity?.encode(on: &codingKeyContainer, forKey: .valueQuantity)
    try valueCode?.encode(on: &codingKeyContainer, forKey: .valueCode)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DeviceDefinitionProperty else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && valueQuantity == _other.valueQuantity
    && valueCode == _other.valueCode
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(valueQuantity)
    hasher.combine(valueCode)
  }
}
