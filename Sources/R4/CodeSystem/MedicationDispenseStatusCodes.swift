//
//  MedicationDispenseStatusCodes.swift
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
 MedicationDispense Status Codes
 
 URL: http://terminology.hl7.org/CodeSystem/medicationdispense-status
 ValueSet: http://hl7.org/fhir/ValueSet/medicationdispense-status
 */
public enum MedicationDispenseStatusCodes: String, FHIRKitPrimitiveType {
  /// The core event has not started yet, but some staging activities have begun (e.g. initial compounding or
  /// packaging of medication). Preparation stages may be tracked for billing purposes.
  case preparation
  
  /// The dispensed product is ready for pickup.
  case inProgress = "in-progress"
  
  /// The dispensed product was not and will never be picked up by the patient.
  case cancelled
  
  /// The dispense process is paused while waiting for an external event to reactivate the dispense.  For example, new
  /// stock has arrived or the prescriber has called.
  case onHold = "on-hold"
  
  /// The dispensed product has been picked up.
  case completed
  
  /// The dispense was entered in error and therefore nullified.
  case enteredInError = "entered-in-error"
  
  /// Actions implied by the dispense have been permanently halted, before all of them occurred.
  case stopped
  
  /// The dispense was declined and not performed.
  case declined
  
  /// The authoring system does not know which of the status values applies for this medication dispense.  Note: this
  /// concept is not to be used for other - one of the listed statuses is presumed to apply, it's just now known which
  /// one.
  case unknown
}
