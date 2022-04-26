//
//  ClaimResponseItem.swift
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

/**
 Adudication for claim line items; A claim line containing either a simple item (a product or service) or a "group"
 of details which can also be either simple items or groups of sub-details
 */
open class ClaimResponseItem: BackboneElement {
  /// Claim item instance identifier
  public var itemSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// Applicable note numbers
  public var noteNumber: [FHIRKitPrimitive<FHIRKitPositiveInteger>]?
  
  /// Adjudication details
  public var adjudication: [ClaimResponseItemAdjudication]
  
  /// Adjudication for claim details
  public var detail: [ClaimResponseItemDetail]?
  
  public init(itemSequence: FHIRKitPrimitive<FHIRKitPositiveInteger>, adjudication: [ClaimResponseItemAdjudication]) {
    self.itemSequence = itemSequence
    self.adjudication = adjudication
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    `
  ) {
    
  }
}
