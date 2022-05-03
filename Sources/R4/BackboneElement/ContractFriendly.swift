//
//  ContractFriendly.swift
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
 Contract friendly language - The "patient friendly language" version of the `Contract` in whole or in parts.
 "Patient friendly language" means that the representation of the `Contract` and `Contract Provisions`
 in a manner that is readily accessible and understandable by a layperson in accordance with best practices for
 communication styles that ensure that those agreeing to or signing the `Contract` understand the roles,
 actions, obligations, responsibilities, and implication(s) of the agreement.
 */
open class ContractFriendly: BackboneElement {
  public enum ContentX: Hashable {
    case attachment(Attachement)
    case reference(Reference)
  }
  
  /// Easily comprehended representation of this Contract
  public var contentX: ContentX
}
