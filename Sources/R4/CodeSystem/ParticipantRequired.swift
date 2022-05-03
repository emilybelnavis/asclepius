//
//  ParticipantRequired.swift
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
 Is the Participant required to attend the appointment.
 
 URL: http://hl7.org/fhir/participantrequired
 ValueSet: http://hl7.org/fhir/ValueSet/participantrequired
 */
public enum ParticipantRequired: String, FHIRKitPrimitiveType {
  /// The participant is required to attend the appointment.
  case required
  
  /// The participant may optionally attend the appointment.
  case optional
  
  /// The participant is excluded from the appointment, and might not be informed of the appointment taking place.
  /// (Appointment is about them, not for them - such as 2 doctors discussing results about a patient's test).
  case informationOnly = "information-only"
}
