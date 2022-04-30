//
//  ConceptMapGroupUnmapped.swift
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
 What to do when there is no mapping for the source concept. "Unmapped" does not include codes that are
 unmached, and the unmapped element is ignored in a code is specified to have equivalence = unmatched
 */
open class ConceptMapGroupUnmapped: BackboneElement {
  /**
   Defines which action to take if there is no match for the source concept in the target system designated
   for the group. One of three actions are possible: Use the unmapped code (this is useful when doing a
   mapping between version and only a few codes have changed), use a fixed code (a default code), or
   alternatively, a reference to a different concept map can be provided (by canonical URL)
   */
  public var mode: FHIRKitPrimitive<ConceptMapGroupUnmappedMode>
  
  /// Fixed code when mode = fixed
  public var code: FHIRKitPrimitive<FHIRKitString>?
  
  /// Display for the code
  public var display: FHIRKitPrimitive<FHIRKitString>?
  
  
  /// Canonical reference to an additional ConceptMap to use for mapping if the source concept is unmapped
  public var url: FHIRKitPrimitive<Canonical>?
}
