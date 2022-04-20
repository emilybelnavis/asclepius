//
//  EndpointStatus.swift
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
 The status of the endpoint.
 
 URL: http://hl7.org/fhir/endpoint-status
 ValueSet: http://hl7.org/fhir/ValueSet/endpoint-status
 */
public enum EndpointStatus: String, FHIRKitPrimitiveType {
  /// This endpoint is expected to be active and can be used.
  case active
  
  /// This endpoint is temporarily unavailable.
  case suspended
  
  /// This endpoint has exceeded connectivity thresholds and is considered in an error state and should no longer be
  /// attempted to connect to until corrective action is taken.
  case error
  
  /// This endpoint is no longer to be used.
  case off
  
  /// This instance should not have been part of this patient's medical record.
  case enteredInError = "entered-in-error"
  
  /// This endpoint is not intended for production usage.
  case test
}
