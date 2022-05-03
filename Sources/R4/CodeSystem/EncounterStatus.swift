//
//  EncounterStatus.swift
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
 Current state of the encounter.
 
 URL: http://hl7.org/fhir/encounter-status
 ValueSet: http://hl7.org/fhir/ValueSet/encounter-status
 */
public enum EncounterStatus: String, FHIRKitPrimitiveType {
  /// The Encounter has not yet started.
  case planned
  
  /// The Patient is present for the encounter, however is not currently meeting with a practitioner.
  case arrived
  
  /// The patient has been assessed for the priority of their treatment based on the severity of their condition.
  case triaged

  /// The Encounter has begun and the patient is present / the practitioner and the patient are meeting.
  case inProgress = "in-progress"
  
  /// The Encounter has begun, but the patient is temporarily on leave.
  case onleave
  
  /// The Encounter has ended.
  case finished
  
  /// The Encounter has ended before it has begun.
  case cancelled
  
  /// This instance should not have been part of this patient's medical record.
  case enteredInError = "entered-in-error"
  
  /// The encounter status is unknown. Note that "unknown" is a value of last resort and every attempt should be made
  /// to provide a meaningful value other than "unknown".
  case unknown
}
