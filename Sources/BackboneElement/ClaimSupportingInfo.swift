//
//  ClaimSupportingInfo.swift
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
 Supporting information for a Claim. Additional information codes regarding exceptions, special considerations,
 the condition, situation, prior and/or concurrent issues
 */
open class ClaimSupportingInfo: BackboneElement {
  public enum _Timing: Hashable {
    case date(FHIRKitPrimitive<FHIRKitDate>)
    case period(Period)
  }
  
  public enum _Value: Hashable {
    case attachment(Attachment)
    case boolean(FHIRKitPrimitive<FHIRKitBool>)
    case quantity(Quantity)
    case reference(Reference)
    case string(FHIRKitPrimitive<FHIRKitString>)
  }
  
  /// Information instance identifier
  public var sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// Classification of the supplied information
  public var category: CodableConcept
  
  /// Type of information
  public var code: CodableConcept?
  
  /// When it occured
  public var timing: _Timing?
  
  /// Data to be provided
  public var value: _Value
  
  /// Explaination for the information
  public var reason: CodableConcept?
}
