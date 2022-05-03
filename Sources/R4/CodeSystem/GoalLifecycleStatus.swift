//
//  GoalLifecycleStatus.swift
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
 Codes that reflect the current state of a goal and whether the goal is still being targeted.
 
 URL: http://hl7.org/fhir/goal-status
 ValueSet: http://hl7.org/fhir/ValueSet/goal-status
 */
public enum GoalLifecycleStatus: String, FHIRKitPrimitiveType {
  /// A goal is proposed for this patient.
  case proposed
  
  /// A goal is planned for this patient.
  case planned
  
  /// A proposed goal was accepted or acknowledged.
  case accepted
  
  /// The goal is being sought actively.
  case active
  
  /// The goal remains a long term objective but is no longer being actively pursued for a temporary period of time.
  case onHold = "on-hold"
  
  /// The goal is no longer being sought.
  case completed
  
  /// The goal has been abandoned.
  case cancelled
  
  /// The goal was entered in error and voided.
  case enteredInError = "entered-in-error"
  
  /// A proposed goal was rejected.
  case rejected
}
