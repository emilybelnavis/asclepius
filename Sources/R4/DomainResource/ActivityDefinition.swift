//
//  ActivityDefinition.swift
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
 The definition of a specific activity to be taken, independent of any particular patient or context.
 
 This resource allows for the definition of some activity to be performed, independent of a particular partient,
 practitioner, or any other performance context.
 */
open class ActivityDefinition: DomainResource {
  override open class var resourceType: ResourceType {
    return .activityDefinition
  }
  
  public enum ProductX: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  public enum SubjectX: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  public enum TimingX: Hashable {
    case age(Age)
    case dateTime(FHIRKitPrimitive<FHIRKitDateTime>)
    case duration(Duration)
    case period(Period)
    case range(Range)
    case timing(Timing)
  }
  
  /// Canonical identifier for this activity definition, represented as a URI (globally unique)
  public var url: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Additional idenfier for the activity definition
  public var identifier: [Identifier]?
  
  /// Business version of the activity definition
  public var version: FHIRKitPrimitive<FHIRKitString>?
  
  /// computer-friendly name for this activity definition
  public var name: FHIRKitPrimitive<FHIRKitString>?
  
  /// human-friendly name for this activity definition
  public var title: FHIRKitPrimitive<FHIRKitString>?
  
  /// subtitle of the activity definition
  public var subtitle: FHIRKitPrimitive<FHIRKitString>?
  
  /// status of the activity definition
  public var status: FHIRKitPrimitive<PublicationStatus>
  
  /// definition is for experimental purposes
  public var experimental: FHIRKitPrimitive<FHIRKitBool>?
  
  /// type of individual the activity definition is intended for
  public var subjectX: SubjectX?
  
  /// date last changed
  public var date: FHIRKitPrimitive<FHIRKitDateTime>?
  
  /// name of the publisher (org/individual)
  public var publisher: FHIRKitPrimitive<FHIRKitString>?
  
  /// contact details for the publisher
  public var contact: [ContactDetail]?
  
  /// natural language description of the activity definitoin
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  
  /// the context that the content is intended to support
  public var useContext: [UsageContext]?
  
  /// intended jurisdiction for activity definition
  public var jurisdiction: [CodableConcept]?
  
  /// why this activity definition is defined
  public var purpose: FHIRKitPrimitive<FHIRKitString>?
  
  /// clinical usage for thie activity definition
  public var usage: FHIRKitPrimitive<FHIRKitString>?
  
  /// use and/or publishin restrictions
  public var copyright: FHIRKitPrimitive<FHIRKitString>?
  
  /// when the activity definition was approved by the publisher
  public var approvalDate: FHIRKitPrimitive<FHIRKitDate>?
  
  /// when the activity definition was last reviewed by the publisher
  public var lastReviewDate: FHIRKitPrimitive<FHIRKitDate>?
  
  /// when the activity definition is expected to be used
  public var effectivePeriod: Period?
  
  /// activity definition topic
  public var topic: [CodableConcept]?
  
  /// who authored the activity definition
  public var author: [ContactDetail]?
  
  /// who edited the activity definition
  public var editor: [ContactDetail]?
  
  /// who reviewed the activity definition
  public var reviewer: [ContactDetail]?
  
  /// who endorsed the activity definition
  public var endorser: [ContactDetail]?
  
  /// additional documentation, citations
  public var relatedArtifact: [RelatedArtifact]?
  
  /// logic used by the activity definition
  public var library: [FHIRKitPrimitive<Canonical>]?
  
  /// a description of the kind of resource the definition is representing
  public var kind: FHIRKitPrimitive<RequestResourceType>?
  
  /// what profile the resource needs to conform to
  public var profile: FHIRKitPrimitive<Canonical>?
  
  /// detail type of activity
  public var code: CodableConcept?
  
  /// indicates the level of authorirty/intentionality assocated with the activity and where the request
  /// should fit into the workflow chain
  public var intent: FHIRKitPrimitive<RequestIntent>?
  
  /// indicates how quickly the activty should be addressed with respect to other requests
  public var priority: FHIRKitPrimitive<RequestPriority>?
  
  /// should the activity be performed
  public var doNotPerform: FHIRKitPrimitive<FHIRKitBool>?
  
  /// when the activity is to be performed
  public var timingX: TimingX?
  
  /// where the activity is to be performed
  public var location: Reference?
  
  /// who should participate in the activity
  public var participant: [ActivityDefinitionParticipant]?
  
  /// what is administered/supplied
  public var productX: ProductX?
  
  /// how much is administered/consumed/supplied
  public var quantity: Quantity?
  
  /// detailed dosage instructions
  public var dosage: [Dosage]?
  
  /// which part of the body to perform activity on
  public var bodySite: [CodableConcept]?
  
  /// what specimens are required to perform this action
  public var specimenRequirement: [Reference]?
  
  /// what observations are required to perform this action
  public var observationRequirement: [Reference]?
  
  /// what observations must be produced by this action
  public var observationResultRequirement: [Reference]?
  
  /// transform to apply template
  public var transform: FHIRKitPrimitive<Canonical>?
  
  /// dynamic aspects of the activity definition
  public var dynamicValue: [ActivityDefinitionDynamicValue]?
  
  public init(status: FHIRKitPrimitive<PublicationStatus>) {
    self.status = status
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    approvalDate: FHIRKitPrimitive<FHIRKitDate>? = nil,
    author: [ContactDetail]? = nil,
    bodySite: [CodableConcept]? = nil,
    code: CodableConcept? = nil,
    contact: [ContactDetail]? = nil,
    contained: [ResourceProxy]? = nil,
    copyright: FHIRKitPrimitive<FHIRKitString>? = nil,
    date: FHIRKitPrimitive<FHIRKitDateTime>? = nil,
    doNotPerform: FHIRKitPrimitive<FHIRKitBool>? = nil,
    dosage: [Dosage]? = nil,
    dynamicValue: [ActivityDefinitionDynamicValue]? = nil,
    editor: [ContactDetail]? = nil,
    effectivePeriod: Period? = nil,
    endorser: [ContactDetail]? = nil,
    experimental: FHIRKitPrimitive<FHIRKitBool>? = nil,
    fhirDescription: FHIRKitPrimitive<FHIRKitString>? = nil,
    identifier: [Identifier]? = nil,
    implicitRules: FHIRKitPrimitive<FHIRKitURI>? = nil,
    intent: FHIRKitPrimitive<RequestIntent>? = nil,
    jurisdiction: [CodableConcept]? = nil,
    kind: FHIRKitPrimitive<RequestResourceType>? = nil,
    language: FHIRKitPrimitive<FHIRKitString>? = nil,
    lastReviewDate: FHIRKitPrimitive<FHIRKitDate>? = nil,
    library: [FHIRKitPrimitive<Canonical>]? = nil,
    location: Reference? = nil,
    meta: Meta? = nil,
    name: FHIRKitPrimitive<FHIRKitString>? = nil,
    observationRequirement: [Reference]? = nil,
    observationResultRequirement: [Reference]? = nil,
    participant: [ActivityDefinitionParticipant]? = nil,
    priority: FHIRKitPrimitive<RequestPriority>? = nil,
    productX: ProductX? = nil,
    profile: FHIRKitPrimitive<Canonical>? = nil,
    publisher: FHIRKitPrimitive<FHIRKitString>? = nil,
    purpose: FHIRKitPrimitive<FHIRKitString>? = nil,
    quantity: Quantity? = nil,
    relatedArtifact: [RelatedArtifact]? = nil,
    reviewer: [ContactDetail]? = nil,
    specimenRequirement: [Reference]? = nil,
    status: FHIRKitPrimitive<PublicationStatus>,
    subjectX: SubjectX? = nil,
    subtitle: FHIRKitPrimitive<FHIRKitString>? = nil,
    text: Narrative? = nil,
    timingX: TimingX? = nil,
    title: FHIRKitPrimitive<FHIRKitString>? = nil,
    topic: [CodableConcept]? = nil,
    transform: FHIRKitPrimitive<Canonical>? = nil,
    url: FHIRKitPrimitive<FHIRKitURI>? = nil,
    usage: FHIRKitPrimitive<FHIRKitString>? = nil,
    useContext: [UsageContext]? = nil,
    version: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init(status: status)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.approvalDate = approvalDate
    self.author = author
    self.bodySite = bodySite
    self.code = code
    self.contact = contact
    self.contained = contained
    self.copyright = copyright
    self.date = date
    self.doNotPerform = doNotPerform
    self.dosage = dosage
    self.dynamicValue = dynamicValue
    self.editor = editor
    self.effectivePeriod = effectivePeriod
    self.endorser = endorser
    self.experimental = experimental
    self.identifier = identifier
    self.implicitRules = implicitRules
    self.intent = intent
    self.jurisdiction = jurisdiction
    self.kind = kind
    self.language = language
    self.lastReviewDate = lastReviewDate
    self.library = library
    self.location = location
    self.meta = meta
    self.name = name
    self.observationRequirement = observationRequirement
    self.observationResultRequirement = observationResultRequirement
    self.participant = participant
    self.priority = priority
    self.productX = productX
    self.publisher = publisher
    self.purpose = purpose
    self.quantity = quantity
    self.relatedArtifact = relatedArtifact
    self.reviewer = reviewer
    self.specimenRequirement = specimenRequirement
    self.status = status
    self.subjectX = subjectX
    self.subtitle = subtitle
    self.text = text
    self.timingX = timingX
    self.title = title
    self.topic = topic
    self.transform = transform
    self.url = url
    self.useContext = useContext
    self.version = version
  }
  
    // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case approvalDate; case _approvalDate
    case author
    case bodySite
    case code
    case contact
    case copyright; case _copyright
    case date; case _date
    case doNotPerform; case _doNotPerform
    case dosage
    case dynamicValue
    case editor
    case effectivePeriod
    case endorser
    case experimental; case _experimental
    case fhirDescription; case _fhirDescription
    case identifier
    case intent; case _intent
    case jurisdiction
    case kind; case _kind
    case lastReviewDate; case _lastReviewDate
    case library; case _library
    case location
    case name; case _name
    case observationRequirement
    case observationResultRequirement
    case participant
    case priority; case _priority
    case productCodableConcept
    case productReference
    case profile; case _profile
    case publisher; case _publisher
    case purpose; case _purpose
    case quantity
    case relatedArtifact
    case reviewer
    case specimenRequirement
    case status; case _status
    case subjectCodableConcept
    case subjectReference
    case subtitle; case _subtitle
    case timingAge
    case timingDateTime; case _timingDateTime
    case timingDuration
    case timingPeriod
    case timingRange
    case timingTiming
    case title; case _title
    case topic
    case transform; case _transform
    case url; case _url
    case usage; case _usage
    case useContext
    case version; case _version
  }
  
  // swiftlint:disable cyclomatic_complexity
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    // product
    var tempProductX: ProductX?
    if let productCodableConcept = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .productCodableConcept) {
      if tempProductX != nil {
        throw DecodingError.dataCorruptedError(forKey: .productCodableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"product\"")
      }
      tempProductX = .codableConcept(productCodableConcept)
    }
    if let productReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .productReference) {
      if tempProductX != nil {
        throw DecodingError.dataCorruptedError(forKey: .productReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"product\"")
      }
      tempProductX = .reference(productReference)
    }
    
    // subject
    var tempSubjectX: SubjectX?
    if let subjectCodableConcept = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .subjectCodableConcept) {
      if tempSubjectX != nil {
        throw DecodingError.dataCorruptedError(forKey: .subjectCodableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"subject\"")
      }
      tempSubjectX = .codableConcept(subjectCodableConcept)
    }
    
    if let subjectReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .subjectReference) {
      if tempSubjectX != nil {
        throw DecodingError.dataCorruptedError(forKey: .subjectReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"subject\"")
      }
      tempSubjectX = .reference(subjectReference)
    }
    // timing
    var tempTimingX: TimingX?
    if let timingAge = try Age(from: codingKeyContainer, forKeyIfPresent: .timingAge) {
      if tempTimingX != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingAge, in: codingKeyContainer, debugDescription: "More than one value provided for \"timing\"")
      }
      tempTimingX = .age(timingAge)
    }
    
    if let timingDateTime = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .timingDateTime, auxKey: ._timingDateTime) {
      if tempTimingX != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingDateTime, in: codingKeyContainer, debugDescription: "More than one value provided for \"timing\"")
      }
      tempTimingX = .dateTime(timingDateTime)
    }
    
    if let timingDuration = try Duration(from: codingKeyContainer, forKeyIfPresent: .timingDuration) {
      if tempTimingX != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingDuration, in: codingKeyContainer, debugDescription: "More than one value provided for \"timing\"")
      }
      tempTimingX = .duration(timingDuration)
    }
    
    if let timingRange = try Range(from: codingKeyContainer, forKeyIfPresent: .timingRange) {
      if tempTimingX != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingRange, in: codingKeyContainer, debugDescription: "More than one value provided for \"timing\"")
      }
      tempTimingX = .range(timingRange)
    }
    
    if let timingTiming = try Timing(from: codingKeyContainer, forKeyIfPresent: .timingTiming) {
      if tempTimingX != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingTiming, in: codingKeyContainer, debugDescription: "More than one value provided for \"timing\"")
      }
      tempTimingX = .timing(timingTiming)
    }
    
    self.approvalDate = try FHIRKitPrimitive<FHIRKitDate>(from: codingKeyContainer, forKeyIfPresent: .approvalDate, auxKey: ._approvalDate)
    self.author = try [ContactDetail](from: codingKeyContainer, forKeyIfPresent: .author)
    self.bodySite = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .bodySite)
    self.code = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .code)
    self.contact = try [ContactDetail](from: codingKeyContainer, forKeyIfPresent: .contact)
    self.copyright = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .copyright, auxKey: ._copyright)
    self.date = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .date, auxKey: ._date)
    self.doNotPerform = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .doNotPerform, auxKey: ._doNotPerform)
    self.dosage = try [Dosage](from: codingKeyContainer, forKeyIfPresent: .dosage)
    self.dynamicValue = try [ActivityDefinitionDynamicValue](from: codingKeyContainer, forKeyIfPresent: .dynamicValue)
    self.editor = try [ContactDetail](from: codingKeyContainer, forKeyIfPresent: .editor)
    self.effectivePeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .effectivePeriod)
    self.endorser = try [ContactDetail](from: codingKeyContainer, forKeyIfPresent: .endorser)
    self.experimental = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .experimental, auxKey: ._experimental)
    self.fhirDescription = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.identifier = try [Identifier](from: codingKeyContainer, forKeyIfPresent: .identifier)
    self.intent = try FHIRKitPrimitive<RequestIntent>(from: codingKeyContainer, forKeyIfPresent: .intent, auxKey: ._intent)
    self.jurisdiction = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .jurisdiction)
    self.kind = try FHIRKitPrimitive<RequestResourceType>(from: codingKeyContainer, forKeyIfPresent: .kind, auxKey: ._kind)
    self.lastReviewDate = try FHIRKitPrimitive<FHIRKitDate>(from: codingKeyContainer, forKeyIfPresent: .lastReviewDate, auxKey: ._lastReviewDate)
    self.library = try [FHIRKitPrimitive<Canonical>](from: codingKeyContainer, forKeyIfPresent: .library, auxKey: ._library)
    self.location = try Reference(from: codingKeyContainer, forKeyIfPresent: .location)
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .name, auxKey: ._name)
    self.observationRequirement = try [Reference](from: codingKeyContainer, forKeyIfPresent: .observationRequirement)
    self.observationResultRequirement = try [Reference](from: codingKeyContainer, forKeyIfPresent: .observationResultRequirement)
    self.participant = try [ActivityDefinitionParticipant](from: codingKeyContainer, forKeyIfPresent: .participant)
    self.priority = try FHIRKitPrimitive<RequestPriority>(from: codingKeyContainer, forKeyIfPresent: .priority, auxKey: ._priority)
    self.productX = tempProductX
    self.profile = try FHIRKitPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .profile, auxKey: ._profile)
    self.publisher = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .publisher, auxKey: ._publisher)
    self.purpose = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .purpose, auxKey: ._purpose)
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.relatedArtifact = try [RelatedArtifact](from: codingKeyContainer, forKeyIfPresent: .relatedArtifact)
    self.reviewer = try [ContactDetail](from: codingKeyContainer, forKeyIfPresent: .reviewer)
    self.specimenRequirement = try [Reference](from: codingKeyContainer, forKeyIfPresent: .specimenRequirement)
    self.status = try FHIRKitPrimitive<PublicationStatus>(from: codingKeyContainer, forKey: .status, auxKey: ._status)
    self.subjectX = tempSubjectX
    self.timingX = tempTimingX
    self.title = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .title, auxKey: ._title)
    self.topic = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .topic)
    self.transform = try FHIRKitPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .transform, auxKey: ._transform)
    self.url = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .url, auxKey: ._url)
    self.usage = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .usage, auxKey: ._usage)
    self.useContext = try [UsageContext](from: codingKeyContainer, forKeyIfPresent: .useContext)
    self.version = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .version, auxKey: ._version)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumProduct = productX {
      switch enumProduct {
      case .codableConcept(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .productCodableConcept)
      case .reference(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .productReference)
      }
    }
    
    if let enumSubject = subjectX {
      switch enumSubject {
      case .codableConcept(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .subjectCodableConcept)
      case .reference(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .subjectReference)
      }
    }
    
    if let enumTiming = timingX {
      switch enumTiming {
      case .age(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .timingAge)
      case .dateTime(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .timingDateTime, auxKey: ._timingDateTime)
      case .duration(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .timingDuration)
      case .period(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .timingPeriod)
      case .range(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .timingRange)
      case .timing(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .timingTiming)
      }
    }
    
    try approvalDate?.encode(on: &codingKeyContainer, forKey: .approvalDate, auxKey: ._approvalDate)
    try author?.encode(on: &codingKeyContainer, forKey: .author)
    try bodySite?.encode(on: &codingKeyContainer, forKey: .bodySite)
    try code?.encode(on: &codingKeyContainer, forKey: .code)
    try contact?.encode(on: &codingKeyContainer, forKey: .contact)
    try copyright?.encode(on: &codingKeyContainer, forKey: .copyright, auxKey: ._copyright)
    try date?.encode(on: &codingKeyContainer, forKey: .date, auxKey: ._date)
    try doNotPerform?.encode(on: &codingKeyContainer, forKey: .doNotPerform, auxKey: ._doNotPerform)
    try dosage?.encode(on: &codingKeyContainer, forKey: .dosage)
    try dynamicValue?.encode(on: &codingKeyContainer, forKey: .dynamicValue)
    try editor?.encode(on: &codingKeyContainer, forKey: .editor)
    try effectivePeriod?.encode(on: &codingKeyContainer, forKey: .effectivePeriod)
    try endorser?.encode(on: &codingKeyContainer, forKey: .endorser)
    try experimental?.encode(on: &codingKeyContainer, forKey: .experimental, auxKey: ._experimental)
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try identifier?.encode(on: &codingKeyContainer, forKey: .identifier)
    try intent?.encode(on: &codingKeyContainer, forKey: .intent, auxKey: ._intent)
    try jurisdiction?.encode(on: &codingKeyContainer, forKey: .jurisdiction)
    try kind?.encode(on: &codingKeyContainer, forKey: .kind, auxKey: ._kind)
    try lastReviewDate?.encode(on: &codingKeyContainer, forKey: .lastReviewDate, auxKey: ._lastReviewDate)
    try library?.encode(on: &codingKeyContainer, forKey: .library, auxKey: ._library)
    try location?.encode(on: &codingKeyContainer, forKey: .location)
    try name?.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try observationRequirement?.encode(on: &codingKeyContainer, forKey: .observationRequirement)
    try observationResultRequirement?.encode(on: &codingKeyContainer, forKey: .observationResultRequirement)
    try participant?.encode(on: &codingKeyContainer, forKey: .participant)
    try priority?.encode(on: &codingKeyContainer, forKey: .priority, auxKey: ._priority)
    try profile?.encode(on: &codingKeyContainer, forKey: .profile, auxKey: ._profile)
    try publisher?.encode(on: &codingKeyContainer, forKey: .publisher, auxKey: ._publisher)
    try purpose?.encode(on: &codingKeyContainer, forKey: .purpose, auxKey: .purpose)
    try quantity?.encode(on: &codingKeyContainer, forKey: .quantity)
    try relatedArtifact?.encode(on: &codingKeyContainer, forKey: .relatedArtifact)
    try reviewer?.encode(on: &codingKeyContainer, forKey: .reviewer)
    try specimenRequirement?.encode(on: &codingKeyContainer, forKey: .specimenRequirement)
    try status.encode(on: &codingKeyContainer, forKey: .status, auxKey: ._status)
    try subtitle?.encode(on: &codingKeyContainer, forKey: .subtitle, auxKey: ._subtitle)
    try title?.encode(on: &codingKeyContainer, forKey: .title, auxKey: ._title)
    try topic?.encode(on: &codingKeyContainer, forKey: .topic)
    try transform?.encode(on: &codingKeyContainer, forKey: .transform, auxKey: ._transform)
    try url?.encode(on: &codingKeyContainer, forKey: .url, auxKey: ._url)
    try usage?.encode(on: &codingKeyContainer, forKey: .usage, auxKey: ._usage)
    try useContext?.encode(on: &codingKeyContainer, forKey: .useContext)
    try version?.encode(on: &codingKeyContainer, forKey: .version, auxKey: ._version)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ActivityDefinition else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return approvalDate == _other.approvalDate
    && author == _other.author
    && bodySite == _other.bodySite
    && code == _other.code
    && contact == _other.contact
    && copyright == _other.copyright
    && date == _other.date
    && doNotPerform == _other.doNotPerform
    && dosage == _other.dosage
    && dynamicValue == _other.dynamicValue
    && editor == _other.editor
    && effectivePeriod == _other.effectivePeriod
    && endorser == _other.endorser
    && experimental == _other.experimental
    && fhirDescription == _other.fhirDescription
    && identifier == _other.identifier
    && intent == _other.intent
    && jurisdiction == _other.jurisdiction
    && kind == _other.kind
    && lastReviewDate == _other.lastReviewDate
    && library == _other.library
    && location == _other.location
    && name == _other.name
    && observationRequirement == _other.observationRequirement
    && observationResultRequirement == _other.observationResultRequirement
    && participant == _other.participant
    && priority == _other.priority
    && productX == _other.productX
    && profile == _other.profile
    && publisher == _other.publisher
    && purpose == _other.purpose
    && quantity == _other.quantity
    && relatedArtifact == _other.relatedArtifact
    && reviewer == _other.reviewer
    && specimenRequirement == _other.specimenRequirement
    && status == _other.status
    && subjectX == _other.subjectX
    && subtitle == _other.subtitle
    && timingX == _other.timingX
    && title == _other.title
    && topic == _other.topic
    && transform == _other.transform
    && url == _other.url
    && usage == _other.usage
    && useContext == _other.useContext
    && version == _other.version
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(approvalDate)
    hasher.combine(author)
    hasher.combine(bodySite)
    hasher.combine(code)
    hasher.combine(contact)
    hasher.combine(copyright)
    hasher.combine(date)
    hasher.combine(doNotPerform)
    hasher.combine(dosage)
    hasher.combine(dynamicValue)
    hasher.combine(editor)
    hasher.combine(effectivePeriod)
    hasher.combine(endorser)
    hasher.combine(experimental)
    hasher.combine(fhirDescription)
    hasher.combine(identifier)
    hasher.combine(intent)
    hasher.combine(jurisdiction)
    hasher.combine(kind)
    hasher.combine(lastReviewDate)
    hasher.combine(library)
    hasher.combine(location)
    hasher.combine(name)
    hasher.combine(observationRequirement)
    hasher.combine(participant)
    hasher.combine(priority)
    hasher.combine(productX)
    hasher.combine(profile)
    hasher.combine(publisher)
    hasher.combine(purpose)
    hasher.combine(quantity)
    hasher.combine(relatedArtifact)
    hasher.combine(reviewer)
    hasher.combine(specimenRequirement)
    hasher.combine(status)
    hasher.combine(subjectX)
    hasher.combine(subtitle)
    hasher.combine(timingX)
    hasher.combine(title)
    hasher.combine(topic)
    hasher.combine(transform)
    hasher.combine(url)
    hasher.combine(usage)
    hasher.combine(useContext)
    hasher.combine(version)
  }
}
