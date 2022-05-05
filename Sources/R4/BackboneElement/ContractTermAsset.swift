//
//  ContractTermAsset.swift
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

/// Contract Term Asset List
open class ContractTermAsset: BackboneElement {
  /// Range of asset
  public var scope: CodableConcept?
  
  /// Asset category
  public var type: [CodableConcept]?
  
  /// Associated entities
  public var typeReference: [Reference]?
  
  /// Asset sub-category
  public var subType: [CodableConcept]?
  
  /// Relationship of the asset
  public var relationship: Coding?
  
  /// Circumstances of the asset
  public var context: [ContractTermAssetContext]?
  
  /// Quality description of the asset
  public var condition: FHIRKitPrimitive<FHIRKitString>?
  
  /// Asset availability types
  public var periodType: [CodableConcept]?
  
  /// Time period of the asset
  public var period: [Period]?
  
  /// Time period
  public var usePeriod: [Period]?
  
  /// Asset clause or question text
  public var text: FHIRKitPrimitive<FHIRKitString>?
  
  /// Pointer to asset text
  public var linkId: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// Response to assets
  public var answer: [ContractTermOfferAnswer]?
  
  /// Asset restriction numbers
  public var securityLabelNumber: [FHIRKitPrimitive<FHIRKitUnsignedInteger>]?
  
  /// Contract Valued Item List
  public var valuedItem: [ContractTermAssetValuedItem]?
  
}
