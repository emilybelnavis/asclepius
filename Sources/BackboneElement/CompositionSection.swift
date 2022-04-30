//
//  CompositionSection.swift
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

/// Composition is broken into sections - The root of the sections that make up the composition
open class CompositionSection: BackboneElement {
  /// Label for section (e.g. for ToC)
  public var title: FHIRKitPrimitive<FHIRKitString>?
  
  /// Classification of section
  public var code: CodableConcept?
  
  /// Who and/or what authored the section
  public var author: [Reference]?
  
  /// Who and/or what the section is about
  public var focus: Reference?
  
  /// Text summary of the section for human interpretation
  public var text: Narrative?
  
  /// How the entry list was prepared - wheter it is a working list that is suitable for being maintained
  /// on an ongoing basis or if it represents a snapshot of a list of items from another source, or
  /// whether it is a prepared list where items may be marked as added, modified, or deleted
  public var mode: FHIRKitPrimitive<ListMode>?
  
  /// Order of section entries
  public var orderedBy: CodableConcept?
  
  /// A reference to data that supports this section
  public var entry: [Reference]?
  
  /// Why the section is empty
  public var emptyReason: CodableConcept?
  
  /// Nested section
  public var section: [CompositionSection]?
}
