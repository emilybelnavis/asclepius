//
//  CarePlanActivityStatus.swift
//  FHIRKit
//  Module: R4
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

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
