//
//  ActivityDefinition.swift
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
 The definition of a specific activity to be taken, independent of any particular patient or context.
 
 This resource allows for the definition of some activity to be performed, independent of a particular partient,
 practitioner, or any other performance context.
 */
open class ActivityDefinition: DomainResource {
  override open class var resourceType: ResourceType {
    return .activityDefinition
  }
  
  public enum Product: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  public enum Subject: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  public enum Timing: Hashable {
    case age(Age)
    case dateTime(FHIRKitPrimitive<FHIRKitDateTime>)
    case duration(Duration)
    case period(Period)
    case range(Range)
    case timing(Timing)
  }
  
  public var url: FHIRKitPrimitive<FHIRKitURI>?
  public var identifier: [Identifier]?
  public var version: FHIRKitPrimitive<FHIRKitString>?
  public var name: FHIRKitPrimitive<FHIRKitString>?
  public var title: FHIRKitPrimitive<FHIRKitString>?
  public var subtitle: FHIRKitPrimitive<FHIRKitString>?
  public var status: FHIRKitPrimitive<PublicationStatus>
  public var experimental: FHIRKitPrimitive<FHIRKitBool>?
  public var subject: Subject?
  public var date: FHIRKitPrimitive<FHIRKitDateTime>?
  public var publisher: FHIRKitPrimitive<FHIRKitString>?
  public var contact: [ContactDetail]?
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  public var useContext: [Usagecontext]?
  public var jurisdiction: [CodableConcept]?
  public var purpose: FHIRKitPrimitive<FHIRKitString>?
  public var usage: FHIRKitPrimitive<FHIRKitString>?
  public var copyright: FHIRKitPrimitive<FHIRKitString>?
  public var approvalDate: FHIRKitPrimitive<FHIRKitDate>?
  public var lastReviewDate: FHIRKitPrimitive<FHIRKitDate>?
  public var effectivePeriod: Period?
  public var topic: [CodableConcept]?
  public var author: [ContactDetail]?
  public var editor: [ContactDetail]?
  public var reviewer: [ContactDetail]?
  public var endorser: [ContactDetail]?
  public var relatedArtifact: [RelatedArtifact]?
  public var library: [FHIRKitPrimitive<Canonical>]?
  public var kind: FHIRKitPrimitive<RequestResourceType>?
  public var profile: FHIRKitPrimitive<Canonical>?
  public var code: CodableConcept?
  public var intent: FHIRKitPrimitive<RequestIntent>?
  public var priority: FHIRKitPrimitive<RequestPriority>?
  public var doNotPerform: FHIRKitPrimitive<FHIRKitBool>?
  public var timing: Timing?
  public var location: Reference?
  public var participant: [ActivityDefinitionParticipant]?
  public var product: Product?
  public var quantity: Quantity?
  public var dosage: [Dosage]?
  public var bodySite: [CodableConcept]?
  public var specimenRequirement: [Reference]?
  public var observationRequirement: [Reference]?
  public var observationResultRequirement: [Reference]?
  public var transform: FHIRKitPrimitive<Canonical>?
  public var dynamicValue: [ActivityDefinitionDynamicValue]?
}
