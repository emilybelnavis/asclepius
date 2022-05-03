//
//  GuidanceResponseStatus.swift
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
 The status of a guidance response.
 
 URL: http://hl7.org/fhir/guidance-response-status
 ValueSet: http://hl7.org/fhir/ValueSet/guidance-response-status
 */
public enum GuidanceResponseStatus: String, FHIRKitPrimitiveType {
  /// The request was processed successfully.
  case success
  
  /// The request was processed successfully, but more data may result in a more complete evaluation.
  case dataRequested = "data-requested"
  
  /// The request was processed, but more data is required to complete the evaluation.
  case dataRequired = "data-required"
  
  /// The request is currently being processed.
  case inProgress = "in-progress"
  
  /// The request was not processed successfully.
  case failure
  
  /// The response was entered in error.
  case enteredInError = "entered-in-error"
}
