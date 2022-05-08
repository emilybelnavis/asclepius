//
//  ContractSigner.swift
//  AlexandriaHRM
//  Module: STU3
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

import AlexandriaHRMCore

/**
 Contract Signer - Parties with legal standing in the `Contract`, including the principal parties, the grantor(s)
 and grantee(s), which are any person or organization bound by the contract and any ancillary parties which
 facilitate the execution of the contract such as a notary or witness
 */
open class ContractSigner: BackboneElement {
  /// Contract signatory role
  public var type: Coding
  
  /// Contract signatory party
  public var party: Reference
  
  /// Contract documentation signature
  public var signature: [Signature]
  
  public init(type: Coding, party: Reference, signature: [Signature]) {
    self.type = type
    self.party = party
    self.signature = signature
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    type: Coding,
    party: Reference,
    signature: [Signature]
  ) {
    self.init(type: type, party: party, signature: signature)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type
    case party
    case signature
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try Coding(from: codingKeyContainer, forKey: .type)
    self.party = try Reference(from: codingKeyContainer, forKey: .party)
    self.signature = try [Signature](from: codingKeyContainer, forKey: .signature)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &codingKeyContainer, forKey: .type)
    try party.encode(on: &codingKeyContainer, forKey: .party)
    try signature.encode(on: &codingKeyContainer, forKey: .signature)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContractSigner else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && party == _other.party
    && signature == _other.signature
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(party)
    hasher.combine(signature)
  }
}
