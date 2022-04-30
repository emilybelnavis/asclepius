//
//  ClaimInsurance.swift
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
 Patient insurance informatoin. Financial instruments for reimbursement for the healthcare products and
 services specified on the claim.
 */
open class ClaimInsurance: BackboneElement {
  /// Insurance instance identifier
  public var sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// Coverage to be used for adjudication
  public var focal: FHIRKitPrimitive<FHIRKitBool>
  
  /// Pre-assigned claim number
  public var identifier: Identifier?
  
  /// Insurance information
  public var coverage: Reference
  
  /// Additional provider contract number
  public var businessArrangement: FHIRKitPrimitive<FHIRKitString>?
  
  /// Prior authorization reference number
  public var preAuthRef: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// Adjudication results
  public var claimResponse: Reference?
  
  public init(sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>, focal: FHIRKitPrimitive<FHIRKitBool>, coverage: Reference) {
    self.sequence = sequence
    self.focal = focal
    self.coverage = coverage
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>,
    focal: FHIRKitPrimitive<FHIRKitBool>,
    coverage: Reference,
    businessArrangement: FHIRKitPrimitive<FHIRKitString>? = nil,
    preAuthRef: [FHIRKitPrimitive<FHIRKitString>]? = nil,
    claimResponse: Reference? = nil
  ) {
    self.init(sequence: sequence, focal: focal, coverage: coverage)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.businessArrangement = businessArrangement
    self.preAuthRef = preAuthRef
    self.claimResponse = claimResponse
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case focal; case _focal
    case coverage
    case businessArrangement; case _businessArrangement
    case preAuthRef; case _preAuthRef
    case claimResponse
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.sequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.focal = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKey: .focal, auxKey: ._focal)
    self.coverage = try Reference(from: codingKeyContainer, forKey: .coverage)
    self.businessArrangement = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .businessArrangement, auxKey: ._businessArrangement)
    self.preAuthRef = try [FHIRKitPrimitive<FHIRKitString>](from: codingKeyContainer, forKeyIfPresent: .preAuthRef, auxKey: ._preAuthRef)
    self.claimResponse = try Reference(from: codingKeyContainer, forKeyIfPresent: .claimResponse)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try sequence.encode(on: &codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    try focal.encode(on: &codingKeyContainer, forKey: .focal, auxKey: ._focal)
    try coverage.encode(on: &codingKeyContainer, forKey: .coverage)
    try businessArrangement?.encode(on: &codingKeyContainer, forKey: .businessArrangement, auxKey: ._businessArrangement)
    try preAuthRef?.encode(on: &codingKeyContainer, forKey: .preAuthRef, auxKey: ._preAuthRef)
    try claimResponse?.encode(on: &codingKeyContainer, forKey: .claimResponse)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimInsurance else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return sequence == _other.sequence
    && focal == _other.focal
    && coverage == _other.coverage
    && businessArrangement == _other.businessArrangement
    && preAuthRef == _other.preAuthRef
    && claimResponse == _other.claimResponse
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(focal)
    hasher.combine(coverage)
    hasher.combine(businessArrangement)
    hasher.combine(preAuthRef)
    hasher.combine(claimResponse)
  }
}
