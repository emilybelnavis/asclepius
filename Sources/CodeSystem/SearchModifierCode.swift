//
//  SearchModifierCode.swift
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
 A supported modifier for a search parameter.
 
 URL: http://hl7.org/fhir/search-modifier-code
 ValueSet: http://hl7.org/fhir/ValueSet/search-modifier-code
 */
public enum SearchModifierCode: String, FHIRKitPrimitiveType {
  /// The search parameter returns resources that have a value or not.
  case missing
  
  /// The search parameter returns resources that have a value that exactly matches the supplied parameter (the whole
  /// string, including casing and accents).
  case exact
  
  /// The search parameter returns resources that include the supplied parameter value anywhere within the field being
  /// searched.
  case contains
  
  /// The search parameter returns resources that do not contain a match.
  case not
  
  /// The search parameter is processed as a string that searches text associated with the code/value - either
  /// CodeableConcept.text, Coding.display, or Identifier.type.text.
  case text
  
  /// The search parameter is a URI (relative or absolute) that identifies a value set, and the search parameter tests
  /// whether the coding is in the specified value set.
  case `in`
  
  /// The search parameter is a URI (relative or absolute) that identifies a value set, and the search parameter tests
  /// whether the coding is not in the specified value set.
  case notIn = "not-in"
  
  /// The search parameter tests whether the value in a resource is subsumed by the specified value (is-a, or
  /// hierarchical relationships).
  case below
  
  /// The search parameter tests whether the value in a resource subsumes the specified value (is-a, or hierarchical
  /// relationships).
  case above
  
  /// The search parameter only applies to the Resource Type specified as a modifier (e.g. the modifier is not
  /// actually :type, but :Patient etc.).
  case type
  
  /// The search parameter applies to the identifier on the resource, not the reference.
  case identifier
  
  /// The search parameter has the format system|code|value, where the system and code refer to an
  /// Identifier.type.coding.system and .code, and match if any of the type codes match. All 3 parts must be present.
  case ofType
}
