//
//  CodeSystemHierarchyMeaning.swift
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
 The meaning of the hierarchy of concepts in a code system.
 
 URL: http://hl7.org/fhir/codesystem-hierarchy-meaning
 ValueSet: http://hl7.org/fhir/ValueSet/codesystem-hierarchy-meaning
 */
public enum CodeSystemHierarchyMeaning: String, FHIRKitPrimitiveType {
  /// No particular relationship between the concepts can be assumed, except what can be determined by
  /// inspection of the definitions of the elements (possible reasons to use this: importing from a source
  /// where this is not defined or where various parts of the hierarchy have different meanings).
  case groupedBy = "grouped-by"
  
  /// A hierarchy where the child concepts have an `is-a` relationship with the parents - that is, all the
  /// properties of the parent are also try for its child concept. Not that `is-a` is a property of the
  /// concepts, so additional subsumption relationships may be defined using properties or the
  /// [subsumes](extension-codesystem-subsumes.html) extension.
  case isA = "is-a"
  
  /// Child elements list the individual parts of a coposite whole (e.g. body site)
  case partOf = "part-of"
  
  /// Child concepts in the hierarchy may only have one parent and there is a presumption that the code
  /// system is a "closed world" meaning all things must be in the hierarch. This results in comcepts such as
  /// "not otherwise classified."
  case classifiedWith = "classified-with"
}
