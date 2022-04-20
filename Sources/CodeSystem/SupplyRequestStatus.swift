//
//  SupplyRequestStatus.swift
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
 Status of the supply request.
 
 URL: http://hl7.org/fhir/supplyrequest-status
 ValueSet: http://hl7.org/fhir/ValueSet/supplyrequest-status
 */
public enum SupplyRequestStatus: String, FHIRKitPrimitiveType {
  /// The request has been created but is not yet complete or ready for action.
  case draft
  
  /// The request is ready to be acted upon.
  case active
  
  /// The authorization/request to act has been temporarily withdrawn but is expected to resume in the future.
  case suspended
  
  /// The authorization/request to act has been terminated prior to the full completion of the intended actions.  No
  /// further activity should occur.
  case cancelled
  
  /// Activity against the request has been sufficiently completed to the satisfaction of the requester.
  case completed
  
  /// This electronic record should never have existed, though it is possible that real-world decisions were based on
  /// it.  (If real-world activity has occurred, the status should be "cancelled" rather than "entered-in-error".).
  case enteredInError = "entered-in-error"
  
  /// The authoring/source system does not know which of the status values currently applies for this observation.
  /// Note: This concept is not to be used for "other" - one of the listed statuses is presumed to apply, but the
  /// authoring/source system does not know which.
  case unknown
}
