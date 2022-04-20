//
//  RequestStatus.swift
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
 Codes identifying the lifecycle stage of a request.
 
 URL: http://hl7.org/fhir/request-status
 ValueSet: http://hl7.org/fhir/ValueSet/request-status
 */
public enum RequestStatus: String, FHIRKitPrimitiveType {
  /// The request has been created but is not yet complete or ready for action.
  case draft
  
  /// The request is in force and ready to be acted upon.
  case active
  
  /// The request (and any implicit authorization to act) has been temporarily withdrawn but is expected to resume in
  /// the future.
  case onHold = "on-hold"
  
  /// The request (and any implicit authorization to act) has been terminated prior to the known full completion of
  /// the intended actions.  No further activity should occur.
  case revoked
  
  /// The activity described by the request has been fully performed.  No further activity will occur.
  case completed
  
  /// This request should never have existed and should be considered 'void'.  (It is possible that real-world
  /// decisions were based on it.  If real-world activity has occurred, the status should be "revoked" rather than
  /// "entered-in-error".).
  case enteredInError = "entered-in-error"
  
  /// The authoring/source system does not know which of the status values currently applies for this request.  Note:
  /// This concept is not to be used for "other" - one of the listed statuses is presumed to apply,  but the
  /// authoring/source system does not know which.
  case unknown
}
