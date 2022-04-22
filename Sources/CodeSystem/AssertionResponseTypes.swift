//
//  AssertionResponseTypes.swift
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
 The type of response code to use for assertion.
 
 URL: http://hl7.org/fhir/assert-response-code-types
 ValueSet: http://hl7.org/fhir/ValueSet/assert-response-code-types
 */
public enum AssertionResponseTypes: String, FHIRKitPrimitiveType {
  /// Response Code - 200
  case okay
  
  /// Response Code - 201
  case created
  
  /// Response Code - 204
  case noContent
  
  /// Response Code - 304
  case notModified
  
  /// Response Code - 400
  case bad
  
  /// Response Code - 403
  case forbidden
  
  /// Response Code - 404
  case notFound
  
  /// Response Code - 405
  case methodNotAllowed
  
  /// Response Code - 409
  case conflict
  
  /// Response Code - 410
  case gone
  
  /// Response Code - 412
  case preconditionFailed
  
  /// Response Code - 422
  case unprocessable
}
