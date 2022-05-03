//
//  ElementDefinitionBase.swift
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
 Base definition information for tools; Information about the base definition of the element, provided to make it
 unnecessary for tools to trace the deviation of the element through the derived and related profiles. When the
 element definition is not the original definitoin of an element (e.g. either in a constraint on another type, or for
 elements from a super type in a snapshot) then the information provided in the element definition may be
 different to the vase definition. On the original definition of the element, it will be the same
 */
open class ElementDefinitionBase: Element {
  /// Path that identifies the base element
  public var path: FHIRKitPrimitive<FHIRKitString>
  
  /// Min cardinality of the base element
  public var min: FHIRKitPrimitive<FHIRKitUnsignedInteger>
  
  /// Max cardinality of the base element
  public var max: FHIRKitPrimitive<FHIRKitString>
}
