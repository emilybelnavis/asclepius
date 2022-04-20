//
//  TriggerType.swift
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
 The type of trigger.
 
 URL: http://hl7.org/fhir/trigger-type
 ValueSet: http://hl7.org/fhir/ValueSet/trigger-type
 */
public enum TriggerType: String, FHIRKitPrimitiveType {
  /// The trigger occurs in response to a specific named event, and no other information about the trigger is
  /// specified. Named events are completely pre-coordinated, and the formal semantics of the trigger are not
  /// provided.
  case namedEvent = "named-event"
  
  /// The trigger occurs at a specific time or periodically as described by a timing or schedule. A periodic event
  /// cannot have any data elements, but may have a name assigned as a shorthand for the event.
  case periodic
  
  /// The trigger occurs whenever data of a particular type is changed in any way, either added, modified, or removed.
  case dataChanged = "data-changed"
  
  /// The trigger occurs whenever data of a particular type is added.
  case dataAdded = "data-added"
  
  /// The trigger occurs whenever data of a particular type is modified.
  case dataModified = "data-modified"
  
  /// The trigger occurs whenever data of a particular type is removed.
  case dataRemoved = "data-removed"
  
  /// The trigger occurs whenever data of a particular type is accessed.
  case dataAccessed = "data-accessed"
  
  /// The trigger occurs whenever access to data of a particular type is completed.
  case dataAccessEnded = "data-access-ended"
}
