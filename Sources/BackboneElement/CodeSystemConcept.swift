//
//  CodeSystemConcept.swift
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
 Concepts that are in the code system. The concept definitions are inherently hierarchical, but the definitions
 must be consulted to determine what the meanings of the hierarchical relationships are
 */
open class CodeSystemConcept: BackboneElement {
  /// Code that identifies concept
  public var code: FHIRKitPrimitive<FHIRKitString>
  
  /// Text to display to the user
  public var display: FHIRKitPrimitive<FHIRKitString>?
  
  /// Formal definition
  public var definition: FHIRKitPrimitive<FHIRKitString>?
  
  /// Additional representations for the concept
  public var designation: [CodeSystemConceptDesignation]?
  
  /// Property value for the concept
  public var property: [CodeSystemConceptProperty]?
  
  /// Child Concepts (`is-a`, `contains`, `categorizes`)
  public var concept: [CodeSystemConcept]?
}
