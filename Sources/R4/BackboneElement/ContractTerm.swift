//
//  ContractTerm.swift
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
