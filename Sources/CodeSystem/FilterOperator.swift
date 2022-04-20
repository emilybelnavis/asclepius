//
//  FilterOperator.swift
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
 The kind of operation to perform as a part of a property based filter.
 
 URL: http://hl7.org/fhir/filter-operator
 ValueSet: http://hl7.org/fhir/ValueSet/filter-operator
 */
public enum FilterOperator: String, FHIRKitPrimitiveType {
  /// The specified property of the code equals the provided value.
  case equal = "="
  
  /// Includes all concept ids that have a transitive is-a relationship with the concept Id provided as the value,
  /// including the provided concept itself (include descendant codes and self).
  case isA = "is-a"
  
  /// Includes all concept ids that have a transitive is-a relationship with the concept Id provided as the value,
  /// excluding the provided concept itself i.e. include descendant codes only).
  case descendentOf = "descendent-of"
  
  /// The specified property of the code does not have an is-a relationship with the provided value.
  case isNotA = "is-not-a"
  
  /// The specified property of the code  matches the regex specified in the provided value.
  case regex
  
  /// The specified property of the code is in the set of codes or concepts specified in the provided value (comma
  /// separated list).
  case `in`
  
  /// The specified property of the code is not in the set of codes or concepts specified in the provided value (comma
  /// separated list).
  case notIn = "not-in"

  /// Includes all concept ids that have a transitive is-a relationship from the concept Id provided as the value,
  /// including the provided concept itself (i.e. include ancestor codes and self).
  case generalizes
  
  /// The specified property of the code has at least one value (if the specified value is true; if the specified
  /// value is false, then matches when the specified property of the code has no values).
  case exists
}
