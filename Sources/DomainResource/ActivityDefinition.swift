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
  
  public enum _Product: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  public enum _Subject: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  public enum _Timing: Hashable {
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
  public var subject: _Subject?
  
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
  public var timing: _Timing?
  
  /// where the activity is to be performed
  public var location: Reference?
  
  /// who should participate in the activity
  public var participant: [ActivityDefinitionParticipant]?
  
  /// what is administered/supplied
  public var product: _Product?
  
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
    `extension`: [Extension]? = nil,
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
    modifierExtension: [Extension]? = nil,
    name: FHIRKitPrimitive<FHIRKitString>? = nil,
    observationRequirement: [Reference]? = nil,
    observationResultRequirement: [Reference]? = nil,
    participant: [ActivityDefinitionParticipant]? = nil,
    priority: FHIRKitPrimitive<RequestPriority>? = nil,
    product: _Product? = nil,
    profile: FHIRKitPrimitive<Canonical>? = nil,
    publisher: FHIRKitPrimitive<FHIRKitString>? = nil,
    purpose: FHIRKitPrimitive<FHIRKitString>? = nil,
    quantity: Quantity? = nil,
    relatedArtifact: [RelatedArtifact]? = nil,
    reviewer: [ContactDetail]? = nil,
    specimenRequirement: [Reference]? = nil,
    status: FHIRKitPrimitive<PublicationStatus>,
    subject: _Subject? = nil,
    subtitle: FHIRKitPrimitive<FHIRKitString>? = nil,
    text: Narrative? = nil,
    timing: _Timing? = nil,
    title: FHIRKitPrimitive<FHIRKitString>? = nil,
    topic: [CodableConcept]? = nil,
    transform: FHIRKitPrimitive<Canonical>? = nil,
    url: FHIRKitPrimitive<FHIRKitURI>? = nil,
    usage: FHIRKitPrimitive<FHIRKitString>? = nil,
    useContext: [UsageContext]? = nil,
    version: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init(status: status)
    self.`extension` = `extension`
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
    self.modifierExtension = modifierExtension
    self.name = name
    self.observationRequirement = observationRequirement
    self.observationResultRequirement = observationResultRequirement
    self.participant = participant
    self.priority = priority
    self.product = product
    self.publisher = publisher
    self.purpose = purpose
    self.quantity = quantity
    self.relatedArtifact = relatedArtifact
    self.reviewer = reviewer
    self.specimenRequirement = specimenRequirement
    self.status = status
    self.subject = subject
    self.subtitle = subtitle
    self.text = text
    self.timing = timing
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
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    // product
    var _product: _Product?
    if let productCodableConcept = try CodableConcept(from: _container, forKeyIfPresent: .productCodableConcept) {
      if _product != nil {
        throw DecodingError.dataCorruptedError(forKey: .productCodableConcept, in: _container, debugDescription: "More than one value provided for \"product\"")
      }
      _product = .codableConcept(productCodableConcept)
    }
    if let productReference = try Reference(from: _container, forKeyIfPresent: .productReference) {
      if _product != nil {
        throw DecodingError.dataCorruptedError(forKey: .productReference, in: _container, debugDescription: "More than one value provided for \"product\"")
      }
      _product = .reference(productReference)
    }
    
    // subject
    var _subject: _Subject?
    if let subjectCodableConcept = try CodableConcept(from: _container, forKeyIfPresent: .subjectCodableConcept) {
      if _subject != nil {
        throw DecodingError.dataCorruptedError(forKey: .subjectCodableConcept, in: _container, debugDescription: "More than one value provided for \"subject\"")
      }
      _subject = .codableConcept(subjectCodableConcept)
    }
    
    // timing
    var _timing: _Timing?
    if let timingAge = try Age(from: _container, forKeyIfPresent: .timingAge) {
      if _timing != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingAge, in: _container, debugDescription: "More than one value provided for \"timing\"")
      }
      _timing = .age(timingAge)
    }
    
    if let timingDateTime = try FHIRKitPrimitive<FHIRKitDateTime>(from: _container, forKeyIfPresent: .timingDateTime, auxiliaryKey: ._timingDateTime) {
      if _timing != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingDateTime, in: _container, debugDescription: "More than one value provided for \"timing\"")
      }
      _timing = .dateTime(timingDateTime)
    }
    
    if let timingDuration = try Duration(from: _container, forKeyIfPresent: .timingDuration) {
      if _timing != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingDuration, in: _container, debugDescription: "More than one value provided for \"timing\"")
      }
      _timing = .duration(timingDuration)
    }
    
    if let timingRange = try Range(from: _container, forKeyIfPresent: .timingRange) {
      if _timing != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingRange, in: _container, debugDescription: "More than one value provided for \"timing\"")
      }
      _timing = .range(timingRange)
    }
    
    if let timingTiming = try Timing(from: _container, forKeyIfPresent: .timingTiming) {
      if _timing != nil {
        throw DecodingError.dataCorruptedError(forKey: .timingTiming, in: _container, debugDescription: "More than one value provided for \"timing\"")
      }
      _timing = .timing(timingTiming)
    }
    
    self.approvalDate = try FHIRKitPrimitive<FHIRKitDate>(from: _container, forKeyIfPresent: .approvalDate, auxiliaryKey: ._approvalDate)
    self.author = try [ContactDetail](from: _container, forKeyIfPresent: .author)
    self.bodySite = try [CodableConcept](from: _container, forKeyIfPresent: .bodySite)
    self.code = try CodableConcept(from: _container, forKeyIfPresent: .code)
    self.contact = try [ContactDetail](from: _container, forKeyIfPresent: .contact)
    self.copyright = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .copyright, auxiliaryKey: ._copyright)
    self.date = try FHIRKitPrimitive<FHIRKitDateTime>(from: _container, forKeyIfPresent: .date, auxiliaryKey: ._date)
    self.doNotPerform = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKeyIfPresent: .doNotPerform, auxiliaryKey: ._doNotPerform)
    self.dosage = try [Dosage](from: _container, forKeyIfPresent: .dosage)
    self.dynamicValue = try [ActivityDefinitionDynamicValue](from: _container, forKeyIfPresent: .dynamicValue)
    self.editor = try [ContactDetail](from: _container, forKeyIfPresent: .editor)
    self.effectivePeriod = try Period(from: _container, forKeyIfPresent: .effectivePeriod)
    self.endorser = try [ContactDetail](from: _container, forKeyIfPresent: .endorser)
    self.experimental = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKeyIfPresent: .experimental, auxiliaryKey: ._experimental)
    self.fhirDescription = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .fhirDescription, auxiliaryKey: ._fhirDescription)
    self.identifier = try [Identifier](from: _container, forKeyIfPresent: .identifier)
    self.intent = try FHIRKitPrimitive<RequestIntent>(from: _container, forKeyIfPresent: .intent, auxiliaryKey: ._intent)
    self.jurisdiction = try [CodableConcept](from: _container, forKeyIfPresent: .jurisdiction)
    self.kind = try FHIRKitPrimitive<RequestResourceType>(from: _container, forKeyIfPresent: .kind, auxiliaryKey: ._kind)
    self.lastReviewDate = try FHIRKitPrimitive<FHIRKitDate>(from: _container, forKeyIfPresent: .lastReviewDate, auxiliaryKey: ._lastReviewDate)
    self.library = try [FHIRKitPrimitive<Canonical>](from: _container, forKeyIfPresent: .library, auxiliaryKey: ._library)
    self.location = try Reference(from: _container, forKeyIfPresent: .location)
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .name, auxiliaryKey: ._name)
    self.observationRequirement = try [Reference](from: _container, forKeyIfPresent: .observationRequirement)
    self.observationResultRequirement = try [Reference](from: _container, forKeyIfPresent: .observationResultRequirement)
    self.participant = try [ActivityDefinitionParticipant](from: _container, forKeyIfPresent: .participant)
    self.priority = try FHIRKitPrimitive<RequestPriority>(from: _container, forKeyIfPresent: .priority, auxiliaryKey: ._priority)
    self.product = _product
    self.profile = try FHIRKitPrimitive<Canonical>(from: _container, forKeyIfPresent: .profile, auxiliaryKey: ._profile)
    self.publisher = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .publisher, auxiliaryKey: ._publisher)
    self.purpose = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .purpose, auxiliaryKey: ._purpose)
    self.quantity = try Quantity(from: _container, forKeyIfPresent: .quantity)
    self.relatedArtifact = try [RelatedArtifact](from: _container, forKeyIfPresent: .relatedArtifact)
    self.reviewer = try [ContactDetail](from: _container, forKeyIfPresent: .reviewer)
    self.specimenRequirement = try [Reference](from: _container, forKeyIfPresent: .specimenRequirement)
    self.status = try FHIRKitPrimitive<PublicationStatus>(from: _container, forKey: .status, auxiliaryKey: ._status)
    self.subject = _subject
    self.timing = _timing
    self.title = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .title, auxiliaryKey: ._title)
    self.topic = try [CodableConcept](from: _container, forKeyIfPresent: .topic)
    self.transform = try FHIRKitPrimitive<Canonical>(from: _container, forKeyIfPresent: .transform, auxiliaryKey: ._transform)
    self.url = try FHIRKitPrimitive<FHIRKitURI>(from: _container, forKeyIfPresent: .url, auxiliaryKey: ._url)
    self.usage = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .usage, auxiliaryKey: ._usage)
    self.useContext = try [UsageContext](from: _container, forKeyIfPresent: .useContext)
    self.version = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .version, auxiliaryKey: ._version)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    if let _product = product {
      switch _product {
        case .codableConcept(let _value):
          try _value.encode(on: &_container, forKey: .productCodableConcept)
        case .reference(let _value):
          try _value.encode(on: &_container, forKey: .productReference)
      }
    }
    
    if let _subject = subject {
      switch _subject {
        case .codableConcept(let _value):
          try _value.encode(on: &_container, forKey: .subjectCodableConcept)
        case .reference(let _value):
          try _value.encode(on: &_container, forKey: .subjectReference)
      }
    }
    
    if let _timing = timing {
      switch _timing {
        case .age(let _value):
          try _value.encode(on: &_container, forKey: .timingAge)
        case .dateTime(let _value):
          try _value.encode(on: &_container, forKey: .timingDateTime, auxiliaryKey: ._timingDateTime)
        case .duration(let _value):
          try _value.encode(on: &_container, forKey: .timingDuration)
        case .period(let _value):
          try _value.encode(on: &_container, forKey: .timingPeriod)
        case .range(let _value):
          try _value.encode(on: &_container, forKey: .timingRange)
        case .timing(let _value):
          try _value.encode(on: &_container, forKey: .timingTiming)
      }
    }
    
    try approvalDate?.encode(on: &_container, forKey: .approvalDate, auxiliaryKey: ._approvalDate)
    try author?.encode(on: &_container, forKey: .author)
    try bodySite?.encode(on: &_container, forKey: .bodySite)
    try code?.encode(on: &_container, forKey: .code)
    try contact?.encode(on: &_container, forKey: .contact)
    try copyright?.encode(on: &_container, forKey: .copyright, auxiliaryKey: ._copyright)
    try date?.encode(on: &_container, forKey: .date, auxiliaryKey: ._date)
    try doNotPerform?.encode(on: &_container, forKey: .doNotPerform, auxiliaryKey: ._doNotPerform)
    try dosage?.encode(on: &_container, forKey: .dosage)
    try dynamicValue?.encode(on: &_container, forKey: .dynamicValue)
    try editor?.encode(on: &_container, forKey: .editor)
    try effectivePeriod?.encode(on: &_container, forKey: .effectivePeriod)
    try endorser?.encode(on: &_container, forKey: .endorser)
    try experimental?.encode(on: &_container, forKey: .experimental, auxiliaryKey: ._experimental)
    try fhirDescription?.encode(on: &_container, forKey: .fhirDescription, auxiliaryKey: ._fhirDescription)
    try identifier?.encode(on: &_container, forKey: .identifier)
    try intent?.encode(on: &_container, forKey: .intent, auxiliaryKey: ._intent)
    try jurisdiction?.encode(on: &_container, forKey: .jurisdiction)
    try kind?.encode(on: &_container, forKey: .kind, auxiliaryKey: ._kind)
    try lastReviewDate?.encode(on: &_container, forKey: .lastReviewDate, auxiliaryKey: ._lastReviewDate)
    try library?.encode(on: &_container, forKey: .library, auxiliaryKey: ._library)
    try location?.encode(on: &_container, forKey: .location)
    try name?.encode(on: &_container, forKey: .name, auxiliaryKey: ._name)
    try observationRequirement?.encode(on: &_container, forKey: .observationRequirement)
    try observationResultRequirement?.encode(on: &_container, forKey: .observationResultRequirement)
    try participant?.encode(on: &_container, forKey: .participant)
    try priority?.encode(on: &_container, forKey: .priority, auxiliaryKey: ._priority)
    try profile?.encode(on: &_container, forKey: .profile, auxiliaryKey: ._profile)
    try publisher?.encode(on: &_container, forKey: .publisher, auxiliaryKey: ._publisher)
    try purpose?.encode(on: &_container, forKey: .purpose, auxiliaryKey: .purpose)
    try quantity?.encode(on: &_container, forKey: .quantity)
    try relatedArtifact?.encode(on: &_container, forKey: .relatedArtifact)
    try reviewer?.encode(on: &_container, forKey: .reviewer)
    try specimenRequirement?.encode(on: &_container, forKey: .specimenRequirement)
    try status.encode(on: &_container, forKey: .status, auxiliaryKey: ._status)
    try subtitle?.encode(on: &_container, forKey: .subtitle, auxiliaryKey: ._subtitle)
    try title?.encode(on: &_container, forKey: .title, auxiliaryKey: ._title)
    try topic?.encode(on: &_container, forKey: .topic)
    try transform?.encode(on: &_container, forKey: .transform, auxiliaryKey: ._transform)
    try url?.encode(on: &_container, forKey: .url, auxiliaryKey: ._url)
    try usage?.encode(on: &_container, forKey: .usage, auxiliaryKey: ._usage)
    try useContext?.encode(on: &_container, forKey: .useContext)
    try version?.encode(on: &_container, forKey: .version, auxiliaryKey: ._version)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
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
    && product == _other.product
    && profile == _other.profile
    && publisher == _other.publisher
    && purpose == _other.purpose
    && quantity == _other.quantity
    && relatedArtifact == _other.relatedArtifact
    && reviewer == _other.reviewer
    && specimenRequirement == _other.specimenRequirement
    && status == _other.status
    && subject == _other.subject
    && subtitle == _other.subtitle
    && timing == _other.timing
    && title == _other.title
    && topic == _other.topic
    && transform == _other.transform
    && url == _other.url
    && usage == _other.usage
    && useContext == _other.useContext
    && version == _other.version
  }
  
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
    hasher.combine(product)
    hasher.combine(profile)
    hasher.combine(publisher)
    hasher.combine(purpose)
    hasher.combine(quantity)
    hasher.combine(relatedArtifact)
    hasher.combine(reviewer)
    hasher.combine(specimenRequirement)
    hasher.combine(status)
    hasher.combine(subtitle)
    hasher.combine(timing)
    hasher.combine(title)
    hasher.combine(topic)
    hasher.combine(transform)
    hasher.combine(url)
    hasher.combine(usage)
    hasher.combine(useContext)
    hasher.combine(version)
  }
}
