//
//  ElementDefinitionDefaultValueX.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

open class ElementDefinitionDefaultValueX: Element {
  public var address: Address?
  public var age: Age?
  public var annotation: Annotation?
  public var attachment: Attachment?
  public var base64binary: AlexandriaHRMPrimitive<AlexandriaHRMBase64Binary>?
  public var boolean: AlexandriaHRMPrimitive<AlexandriaHRMBool>?
  public var canonical: AlexandriaHRMPrimitive<Canonical>?
  public var code: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  public var codableConcept: CodableConcept?
  public var coding: Coding?
  public var contactDetail: ContactDetail?
  public var contactPoint: ContactPoint?
  public var contributor: Contributor?
  public var count: Count?
  public var dataRequirement: DataRequirement?
  public var date: AlexandriaHRMPrimitive<AlexandriaHRMDate>?
  public var dateTime: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>?
  public var decimal: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>?
  public var distance: Distance?
  public var dosage: Dosage?
  public var duration: Duration?
  public var expression: Expression?
  public var humanName: HumanName?
  public var fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  public var identifier: Identifier?
  public var instant: AlexandriaHRMPrimitive<AlexandriaHRMInstant>?
  public var integer: AlexandriaHRMPrimitive<AlexandriaHRMInteger>?
  public var markdown: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  public var meta: Meta?
  public var money: Money?
  public var ofhirId: AlexandriaHRMPrimitive<AlexandriaHRMURI>?
  public var parameterDefinition: ParameterDefinition?
  public var period: Period?
  public var positiveInteger: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>?
  public var quantity: Quantity?
  public var range: Range?
  public var ratio: Ratio?
  public var reference: Reference?
  public var relatedArtifact: RelatedArtifact?
  public var sampledData: SampledData?
  public var signature: Signature?
  public var string: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  public var time: AlexandriaHRMPrimitive<AlexandriaHRMTime>?
  public var timing: Timing?
  public var triggerDefinition: TriggerDefinition?
  public var unsignedInteger: AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>?
  public var uri: AlexandriaHRMPrimitive<AlexandriaHRMURI>?
  public var url: AlexandriaHRMPrimitive<AlexandriaHRMURI>?
  public var usageContext: UsageContext?
  public var uufhirId: AlexandriaHRMPrimitive<AlexandriaHRMURI>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    address: Address? = nil,
    age: Age? = nil,
    annotation: Annotation? = nil,
    attachment: Attachment? = nil,
    base64binary: AlexandriaHRMPrimitive<AlexandriaHRMBase64Binary>? = nil,
    boolean: AlexandriaHRMPrimitive<AlexandriaHRMBool>? = nil,
    canonical: AlexandriaHRMPrimitive<Canonical>? = nil,
    code: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    codableConcept: CodableConcept? = nil,
    coding: Coding? = nil,
    contactDetail: ContactDetail? = nil,
    contactPoint: ContactPoint? = nil,
    contributor: Contributor? = nil,
    count: Count? = nil,
    dataRequirement: DataRequirement? = nil,
    date: AlexandriaHRMPrimitive<AlexandriaHRMDate>? = nil,
    dateTime: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>? = nil,
    decimal: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>? = nil,
    distance: Distance? = nil,
    dosage: Dosage? = nil,
    duration: Duration? = nil,
    expression: Expression? = nil,
    humanName: HumanName? = nil,
    identifier: Identifier? = nil,
    instant: AlexandriaHRMPrimitive<AlexandriaHRMInstant>? = nil,
    integer: AlexandriaHRMPrimitive<AlexandriaHRMInteger>? = nil,
    markdown: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    meta: Meta? = nil,
    money: Money? = nil,
    ofhirId: AlexandriaHRMPrimitive<AlexandriaHRMURI>? = nil,
    parameterDefinition: ParameterDefinition? = nil,
    period: Period? = nil,
    positiveInteger: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>? = nil,
    quantity: Quantity? = nil,
    range: Range? = nil,
    ratio: Ratio? = nil,
    reference: Reference? = nil,
    relatedArtifact: RelatedArtifact? = nil,
    sampledData: SampledData? = nil,
    signature: Signature? = nil,
    string: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    time: AlexandriaHRMPrimitive<AlexandriaHRMTime>? = nil,
    timing: Timing? = nil,
    triggerDefinition: TriggerDefinition? = nil,
    unsignedInteger: AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>? = nil,
    uri: AlexandriaHRMPrimitive<AlexandriaHRMURI>? = nil,
    url: AlexandriaHRMPrimitive<AlexandriaHRMURI>? = nil,
    usageContext: UsageContext? = nil,
    uufhirId: AlexandriaHRMPrimitive<AlexandriaHRMURI>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
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
    self.fhirIdentifier = fhirIdentifier
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
