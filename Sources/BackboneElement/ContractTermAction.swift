//
//  ContractTermAction.swift
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
 Entity being ascribed responsibility - An actor taking a role in an activity for which it can be assigned some degree
 of responsibility for the activity taking place.
 */
open class ContractTermAction: BackboneElement {
  public enum OccurrenceX: Hashable {
    case dateTime(FHIRKitPrimitive<FHIRKitDateTime>)
    case period(Period)
    case timing(Timing)
  }
  
  /// True if the term prohibits the action
  public var doNotPerform: FHIRKitPrimitive<FHIRKitBool>?
  
  /// Type or form of the action
  public var type: CodableConcept
  
  /// Entity of the action
  public var subject: [ContractTermActionSubject]?
  
  /// Purpose for the Contract Term Action
  public var intent: CodableConcept
  
  /// Pointer to specific item
  public var linkId: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// State of the action
  public var status: CodableConcept
  
  /// Episode associated with action
  public var context: Reference?
  
  /// Pointer to specific item
  public var contextLinkId: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// When action happens
  public var occurenceX: OccurenceX?
  
  /// Who asked for action
  public var requester: [Reference]?
  
  /// Pointer to specific item
  public var requesterLinkId: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// Kind of service performer
  public var performerType: [CodableConcept]?
  
  /// Competency of the performer
  public var performerRole: CodableConcept?
  
  /// Actor that will (or won't) execute the action
  public var performer: Reference?
  
  /// Pointer to specific item
  public var performerLinkId: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// Why the action is/isn't needed
  public var reasonCode: [CodableConcept]?
  
  /// Why the action is/isn't needed
  public var reasonReference: [Reference]?
  
  /// Why action is to be performed
  public var reason: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// Pointer to specific item
  public var reasonLinkId: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// Comments about the action
  public var note: [Annotation]?
  
  /// Action restriction numbers
  public var securityLabelNumber: [FHIRKitPrimitive<FHIRKitUnsignedInteger>]?
}
