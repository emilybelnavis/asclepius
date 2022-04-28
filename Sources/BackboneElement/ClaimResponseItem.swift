//
//  ClaimResponseItem.swift
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
 Adudication for claim line items; A claim line containing either a simple item (a product or service) or a "group"
 of details which can also be either simple items or groups of sub-details
 */
open class ClaimResponseItem: BackboneElement {
  /// Claim item instance identifier
  public var itemSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// Applicable note numbers
  public var noteNumber: [FHIRKitPrimitive<FHIRKitPositiveInteger>]?
  
  /// Adjudication details
  public var adjudication: [ClaimResponseItemAdjudication]
  
  /// Adjudication for claim details
  public var detail: [ClaimResponseItemDetail]?
  
  public init(itemSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>, adjudication: [ClaimResponseItemAdjudication]) {
    self.itemSequence = itemSequence
    self.adjudication = adjudication
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    itemSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>,
    noteNumber: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    adjudication: [ClaimResponseItemAdjudication],
    detail: [ClaimResponseItemDetail]? = nil
  ) {
    self.init(itemSequence: itemSequence, adjudication: adjudication)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.noteNumber = noteNumber
    self.detail = detail
  }

  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case itemSequence; case _itemSequence
    case noteNumber; case _noteNumber
    case adjudication
    case detail
  }

  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)

    self.itemSequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKey: .itemSequence, auxiliaryKey: ._itemSequence)
    self.noteNumber = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: _container, forKeyIfPresent: .noteNumber, auxiliaryKey: ._noteNumber)
    self.adjudication = try [ClaimResponseItemAdjudication](from: _container, forKey: .adjudication)
    self.detail = try [ClaimResponseItemDetail](from: _container, forKeyIfPresent: .detail)
    
    try super.init(from: decoder)
  }
 
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try itemSequence.encode(on: &_container, forKey: .itemSequence, auxiliaryKey: ._itemSequence)
    try noteNumber?.encode(on: &_container, forKey: .noteNumber, auxiliaryKey: ._noteNumber)
    try adjudication.encode(on: &_container, forKey: .adjudication)
    try detail?.encode(on: &_container, forKey: .detail)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseItem else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return itemSequence == _other.itemSequence
    && noteNumber == _other.noteNumber
    && adjudication == _other.adjudication
    && detail == _other.detail
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(itemSequence)
    hasher.combine(noteNumber)
    hasher.combine(adjudication)
    hasher.combine(detail)
  }
}

