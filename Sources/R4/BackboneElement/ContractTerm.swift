//
//  ContractTerm.swift
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

/// Contract Term List - One or more `Contract Provisions`, which may be related and conveyed as a
/// group, and may contain nested groups
open class ContractTerm: BackboneElement {
  public enum TopicX: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  /// Contract Term Number
  public var identifier: Identifier?
  
  /// Contract Term Issue Date/Time
  public var issued: FHIRKitPrimitive<FHIRKitDateTime>?
  
  /// Contract Term Effective Period
  public var applies: Period?
  
  /// Term Concern
  public var topicX: TopicX?
  
  /// Contract Term Type or Form
  public var type: CodableConcept?
  
  /// Contract Term Type specific classification
  public var subType: CodableConcept?
  
  /// Term statement
  public var text: FHIRKitPrimitive<FHIRKitString>?
  
  /// Protection for the term
  public var securityLabel: [ContractTermSecurityLabel]?
  
  /// Context of the Contract term
  public var offer: ContractTermOffer
  
  /// Contract Term Asset List
  public var asset: [ContractTermAsset]?
  
  /// Entity being ascribed responsibility
  public var action: [ContractTermAction]?
  
  /// Nested Contract Term Group
  public var group: [ContractTerm]?
    
}
