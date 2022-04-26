//
//  ClaimResponseInsurance.swift
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
 Patient insurance information - Financial instruments for the reimbursement for the healthcare products
 and services specified on the claim
 */
open class ClaimResponseInsurance: BackboneElement {
  /// Insurance instance identifier
  public var sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// Coverage to be used for adjudication
  public var focal: FHIRKitPrimitive<FHIRKitBool>
  
  /// Insurance information
  public var coverage: Reference
  
  /// Additional provider contract number
  public var businessArrangement: FHIRKitPrimitive<FHIRKitString>?
  
  /// Adjudication results
  public var claimResponse: Reference?
  
  public init(sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>, focal: FHIRKitPrimitive<FHIRKitBool>, coverage: Reference) {
    self.sequence = sequence
    self.focal = focal
    self.coverage = coverage
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>,
    focal: FHIRKitPrimitive<FHIRKitBool>,
    coverage: Reference,
    businessArrangement: FHIRKitPrimitive<FHIRKitString>? = nil,
    claimResponse: Reference? = nil
  ) {
    self.init(sequence: sequence, focal: focal, coverage: coverage)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.businessArrangement = businessArrangement
    self.claimResponse = claimResponse
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case focal; case _focal
    case coverage
    case businessArrangement; case _businessArrangement
    case claimResponse
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.sequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKey: .sequence, auxiliaryKey: ._sequence)
    self.focal = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKey: .focal, auxiliaryKey: ._focal)
    self.coverage = try Reference(from: _container, forKey: .coverage)
    self.businessArrangement = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKey: .businessArrangement, auxiliaryKey: ._businessArrangement)
    self.claimResponse = try Reference(from: _container, forKeyIfPresent: .claimResponse)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try sequence.encode(on: &_container, forKey: .sequence, auxiliaryKey: ._sequence)
    try focal.encode(on: &_container, forKey: .focal, auxiliaryKey: ._focal)
    try coverage.encode(on: &_container, forKey: .coverage)
    try businessArrangement?.encode(on: &_container, forKey: .businessArrangement, auxiliaryKey: ._businessArrangement)
    try claimResponse?.encode(on: &_container, forKey: .claimResponse)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseInsurance else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return sequence == _other.sequence
    && focal == _other.focal
    && coverage == _other.coverage
    && businessArrangement == _other.businessArrangement
    && claimResponse == _other.claimResponse
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(focal)
    hasher.combine(coverage)
    hasher.combine(businessArrangement)
    hasher.combine(claimResponse)
  }
}

