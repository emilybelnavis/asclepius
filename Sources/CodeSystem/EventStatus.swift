//
//  EventStatus.swift
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
 Codes identifying the lifecycle stage of an event.
 
 URL: http://hl7.org/fhir/event-status
 ValueSet: http://hl7.org/fhir/ValueSet/event-status
 */
public enum EventStatus: String, FHIRKitPrimitiveType {
  /// The core event has not started yet, but some staging activities have begun (e.g. surgical suite preparation).
  /// Preparation stages may be tracked for billing purposes.
  case preparation
  
  /// The event is currently occurring.
  case inProgress = "in-progress"
  
  /// The event was terminated prior to any activity beyond preparation.  I.e. The 'main' activity has not yet begun.
  /// The boundary between preparatory and the 'main' activity is context-specific.
  case notDone = "not-done"
  
  /// The event has been temporarily stopped but is expected to resume in the future.
  case onHold = "on-hold"
  
  /// The event was terminated prior to the full completion of the intended activity but after at least some of the
  /// 'main' activity (beyond preparation) has occurred.
  case stopped
  
  /// The event has now concluded.
  case completed
  
  /// This electronic record should never have existed, though it is possible that real-world decisions were based on
  /// it.  (If real-world activity has occurred, the status should be "stopped" rather than "entered-in-error".).
  case enteredInError = "entered-in-error"
  
  /// The authoring/source system does not know which of the status values currently applies for this event.  Note:
  /// This concept is not to be used for "other" - one of the listed statuses is presumed to apply,  but the
  /// authoring/source system does not know which.
  case unknown
}
