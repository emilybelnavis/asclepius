//
//  ContractTermAssetValuedItem.swift
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

/// Contract Valued Item List
open class ContractTermAssetValuedItem: BackboneElement {
  public enum EntityX: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  /// Contract Valued Item Type
  public var entityX: EntityX?
  
  /// Contract Valued Item Number
  public var identifier: Identifier?
  
  /// Contract Valued Item Effective Time
  public var effectiveTime: FHIRKitPrimitive<FHIRKitDateTime>?
  
  /// Count of Contract Valued Items
  public var quantity: Quantity?
  
  /// Contract Valued Item fee, charge, or cost
  public var unitPrice: Money?
  
  /// Contract Valued Item Price Scaling Factor
  public var factor: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// Contract Valued Item Difficulty Scaling Factor
  public var points: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// Total Contract Valued Item Value
  public var net: Money?
  
  /// Terms of valuation
  public var payment: FHIRKitPrimitive<FHIRKitString>?
  
  /// When payment is due
  public var paymentDate: FHIRKitPrimitive<FHIRKitDateTime>?
  
  /// Who is responsible for making payment(s)
  public var responsible: Reference?
  
  /// Who will be receiving the payment
  public var recipient: Reference?
  
  /// Pointer to specific item
  public var linkId: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// Security labels that define affected terms
  public var securityLabelNumber: [FHIRKitPrimitive<FHIRKitUnsignedInteger>]?
}
