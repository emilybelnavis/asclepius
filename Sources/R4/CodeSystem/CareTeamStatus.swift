//
//  CareTeamStatus.swift
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
 Indicates the status of the care team.
 
 URL: http://hl7.org/fhir/care-team-status
 ValueSet: http://hl7.org/fhir/ValueSet/care-team-status
 */
public enum CareTeamStatus: String, FHIRKitPrimitiveType {
  /// The care team has been drafted and proposed, but not yet participating in the coordination and
  /// delivery of patient care
  case proposed
  
  /// The care team is currently participating in the coordination and delivery of care
  case active
  
  /// The care team is temporarily on hold or suspended and not participating in the coordination and
  /// delivery of care.
  case suspended
  
  /// The care team was, but is no longer, participating in the coordination and delivery of care.
  case inactive
  
  /// The care team should have never existed.
  case enteredInError = "entered-in-error"
}
