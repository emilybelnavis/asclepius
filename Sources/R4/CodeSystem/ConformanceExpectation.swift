//
//  ConformanceExpectation.swift
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
 Indicates the degree of adherence to a specified behavior or capability expected for a system to be deemed conformant
 with a specification.
 
 URL: http://terminology.hl7.org/CodeSystem/conformance-expectation
 ValueSet: http://hl7.org/fhir/ValueSet/conformance-expectation
 */
public enum ConformanceExpectation: String, FHIRKitPrimitiveType {
  /// Support for the specified capability is required to be considered conformant
  case SHALL
  
  /// Support for the specified capability is strongly encouraged and failure to support it should only
  /// occur after careful consideration
  case SHOULD
  
  /// Support for the specified capability is not necessary to be considered conformant and the
  /// requirement should be considered strictly optional
  case MAY
  
  /// Support for the specified capability is strongly discouraged and should only occur after careful
  ///  consideration
  case SHOULDNOT = "SHOULD-NOT"
}
