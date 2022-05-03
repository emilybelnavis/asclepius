//
//  ClaimResponseItemDetail.swift
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
 Adjudication for claim details;  A claim detail containing either a simple item (a product or service) or a "group"
 of sub-details which are simple items
 */
open class ClaimResponseItemDetail: BackboneElement {
  /// Claim detail instance identifier
  public var detailSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// Applicable note numbers
  public var noteNumber: [FHIRKitPrimitive<FHIRKitPositiveInteger>]?
  
  /// Detail level adjudication details
  public var adjudication: [ClaimResponseItemAdjudication]
  
  /// Adjudication for claim sub-details
  public var subDetail: [ClaimResponseItemDetailSubDetail]?
  
  public init(detailSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>, adjudication: [ClaimResponseItemAdjudication]) {
    self.detailSequence = detailSequence
    self.adjudication = adjudication
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    detailSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>,
    noteNumber: [FHIRKitPrimitive<FHIRKitPositiveInteger>]? = nil,
    adjudication: [ClaimResponseItemAdjudication],
    subDetail: [ClaimResponseItemDetailSubDetail]? = nil
  ) {
    self.init(detailSequence: detailSequence, adjudication: adjudication)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.detailSequence = detailSequence
    self.noteNumber = noteNumber
    self.adjudication = adjudication
    self.subDetail = subDetail
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case detailSequence; case _detailSequence
    case noteNumber; case _noteNumber
    case adjudication
    case subDetail
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.detailSequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: codingKeyContainer, forKey: .detailSequence, auxKey: ._detailSequence)
    self.noteNumber = try [FHIRKitPrimitive<FHIRKitPositiveInteger>](from: codingKeyContainer, forKeyIfPresent: .noteNumber, auxKey: ._noteNumber)
    self.adjudication = try [ClaimResponseItemAdjudication](from: codingKeyContainer, forKey: .adjudication)
    self.subDetail = try [ClaimResponseItemDetailSubDetail](from: codingKeyContainer, forKeyIfPresent: .subDetail)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try detailSequence.encode(on: &codingKeyContainer, forKey: .detailSequence, auxKey: ._detailSequence)
    try noteNumber?.encode(on: &codingKeyContainer, forKey: .noteNumber, auxKey: ._noteNumber)
    try adjudication.encode(on: &codingKeyContainer, forKey: .adjudication)
    try subDetail?.encode(on: &codingKeyContainer, forKey: .subDetail)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseItemDetail else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return detailSequence == _other.detailSequence
    && noteNumber == _other.noteNumber
    && adjudication == _other.adjudication
    && subDetail == _other.subDetail
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(detailSequence)
    hasher.combine(noteNumber)
    hasher.combine(adjudication)
    hasher.combine(subDetail)
  }
}
