//
//  ClinicalImpressionFinding.swift
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

/// Specific fnidings or diagnoses that werwe considered likely or relevant to ongoing treatment
open class ClinicalImpressionFinding: BackboneElement {
  /// What was found
  public var itemCodableConcept: CodableConcept?
  
  /// What was found
  public var itemReference: Reference?
  
  /// Which investigations support finding
  public var basis: FHIRKitPrimitive<FHIRKitString>?
  
  public override init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    itemCodableConcept: CodableConcept? = nil,
    itemReference: Reference? = nil,
    basis: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.itemCodableConcept = itemCodableConcept
    self.itemReference = itemReference
    self.basis = basis
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case itemCodableConcept
    case itemReference
    case basis; case _basis
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.itemCodableConcept = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .itemCodableConcept)
    self.itemReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .itemReference)
    self.basis = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .basis, auxKey: ._basis)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try itemCodableConcept?.encode(on: &codingKeyContainer, forKey: .itemCodableConcept)
    try itemReference?.encode(on: &codingKeyContainer, forKey: .itemReference)
    try basis?.encode(on: &codingKeyContainer, forKey: .basis, auxKey: ._basis)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClinicalImpressionFinding else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return itemCodableConcept == _other.itemCodableConcept
    && itemReference == _other.itemReference
    && basis == _other.basis
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(itemCodableConcept)
    hasher.combine(itemReference)
    hasher.combine(basis)
  }
}
