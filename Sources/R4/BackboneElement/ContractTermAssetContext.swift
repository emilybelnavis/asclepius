//
//  ContractTermAssetContext.swift
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

/// Circumstance of the asset
open class ContractTermAssetContext: BackboneElement {
  /// Creator, custodian, or owner
  public var reference: Reference?
  
  /// Codable asset context
  public var code: [CodableConcept]?
  
  /// Context description
  public var text: FHIRKitPrimitive<FHIRKitString>?
  
  override public init() {
    super.init(
    )
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    reference: Reference? = nil,
    code: [CodableConcept]? = nil,
    text: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.reference = reference
    self.code = code
    self.text = text
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case reference
    case code
    case text; case _text
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.reference = try Reference(from: codingKeyContainer, forKeyIfPresent: .reference)
    self.code = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .code)
    self.text = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .text, auxKey: ._text)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try reference?.encode(on: &codingKeyContainer, forKey: .reference)
    try code?.encode(on: &codingKeyContainer, forKey: .code)
    try text?.encode(on: &codingKeyContainer, forKey: .text, auxKey: ._text)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContractTermAssetContext else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return reference == _other.reference
    && code == _other.code
    && text == _other.text
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(reference)
    hasher.combine(code)
    hasher.combine(text)
  }
}
