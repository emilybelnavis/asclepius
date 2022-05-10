//
//  CatalogEntryRelatedEntry.swift
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
 An item that this catalog entry is related to. Used for example to point to a substance or a device used to
 administer a medication
 */
open class CatalogEntryRelatedEntry: BackboneElement {
  /// The type of relation to the related item: e.g. `child`, `parent`, `packageContent`,
  /// `containerPackage`, `usedIn`, `uses`, `requires`, etc...
  public var relationType: AsclepiusPrimitive<CatalogEntryRelationType>
  
  /// The reference to the related item
  public var item: Reference
  
  public init(relationType: AsclepiusPrimitive<CatalogEntryRelationType>, item: Reference) {
    self.relationType = relationType
    self.item = item
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    relationType: AsclepiusPrimitive<CatalogEntryRelationType>,
    item: Reference
  ) {
    self.init(relationType: relationType, item: item)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case relationType; case _relationType
    case item
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.relationType = try AsclepiusPrimitive<CatalogEntryRelationType>(from: codingKeyContainer, forKey: .relationType, auxKey: ._relationType)
    self.item = try Reference(from: codingKeyContainer, forKey: .item)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try relationType.encode(on: &codingKeyContainer, forKey: .relationType, auxKey: ._relationType)
    try item.encode(on: &codingKeyContainer, forKey: .item)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CatalogEntryRelatedEntry else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return relationType == _other.relationType
    && item == _other.item
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(relationType)
    hasher.combine(item)
  }
}
