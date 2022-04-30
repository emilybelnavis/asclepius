//
//  XPathUsageType.swift
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
 How a search parameter relates to the set of elements returned by evaluating its xpath query
 
 URL: http://hl7.org/fhir/search-xpath-usage
 ValueSet: http://hl7.org/fhir/ValueSet/search-xpath-usage
 */
public enum XPathUsageType: String, FHIRKitPrimitiveType {
  /// The search parameter is derived directly from the selected nodes based on the
  /// type definitions
  case normal
  
  /// The search parameter is derived by a phonetic transformation from the selected nodes
  case phonetic
  
  /// The search parameter is based on a spatial transform of the selected nodes
  case nearby
  
  /// The search parameter is based on a spatial transform of the selected nodes, using
  /// physical distance from the middle
  case distance
  
  /// The interpretation of the xpath statement is unknown and cannot be automated
  case other
}
