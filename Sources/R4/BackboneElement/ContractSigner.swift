//
//  ContractSigner.swift
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
}
