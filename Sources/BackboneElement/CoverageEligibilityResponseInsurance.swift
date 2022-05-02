//
//  CoverageEligibilityResponseInsurance.swift
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
open class CoverageEligibilityResponseInsurance: BackboneElement {
  /// Insurance information
  public var coverage: Reference
  
  /// Coverage inforce indicator
  public var inForce: FHIRKitPrimitive<FHIRKitBool>?
  
  /// When the benefits are applicable
  public var benefitPeriod: Period?
  
  /// Benefits and authorization details
  public var item: [CoverageEligibilityResponseInsuranceItem]?
  
  public init(coverage: Reference) {
    self.coverage = coverage
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    coverage: Reference,
    inForce: FHIRKitPrimitive<FHIRKitBool>? = nil,
    benefitPeriod: Period? = nil,
    item: [CoverageEligiblityResponseInsuraceItem]? = nil
  ) {
    self.init(coverage: coverage)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.inForce = inForce
    self.benefitPeriod = benefitPeriod
    self.item = item
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case coverage
    case inForce; case _inForce
    case benefitPeriod
    case item
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.coverage = try Reference(from: codingKeyContainer, forKey: .coverage)
    self.inForce = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .inForce, auxKey: ._inForce)
    self.benefitPeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .benefitPeriod)
    self.item = try [CoverageEligibilityResponseInsuranceItem](from: codingKeyContainer, forKeyIfPresent: .item)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try coverage.encode(on: &codingKeyContainer, forKey: .coverage)
    try inForce?.encode(on: &codingKeyContainer, forKey: .inForce, auxKey: ._inForce)
    try benefitPeriod?.encode(on: &codingKeyContainer, forKey: .benefitPeriod)
    try item?.encode(on: &codingKeyContainer, forKey: .item)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CoverageEligibilityResponseInsurance else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return coverage == _other.coverage
    && inForce == _other.inForce
    && benefitPeriod == _other.benefitPeriod
    && item == _other.item
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(coverage)
    hasher.combine(inForce)
    hasher.combine(benefitPeriod)
    hasher.combine(item)
  }
}
