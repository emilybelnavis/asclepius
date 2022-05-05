//
//  AccountGuarantor.swift
//  FHIRKit
//  Module: R4
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import FHIRKitCore

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
