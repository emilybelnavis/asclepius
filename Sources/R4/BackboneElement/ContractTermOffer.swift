//
//  ContractTermOffer.swift
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

/// Context of the Contract Term - The matter of concern in this the context of this provision of the agreement
open class ContractTermOffer: BackboneElement {
  /// Offer business id
  public var identifier: [Identifier]?
  
  /// Offer recipient
  public var party: [ContractTermOfferParty]?
  
  /// Negotiable offer asset
  public var topic: Reference?
  
  /// Contract offer type or form
  public var type: CodableConcept?
  
  /// Accepting party choice
  public var decision: CodableConcept?
  
  /// How decision is conveyed
  public var decisionMode: [CodableConcept]?
  
  /// Response to offer text
  public var answer: [ContractTermOfferAnswer]?
  
  /// Human readable offer text
  public var text: FHIRKitPrimitive<FHIRKitString>?
  
  /// Pointer to offer text
  public var linkId: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// Offer security restriction numbers
  public var securityLabelNumber: [FHIRKitPrimitive<FHIRKitUnsignedInteger>]?
}
