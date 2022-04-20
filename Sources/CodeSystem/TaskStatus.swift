//
//  TaskStatus.swift
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
 The current status of the task.
 
 URL: http://hl7.org/fhir/task-status
 ValueSet: http://hl7.org/fhir/ValueSet/task-status
 */
public enum TaskStatus: String, FHIRKitPrimitiveType {
  /// The task is not yet ready to be acted upon.
  case draft
  
  /// The task is ready to be acted upon and action is sought.
  case requested
  
  /// A potential performer has claimed ownership of the task and is evaluating whether to perform it.
  case received
  
  /// The potential performer has agreed to execute the task but has not yet started work.
  case accepted
  
  /// The potential performer who claimed ownership of the task has decided not to execute it prior to performing any
  /// action.
  case rejected
  
  /// The task is ready to be performed, but no action has yet been taken.  Used in place of
  /// requested/received/accepted/rejected when request assignment and acceptance is a given.
  case ready
  
  /// The task was not completed.
  case cancelled
  
  /// The task has been started but is not yet complete.
  case inProgress = "in-progress"
  
  /// The task has been started but work has been paused.
  case onHold = "on-hold"
  
  /// The task was attempted but could not be completed due to some error.
  case failed
  
  /// The task has been completed.
  case completed
  
  /// The task should never have existed and is retained only because of the possibility it may have used.
  case enteredInError = "entered-in-error"
}
