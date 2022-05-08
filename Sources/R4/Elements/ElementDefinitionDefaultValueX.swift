//
//  ElementDefinitionDefaultValueX.swift
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

open class ElementDefinitionDefaultValueX: Element {
  public var address: Address?
  public var age: Age?
  public var annotation: Annotation?
  public var attachment: Attachment?
  public var base64binary: FHIRKitPrimitive<FHIRKitBase64Binary>?
  public var boolean: FHIRKitPrimitive<FHIRKitBool>?
  public var canonical: FHIRKitPrimitive<Canonical>?
  public var code: FHIRKitPrimitive<FHIRKitString>?
  public var codableConcept: CodableConcept?
  public var coding: Coding?
  public var contactDetail: ContactDetail?
  public var contactPoint: ContactPoint?
  public var contributor: Contributor?
  public var count: Count?
  public var dataRequirement: DataRequirement?
  public var date: FHIRKitPrimitive<FHIRKitDate>?
  public var dateTime: FHIRKitPrimitive<FHIRKitDateTime>?
  public var decimal: FHIRKitPrimitive<FHIRKitDecimal>?
  public var distance: Distance?
  public var dosage: Dosage?
  public var duration: Duration?
  public var expression: Expression?
  public var humanName: HumanName?
  public var id: FHIRKitPrimitive<FHIRKitString>?
  public var identifier: Identifier?
  public var instant: FHIRKitPrimitive<FHIRKitInstant>?
  public var integer: FHIRKitPrimitive<FHIRKitInteger>?
  public var markdown: FHIRKitPrimitive<FHIRKitString>?
  public var meta: Meta?
  public var money: Money?
  public var oid: FHIRKitPrimitive<FHIRKitURI>?
  public var parameterDefinition: ParameterDefinition?
  public var period: Period?
  public var positiveInteger: FHIRKitPrimitive<FHIRKitPositiveInteger>?
  public var quantity: Quantity?
  public var range: Range?
  public var ratio: Ratio?
  public var reference: Reference?
  public var relatedArtifact: RelatedArtifact?
  public var sampledData: SampledData?
  public var signature: Signature?
  public var string: FHIRKitPrimitive<FHIRKitString>?
  public var time: FHIRKitPrimitive<FHIRKitTime>?
  public var timing: Timing?
  public var triggerDefinition: TriggerDefinition?
  public var unsignedInteger: FHIRKitPrimitive<FHIRKitUnsignedInteger>?
  public var uri: FHIRKitPrimitive<FHIRKitURI>?
  public var url: FHIRKitPrimitive<FHIRKitURI>?
  public var usageContext: UsageContext?
  public var uuid: FHIRKitPrimitive<FHIRKitURI>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    address: Address? = nil,
    age: Age? = nil,
    annotation: Annotation? = nil,
    attachment: Attachment? = nil,
    base64binary: FHIRKitPrimitive<FHIRKitBase64Binary>? = nil,
    boolean: FHIRKitPrimitive<FHIRKitBool>? = nil,
    canonical: FHIRKitPrimitive<Canonical>? = nil,
    code: FHIRKitPrimitive<FHIRKitString>? = nil,
    codableConcept: CodableConcept? = nil,
    coding: Coding? = nil,
    contactDetail: ContactDetail? = nil,
    contactPoint: ContactPoint? = nil,
    contributor: Contributor? = nil,
    count: Count? = nil,
    dataRequirement: DataRequirement? = nil,
    date: FHIRKitPrimitive<FHIRKitDate>? = nil,
    dateTime: FHIRKitPrimitive<FHIRKitDateTime>? = nil,
    decimal: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    distance: Distance? = nil,
    dosage: Dosage? = nil,
    duration: Duration? = nil,
    expression: Expression? = nil,
    humanName: HumanName? = nil,
    identifier: Identifier? = nil,
    instant: FHIRKitPrimitive<FHIRKitInstant>? = nil,
    integer: FHIRKitPrimitive<FHIRKitInteger>? = nil,
    markdown: FHIRKitPrimitive<FHIRKitString>? = nil,
    meta: Meta? = nil,
    money: Money? = nil,
    oid: FHIRKitPrimitive<FHIRKitURI>? = nil,
    parameterDefinition: ParameterDefinition? = nil,
    period: Period? = nil,
    positiveInteger: FHIRKitPrimitive<FHIRKitPositiveInteger>? = nil,
    quantity: Quantity? = nil,
    range: Range? = nil,
    ratio: Ratio? = nil,
    reference: Reference? = nil,
    relatedArtifact: RelatedArtifact? = nil,
    sampledData: SampledData? = nil,
    signature: Signature? = nil,
    string: FHIRKitPrimitive<FHIRKitString>? = nil,
    time: FHIRKitPrimitive<FHIRKitTime>? = nil,
    timing: Timing? = nil,
    triggerDefinition: TriggerDefinition? = nil,
    unsignedInteger: FHIRKitPrimitive<FHIRKitUnsignedInteger>? = nil,
    uri: FHIRKitPrimitive<FHIRKitURI>? = nil,
    url: FHIRKitPrimitive<FHIRKitURI>? = nil,
    usageContext: UsageContext? = nil,
    uuid: FHIRKitPrimitive<FHIRKitURI>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.address = address
    self.age = age
    self.annotation = annotation
    self.attachment = attachment
    self.base64binary = base64binary
    self.boolean = boolean
    self.canonical = canonical
    self.code = code
    self.codableConcept = codableConcept
    self.coding = coding
    self.contactDetail = contactDetail
    self.contactPoint = contactPoint
    self.contributor = contributor
    self.count = count
    self.dataRequirement = dataRequirement
    self.date = date
    self.dateTime = dateTime
    self.decimal = decimal
    self.distance = distance
    self.dosage = dosage
    self.duration = duration
    self.expression = expression
    self.humanName = humanName
    self.identifier = identifier
    self.instant = instant
    self.integer = integer
    self.markdown = markdown
    self.meta = meta
    self.money = money
    self.oid = oid
    self.parameterDefinition = parameterDefinition
    self.period = period
    self.positiveInteger = positiveInteger
    self.quantity = quantity
    self.range = range
    self.ratio = ratio
    self.reference = reference
    self.relatedArtifact = relatedArtifact
    self.sampledData = sampledData
    
  }
}
