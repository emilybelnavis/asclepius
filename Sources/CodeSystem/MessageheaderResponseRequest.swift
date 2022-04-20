//
//  MessageheaderResponseRequest.swift
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
 HL7-defined table of codes which identify conditions under which acknowledgments are required to be returned in
 response to a message.
 
 URL: http://hl7.org/fhir/messageheader-response-request
 ValueSet: http://hl7.org/fhir/ValueSet/messageheader-response-request
 */
public enum MessageheaderResponseRequest: String, FHIRKitPrimitiveType {
  /// initiator expects a response for this message.
  case always
  
  /// initiator expects a response only if in error.
  case onError = "on-error"
  
  /// initiator does not expect a response.
  case never
  
  /// initiator expects a response only if successful.
  case onSuccess = "on-success"
}
