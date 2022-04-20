//
//  SlicingRules.swift
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
 How slices are interpreted when evaluating an instance.
 
 URL: http://hl7.org/fhir/resource-slicing-rules
 ValueSet: http://hl7.org/fhir/ValueSet/resource-slicing-rules
 */
public enum SlicingRules: String, FHIRKitPrimitiveType {
  /// No additional content is allowed other than that described by the slices in this profile.
  case closed
  
  /// Additional content is allowed anywhere in the list.
  case open
  
  /// Additional content is allowed, but only at the end of the list. Note that using this requires that the slices be
  /// ordered, which makes it hard to share uses. This should only be done where absolutely required.
  case openAtEnd
}
