//
//  SpecialValues.swift
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
 A set of generally useful codes defined so they can be included in value sets.
 
 URL: http://terminology.hl7.org/CodeSystem/special-values
 ValueSet: http://hl7.org/fhir/ValueSet/special-values
 */
public enum SpecialValues: String, FHIRKitPrimitiveType {
  /// Boolean true.
  case `true`
  
  /// Boolean false.
  case `false`
  
  /// The content is greater than zero, but too small to be quantified.
  case trace
  
  /// The specific quantity is not known, but is known to be non-zero and is not specified because it makes up the
  /// bulk of the material.
  case sufficient
  
  /// The value is no longer available.
  case withdrawn
  
  /// The are no known applicable values in this context.
  case nilKnown = "nil-known"
}
