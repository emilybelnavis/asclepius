//
//  DeviceDefinitionMaterial.swift
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
 A substance used to create the material(s) of which the device is made
 */
open class DeviceDefinitionMaterial: BackboneElement {
  /// The substance
  public var substance: CodeableConcept
  
  /// Indicates an alternative material of the device
  public var alternate: AsclepiusPrimitive<AsclepiusBool>?
  
  /// Whether the substance is a known or suspected allergen
  public var allergenicIndicator: AsclepiusPrimitive<AsclepiusBool>?
  
  public init(substance: CodeableConcept) {
    self.substance = substance
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    substance: CodeableConcept,
    alternate: AsclepiusPrimitive<AsclepiusBool>? = nil,
    allergenicIndicator: AsclepiusPrimitive<AsclepiusBool>? = nil
  ) {
    self.init(substance: substance)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.alternate = alternate
    self.allergenicIndicator = allergenicIndicator
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case substance
    case alternate; case _alternate
    case allergenicIndicator; case _allergenicIndicator
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.substance = try CodeableConcept(from: codingKeyContainer, forKey: .substance)
    self.alternate = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .alternate, auxKey: ._alternate)
    self.allergenicIndicator = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .allergenicIndicator, auxKey: ._allergenicIndicator)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try substance.encode(on: &codingKeyContainer, forKey: .substance)
    try alternate?.encode(on: &codingKeyContainer, forKey: .alternate, auxKey: ._alternate)
    try allergenicIndicator?.encode(on: &codingKeyContainer, forKey: .allergenicIndicator, auxKey: ._allergenicIndicator)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DeviceDefinitionMaterial else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return substance == _other.substance
    && alternate == _other.alternate
    && allergenicIndicator == _other.allergenicIndicator
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(substance)
    hasher.combine(alternate)
    hasher.combine(allergenicIndicator)
  }
}
