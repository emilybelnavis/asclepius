//
//  ContractTermAssetValuedItem.swift
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
