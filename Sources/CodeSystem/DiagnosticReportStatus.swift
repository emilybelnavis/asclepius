//
//  DiagnosticReportStatus.swift
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
 The status of the diagnostic report.
 
 URL: http://hl7.org/fhir/diagnostic-report-status
 ValueSet: http://hl7.org/fhir/ValueSet/diagnostic-report-status
 */
public enum DiagnosticReportStatus: String, FHIRKitPrimitiveType {
  /// The existence of the report is registered, but there is nothing yet available.
  case registered
  
  /// This is a partial (e.g. initial, interim or preliminary) report: data in the report may be incomplete or
  /// unverified.
  case partial
  
  /// Verified early results are available, but not all  results are final.
  case preliminary
  
  /// The report is complete and verified by an authorized person.
  case final
  
  /// Subsequent to being final, the report has been modified.  This includes any change in the results, diagnosis,
  /// narrative text, or other content of a report that has been issued.
  case amended
  
  /// Subsequent to being final, the report has been modified  to correct an error in the report or referenced
  /// results.
  case corrected
  
  /// Subsequent to being final, the report has been modified by adding new content. The existing content is
  /// unchanged.
  case appended
  
  /// The report is unavailable because the measurement was not started or not completed (also sometimes called
  /// "aborted").
  case cancelled
  
  /// The report has been withdrawn following a previous final release.  This electronic record should never have
  /// existed, though it is possible that real-world decisions were based on it. (If real-world activity has occurred,
  /// the status should be "cancelled" rather than "entered-in-error".).
  case enteredInError = "entered-in-error"
  
  /// The authoring/source system does not know which of the status values currently applies for this observation.
  /// Note: This concept is not to be used for "other" - one of the listed statuses is presumed to apply, but the
  /// authoring/source system does not know which.
  case unknown
}
