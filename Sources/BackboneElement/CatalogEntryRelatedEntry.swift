//
//  CatalogEntryRelatedEntry.swift
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
 An item that this catalog entry is related to. Used for example to point to a substance or a device used to
 administer a medication
 */
open class CatalogEntryRelatedEntry: BackboneElement {
  /// The type of relation to the related item: e.g. `child`, `parent`, `packageContent`,
  /// `containerPackage`, `usedIn`, `uses`, `requires`, etc...
  public var relationType: FHIRKitPrimitive<CatalogEntryRelationType>
  
  /// The reference to the related item
  public var item: Reference
  
  public init(relationType: FHIRKitPrimitive<CatalogEntryRelationType>, item: Reference) {
    self.relationType = relationType
    self.item = item
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    relationType: FHIRKitPrimitive<CatalogEntryRelationType>,
    item: Reference
  ) {
    self.init(relationType: relationType, item: item)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case relationType; case _relationType
    case item
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.relationType = try FHIRKitPrimitive<CatalogEntryRelationType>(from: _container, forKey: .relationType, auxiliaryKey: ._relationType)
    self.item = try Reference(from: _container, forKey: .item)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try relationType.encode(on: &_container, forKey: .relationType, auxiliaryKey: ._relationType)
    try item.encode(on: &_container, forKey: .item)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(relationType)
    hasher.combine(item)
  }
}
