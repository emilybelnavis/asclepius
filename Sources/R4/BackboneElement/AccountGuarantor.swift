//
//  AccountGuarantor.swift
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
 The parties responsible for balancing the account if other payment options fall short
 */
open class AccountGuarantor: BackboneElement {
  /// Responsible entity
  public var party: Reference
  
  /// Credit or other hold applied
  public var onHold: FHIRKitPrimitive<FHIRKitBool>?
  
  /// Guarantee account during
  public var period: Period?
  
  public init(party: Reference) {
    self.party = party
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    party: Reference,
    onHold: FHIRKitPrimitive<FHIRKitBool>? = nil,
    period: Period? = nil
  ) {
    self.init(party: party)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.onHold = onHold
    self.period = period
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case party
    case onHold; case _onHold
    case period
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.party = try Reference(from: codingKeyContainer, forKey: .party)
    self.onHold = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .onHold, auxKey: ._onHold)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try party.encode(on: &codingKeyContainer, forKey: .party)
    try onHold?.encode(on: &codingKeyContainer, forKey: .onHold, auxKey: ._onHold)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? AccountGuarantor else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return party == _other.party
    && onHold == _other.onHold
    && period == _other.period
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super .hash(into: &hasher)
    hasher.combine(party)
    hasher.combine(onHold)
    hasher.combine(period)
  }
}
