//
//  ElementDefinitionConstraint.swif
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
 Condition that must evaluate to `true` - Formal constraints such as co-occurence and other constraints
 that can be computationally evaluated within the context of the instance.
 */
open class ElementDefinitionContstraint: Element {
  /// Target of `condition` reference
  public var key:FHIRKitPrimitive<FHIRKitString>
  
  /// Why this constraint is necessary or appropriate
  public var requirements: FHIRKitPrimitive<FHIRKitString>?
  
  /// Identifies the impact constraint violation has on the conformance of the instance.
  public var severity: FHIRKitPrimitive<ConstraintSeverity>
  
  /// Human readable description of the constraint
  public var human: FHIRKitPrimitive<FHIRKitString>
  
  /// FHIRPath expression of the constraint
  public var expression: FHIRKitPrimitive<FHIRKitString>?
  
  /// XPath expression of the constraint
  public var xpath: FHIRKitPrimitive<FHIRKitString>?
  
  /// Reference to the original source of the constraint
  public var source: FHIRKitPrimitive<Canonical>?
  
}
