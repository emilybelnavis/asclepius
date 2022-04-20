//
//  MedicationRequestStatusCodes.swift
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
 MedicationRequest Status Codes
 
 URL: http://hl7.org/fhir/CodeSystem/medicationrequest-status
 ValueSet: http://hl7.org/fhir/ValueSet/medicationrequest-status
 */
public enum MedicationRequestStatusCodes: String, FHIRKitPrimitiveType {
  /// The prescription is 'actionable', but not all actions that are implied by it have occurred yet.
  case active
  
  /// Actions implied by the prescription are to be temporarily halted, but are expected to continue later.  May also
  /// be called 'suspended'.
  case onHold = "on-hold"
  
  /// The prescription has been withdrawn before any administrations have occurred
  case cancelled
  
  /// All actions that are implied by the prescription have occurred.
  case completed
  
  /// Some of the actions that are implied by the medication request may have occurred.  For example, the medication
  /// may have been dispensed and the patient may have taken some of the medication.  Clinical decision support
  /// systems should take this status into account
  case enteredInError = "entered-in-error"
  
  /// Actions implied by the prescription are to be permanently halted, before all of the administrations occurred.
  /// This should not be used if the original order was entered in error
  case stopped
  
  /// The prescription is not yet 'actionable', e.g. it is a work in progress, requires sign-off,
  /// verification or needs to be run through decision support process.
  case draft
  
  /// The authoring/source system does not know which of the status values currently applies for this observation.
  /// Note: This concept is not to be used for 'other' - one of the listed statuses is presumed to apply, but the
  /// authoring/source system does not know which.
  case unknown
}
