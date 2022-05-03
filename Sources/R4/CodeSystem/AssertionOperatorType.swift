//
//  AssertionOperatorType.swift
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
 The type of operator to use for assertion.
 
 URL: http://hl7.org/fhir/assert-operator-codes
 ValueSet: http://hl7.org/fhir/ValueSet/assert-operator-codes
 */
public enum AssertionOperatorType: String, FHIRKitPrimitiveType {
  /// Default value. Equals comparison
  case equals
  
  /// Not equals comparison
  case notEquals
  
  /// Compare value within a known set of values
  case `in`
  
  /// Compare value not within a known set of values
  case notIn
  
  /// Compare value to be greater than a known value
  case greaterThan
  
  /// Compare value to be less than a known value
  case lessThan
  
  /// Compare value is empty
  case empty
  
  /// Compare value is not empty
  case notEmpty
  
  /// Compare value string contains a known value
  case contains
  
  /// Compare value string does not contain a known value
  case notContains
  
  /// Evaluiate the FHIRKitPath expression as a boolean condition.
  case eval
}
