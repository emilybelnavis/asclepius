//
//  CanonicalStatusCodesForFHIRResources.swift
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
 The master set of status codes used throughout FHIR. All status codes are mapped to one of these codes.
 
 URL: http://hl7.org/fhir/resource-status
 ValueSet: http://hl7.org/fhir/ValueSet/resource-status
 */
public enum CanonicalStatusCodesForFHIRResources: String, FHIRKitPrimitiveType {
  /// The resource was created in error, and should not be treated as valid (note: in many cases, for various data
  /// integrity related reasons, the information cannot be removed from the record)
  case error
  
  /// The resource describes an action or plan that is proposed, and not yet approved by the participants
  case proposed
  
  /// The resource describes a course of action that is planned and agreed/approved, but at the time of recording was
  /// still future
  case planned
  
  /// The information in the resource is still being prepared and edited
  case draft
  
  /// A fulfiller has been asked to perform this action, but it has not yet occurred
  case requested
  
  /// The fulfiller has received the request, but not yet agreed to carry out the action
  case received
  
  /// The fulfiller chose not to perform the action
  case declined
  
  /// The fulfiller has decided to perform the action, and plans are in train to do this in the future
  case accepted
  
  /// The pre-conditions for the action are all fulfilled, and it is imminent
  case arrived

  /// The resource describes information that is currently valid or a process that is presently occuring
  case active
  
  /// The process described/requested in this resource has been halted for some reason
  case suspended
  
  /// The process described/requested in the resource could not be completed, and no further action is planned
  case failed
  
  /// The information in this resource has been replaced by information in another resource
  case replaced
  
  /// The process described/requested in the resource has been completed, and no further action is planned
  case complete
  
  /// The resource describes information that is no longer valid or a process that is stopped occurring
  case inactive
  
  /// The process described/requested in the resource did not complete - usually due to some workflow error, and no
  /// further action is planned
  case abandoned
  
  /// Authoring system does not know the status
  case unknown
  
  /// The information in this resource is not yet approved
  case unconfirmed
  
  /// The information in this resource is approved
  case confirmed
  
  /// The issue identified by this resource is no longer of concern
  case resolved
  
  /// This information has been ruled out by testing and evaluation
  case refuted
  
  /// Potentially true?
  case differential
  
  /// This information is still being assembled
  case partial
  
  /// not available at this time/location
  case busyUnavailable = "busy-unavailable"
  
  /// Free for scheduling
  case free
  
  /// Ready to act
  case onTarget = "on-target"
  
  /// Ahead of the planned timelines
  case aheadOfTarget = "ahead-of-target"
  
  /// behindTarget
  case behindTarget = "behind-target"
  
  /// Behind the planned timelines
  case notReady = "not-ready"
  
  /// The device transducer is disconnected
  case transducDiscon = "transduc-discon"
  
  /// The hardware is disconnected
  case hwDiscon = "hw-discon"
}
