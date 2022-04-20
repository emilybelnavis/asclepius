//
//  EndpointPayloadType.swift
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
 This is an example value set defined by the FHIR project, that could be used to represent possible payload document
 types.
 
 URL: http://terminology.hl7.org/CodeSystem/endpoint-payload-type
 */
public enum EndpointPayloadType: String, FHIRKitPrimitiveType {
  /// Any payload type can be used with this endpoint, it is either a payload agnostic infrastructure (such as a
  /// storage repository), or some other type of endpoint where payload considerations are internally handled, and not
  /// available
  case any
  
  /// This endpoint does not require any content to be sent; simply connecting to the endpoint is enough notification.
  /// This can be used as a 'ping' to wakeup a service to retrieve content, which could be to ensure security
  /// considerations are correctly handled
  case none
}
