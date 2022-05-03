//
//  IssueSeverity.swift
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
 How the issue affects the success of the action.
 
 URL: http://hl7.org/fhir/issue-severity
 ValueSet: http://hl7.org/fhir/ValueSet/issue-severity
 */
public enum IssueSeverity: String, FHIRKitPrimitiveType {
  /// The issue caused the action to fail and no further checking could be performed.
  case fatal
  
  /// The issue is sufficiently important to cause the action to fail.
  case error
  
  /// The issue is not important enough to cause the action to fail but may cause it to be performed suboptimally or
  /// in a way that is not as desired.
  case warning
  
  /// The issue has no relation to the degree of success of the action.
  case information
}
