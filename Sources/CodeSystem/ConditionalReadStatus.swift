//
//  ConditionalReadStatus.swift
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
 A code that indicates how the server supports conditional read.
 
 URL: http://hl7.org/fhir/conditional-read-status
 ValueSet: http://hl7.org/fhir/ValueSet/conditional-read-status
 */
public enum ConditionalReadStatus: String, FHIRKitPrimitiveType {
  /// No support for conditional reads
  case notSupported = "not-supported"
  
  /// Conditional reads are supported but only with the `If-Modified-Since` HTTP header
  case modifiedSince = "modified-since"
  
  /// Conditional reads are supported but only with the `If-None-Match` HTTP header
  case notMatch = "not-match"
  
  /// Conditional reads are supported with both the `If-Modified-Since` and `If-None-Match`
  /// HTTP headers
  case fullSupport = "full-support"
}
