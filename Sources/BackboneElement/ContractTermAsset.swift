//
//  ContractTermAsset.swift
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
