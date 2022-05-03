//
//  MedicationAdministrationStatusCodes.swift
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
 MedicationAdministration Status Codes
 
 URL: http://terminology.hl7.org/CodeSystem/medication-admin-status
 ValueSet: http://hl7.org/fhir/ValueSet/medication-admin-status
 */
public enum MedicationAdministrationStatusCodes: String, FHIRKitPrimitiveType {
  /// The administration has started but has not yet completed.
  case inProgress = "in-progress"
  
  /// The administration was terminated prior to any impact on the subject (though preparatory actions may have been
  /// taken)
  case notDone = "not-done"
  
  /// Actions implied by the administration have been temporarily halted, but are expected to continue later. May also
  /// be called 'suspended'.
  case onHold = "on-hold"
  
  /// All actions that are implied by the administration have occurred.
  case completed
  
  /// The administration was entered in error and therefore nullified.
  case enteredInError = "entered-in-error"
  
    /// Actions implied by the administration have been permanently halted, before all of them occurred.
  case stopped
  
    /// The authoring system does not know which of the status values currently applies for this request. Note: This
    /// concept is not to be used for 'other' - one of the listed statuses is presumed to apply, it's just not known
    /// which one.
  case unknown
}
