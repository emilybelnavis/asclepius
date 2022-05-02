//
//  CoverageEligibilityRequestInsurance.swift
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
 Patient insurance information; Financial instruments for reimbursement for the healthcare products and services
 */
open class CoverageEligiblityRequestInsurance: BackboneElement {
  /// Applicable coverage
  public var focal: FHIRKitPrimitive<FHIRKitBool>?
  
  /// Insurance information
  public var coverage: Reference
  
  /// Additional provider contract number
  public var businessArrangement: FHIRKitPrimitive<FHIRKitString>?
  
  public init(coverage: Reference) {
    self.coverage = coverage
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    focal: FHIRKitPrimitive<FHIRKitBool>? = nil,
    coverage: Reference,
    buisnessArrangement: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init(coverage: coverage)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.focal = focal
    self.businessArrangement = businessArrangement
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case focal; case _focal
    case coverage
    case businessArangement; case _businessArrangement
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.focal = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .focal, auxKey: ._focal)
    self.coverage = try Reference(from: codingKeyContainer, forKey: .coverage)
    self.businessArrangement = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .businessArangement, auxKey: ._businessArrangement)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try focal?.encode(on: &codingKeyContainer, forKey: .focal, auxKey: ._focal)
    try coverage.encode(on: &codingKeyContainer, forKey: .coverage)
    try businessArrangement?.encode(on: &codingKeyContainer, forKey: .businessArangement, auxKey: ._businessArrangement)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CoverageEligiblityRequestInsurance else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return focal == _other.focal
    && coverage == _other.coverage
    && businessArrangement == _other.businessArrangement
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(focal)
    hasher.combine(coverage)
    hasher.combine(businessArrangement)
  }
}
