//
//  ClaimResponseItemDetailSubDetail.swift
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
 Adjudication for claim sub-details; A sub-detail adjudication of a simple product or service
 */
open class ClaimResponseItemDetailSubDetail: BackboneElement {
  /// Claim sub-detail instance identifier
  public var subDetailSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// Applicable note numbers
  public var noteNumber: [FHIRKitPrimitive<FHIRKitPositiveInteger>]?
  
  /// Subdetaul level adjudication details
  public var adjudication: [ClaimResponseItemAdjudication]?
  
  public init(subDetailSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>) {
    self.subDetailSequence = subDetailSequence
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    subDetailSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>,
    noteNumber: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    adjudication: [ClaimResponseItemAdjudication]? = nil
  ) {
    self.init(subDetailSequence: subDetailSequence)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.noteNumber = noteNumber
    self.adjudication = adjudication
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case subDetailSequence; case _subDetailSequence
    case noteNumber; case _noteNumber
    case adjudication
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.subDetailSequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKey: .subDetailSequence, auxiliaryKey: ._subDetailSequence)
    self.noteNumber = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: _container, forKeyIfPresent: .noteNumber, auxiliaryKey: ._noteNumber)
    self.adjudication = try [ClaimResponseItemAdjudication](from: _container, forKeyIfPresent: .adjudication)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try subDetailSequence.encode(on: &_container, forKey: .subDetailSequence, auxiliaryKey: ._subDetailSequence)
    try noteNumber?.encode(on: &_container, forKey: .noteNumber, auxiliaryKey: ._noteNumber)
    try adjudication?.encode(on: &_container, forKey: .adjudication)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseItemDetailSubDetail else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return subDetailSequence == _other.subDetailSequence
    && noteNumber == _other.noteNumber
    && adjudication == _other.adjudication
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(subDetailSequence)
    hasher.combine(noteNumber)
    hasher.combine(adjudication)
  }
}
