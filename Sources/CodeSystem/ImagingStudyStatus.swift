//
//  ImagingStudyStatus.swift
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
 The status of the ImagingStudy.
 
 URL: http://hl7.org/fhir/imagingstudy-status
 ValueSet: http://hl7.org/fhir/ValueSet/imagingstudy-status
 */
public enum ImagingStudyStatus: String, FHIRKitPrimitiveType {
  /// The existence of the imaging study is registered, but there is nothing yet available.
  case registered
  
  /// At least one instance has been associated with this imaging study.
  case available
  
  /// The imaging study is unavailable because the imaging study was not started or not completed (also sometimes
  /// called "aborted").
  case cancelled
  
  /// The imaging study has been withdrawn following a previous final release.  This electronic record should never
  /// have existed, though it is possible that real-world decisions were based on it. (If real-world activity has
  /// occurred, the status should be "cancelled" rather than "entered-in-error".).
  case enteredInError = "entered-in-error"
  
  /// The system does not know which of the status values currently applies for this request. Note: This concept is
  /// not to be used for "other" - one of the listed statuses is presumed to apply, it's just not known which one.
  case unknown
}
