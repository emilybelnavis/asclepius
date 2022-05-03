//
//  CarePlanActivityStatus.swift
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
 Codes that reflect the current state of a care plan activity within its overall life cycle.
 
 URL: http://hl7.org/fhir/care-plan-activity-status
 ValueSet: http://hl7.org/fhir/ValueSet/care-plan-activity-status
 */
public enum CarePlanActivityStatus: String, FHIRKitPrimitiveType {
  /// Care plan activity is planned bu no action has yet been taken.
  case notStarted = "not-started"
  
  /// Appointment or other booking has occured by activity has not yet begun
  case scheduled
  
  /// Care plan activity has been started but is not yet complete
  case inProgress = "in-progress"
  
  /// Care plan activity was started but has temporarily ceased with an expectation of resumption at a
  /// future time
  case onHold = "on-hold"
  
  /// Care plan activity has been completed (more or less) as planned
  case completed
  
  /// The planned care plan activity has been withdrawn
  case cancelled
  
  /// The planned care plan activity has been ended prior to completion after the activity was started
  case stopped
  
  /// The current state of the care plan activity is not known. Note: This conceot is not to be used for "other"
  /// - one of the listed statues is presumed to apply, but the authoring/source system does not know
  /// which one.
  case unknown
  
  /// Care plan activity was entered in error and voided.
  case enteredInError = "entered-in-error"
}
