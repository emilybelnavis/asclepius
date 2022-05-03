//
//  AppointmentStatus.swift
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
 The free/busy status of an appointment.
 
 URL: http://hl7.org/fhir/appointmentstatus
 ValueSet: http://hl7.org/fhir/ValueSet/appointmentstatus
 */
public enum AppointmentStatus: String, FHIRKitPrimitiveType {
  /// None of the participant(s) have finalized their acceptance of the appointment request, and the start/end
  /// time might not be set yet.
  case proposed
  
  /// Some or all of the participant(s) have not finalized their acceptance of the appointment request.
  case pending
  
  /// All paricipant(s) have been considered and the appointment is confirmed to go ahead at the date/times
  /// specified
  case booked
  
  /// The patient/patients has/have arrived and is/are waiting to be seen
  case arrived
  
  /// The planning stages of the appointment are complete, the encounter resource will exist and will track
  /// further status changes. Note that an encounter may exist before the appointment status is fufilled for
  /// many reasons.
  case fulfilled
  
  /// The appointment has been cancelled
  case cancelled
  
  /// Some or all of the participant(s) have not/did not appear for the appointment (usually the patient).
  case noshow
  
  /// This instance should not have been part of this patient's medical record
  case enteredInError = "entered-in-error"
  
  /// When checked in, all pre-encounter administrative work is complete,  and the encounter may begin.
  /// (where multiple patients are involved, they are all present)
  case checkedIn = "checked-in"
  
  /// The appointment has been placed on a waitlist, to be scheduled/confirmed in the future when a
  /// slot/service is available. A specific time might or might not be pre-allocated.
  case waitlist
}
