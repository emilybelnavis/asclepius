//
//  ContractTermAction.swift
//  FHIRKit
//  Module: R4
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import FHIRKitCore

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
