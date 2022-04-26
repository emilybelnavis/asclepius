//
//  ClaimResponseError.swift
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
 Processing Errors - Errors encountered during the processing of the adjudication
 */
open class ClaimResponseError: BackboneElement {
  /// Item sequence number
  public var itemSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>?
  
  /// Detail sequence number
  public var detailSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>?
  
  /// Subdetail sequence number
  public var subDetailSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>?
  
  /// Error code detailing processing issues
  public var code: CodableConcept
  
  public init(code: CodableConcept) {
    self.code = code
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    itemSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>? = nil,
    detailSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>? = nil,
    subDetailSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>? = nil,
    code: CodableConcept
  ) {
    self.init(code: code)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.itemSequence = itemSequence
    self.detailSequence = detailSequence
    self.subDetailSequence = subDetailSequence
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case itemSequence; case _itemSequence
    case detailSequence; case _detailSequence
    case subDetailSequence; case _subDetailSequence
    case code
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.itemSequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKeyIfPresent: .itemSequence, auxiliaryKey: .itemSequence)
    self.detailSequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKeyIfPresent: .detailSequence, auxiliaryKey: ._detailSequence)
    self.subDetailSequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKeyIfPresent: .subDetailSequence, auxiliaryKey: ._subDetailSequence)
    self.code = try CodableConcept(from: _container, forKey: .code)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try itemSequence?.encode(on: &_container, forKey: .itemSequence, auxiliaryKey: ._itemSequence)
    try detailSequence?.encode(on: &_container, forKey: .detailSequence, auxiliaryKey: ._detailSequence)
    try subDetailSequence?.encode(on: &_container, forKey: .subDetailSequence, auxiliaryKey: ._subDetailSequence)
    try code.encode(on: &_container, forKey: .code)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseError else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return itemSequence == _other.itemSequence
    && detailSequence == _other.detailSequence
    && subDetailSequence == _other.subDetailSequence
    && code == _other.code
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(itemSequence)
    hasher.combine(detailSequence)
    hasher.combine(subDetailSequence)
    hasher.combine(code)
  }
}
