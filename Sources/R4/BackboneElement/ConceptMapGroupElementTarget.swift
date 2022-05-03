//
//  ConceptMapGroupElementTarget.swift
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

/// A concept from the target value set that this concept maps to
open class ConceptMapGroupElementTarget: BackboneElement {
  /// Code that identifies the target element
  public var code: FHIRKitPrimitive<FHIRKitString>?
  
  /// Display for the code
  public var display: FHIRKitPrimtive<FHIRKitString>?
  
  /// The equivalence between the source and target concepts (counting for the dependencies and products).
  /// The equivalence is read from target to source (e.g. the target is "wider" than the "source".)
  public var equivalence: FHIRKitPrimitive<ConceptMapEquivalence>
  
  /// Description of status/issues in mapping
  public var comment: FHIRKitPrimitive<FHIRKitString>?
  
  /// Other elements required for this mapping (from context)
  public var dependsOn: [ConceptMapGroupElementTargetDependsOn]?
  
  /// Other concepts that this mapping produces
  public var product: [ConceptMapGroupElementTargetDependsOn]?
}
