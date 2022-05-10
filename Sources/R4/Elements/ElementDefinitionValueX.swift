//
//  ElementDefinitionValueX.swift
//  Asclepius
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

import AsclepiusCore

open class ElementDefinitionValueX: Element {
  public var address: Address?
  public var age: Age?
  public var annotation: Annotation?
  public var attachment: Attachment?
  public var base64binary: AsclepiusPrimitive<AsclepiusBase64Binary>?
  public var boolean: AsclepiusPrimitive<AsclepiusBool>?
  public var canonical: AsclepiusPrimitive<Canonical>?
  public var code: AsclepiusPrimitive<AsclepiusString>?
  public var codeableConcept: CodeableConcept?
  public var coding: Coding?
  public var contactDetail: ContactDetail?
  public var contactPoint: ContactPoint?
  public var contributor: Contributor?
  public var count: Count?
  public var dataRequirement: DataRequirement?
  public var date: AsclepiusPrimitive<AsclepiusDate>?
  public var dateTime: AsclepiusPrimitive<AsclepiusDateTime>?
  public var decimal: AsclepiusPrimitive<AsclepiusDecimal>?
  public var distance: Distance?
  public var dosage: Dosage?
  public var duration: Duration?
  public var expression: Expression?
  public var humanName: HumanName?
  public var id: AsclepiusPrimitive<AsclepiusString>?
  public var identifier: Identifier?
  public var instant: AsclepiusPrimitive<AsclepiusInstant>?
  public var integer: AsclepiusPrimitive<AsclepiusInteger>?
  public var markdown: AsclepiusPrimitive<AsclepiusString>?
  public var meta: Meta?
  public var money: Money?
  public var oid: AsclepiusPrimitive<AsclepiusURI>?
  public var parameterDefinition: ParameterDefinition?
  public var period: Period?
  public var positiveInteger: AsclepiusPrimitive<AsclepiusPositiveInteger>?
  public var quantity: Quantity?
  public var range: Range?
  public var ratio: Ratio?
  public var reference: Reference?
  public var relatedArtifact: RelatedArtifact?
  public var sampledData: SampledData?
  public var signature: Signature?
  public var string: AsclepiusPrimitive<AsclepiusString>?
  public var time: AsclepiusPrimitive<AsclepiusTime>?
  public var timing: Timing?
  public var triggerDefinition: TriggerDefinition?
  public var unsignedInteger: AsclepiusPrimitive<AsclepiusUnsignedInteger>?
  public var uri: AsclepiusPrimitive<AsclepiusURI>?
  public var url: AsclepiusPrimitive<AsclepiusURI>?
  public var usageContext: UsageContext?
  public var uuid: AsclepiusPrimitive<AsclepiusURI>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    address: Address? = nil,
    age: Age? = nil,
    annotation: Annotation? = nil,
    attachment: Attachment? = nil,
    base64binary: AsclepiusPrimitive<AsclepiusBase64Binary>? = nil,
    boolean: AsclepiusPrimitive<AsclepiusBool>? = nil,
    canonical: AsclepiusPrimitive<Canonical>? = nil,
    code: AsclepiusPrimitive<AsclepiusString>? = nil,
    codeableConcept: CodeableConcept? = nil,
    coding: Coding? = nil,
    contactDetail: ContactDetail? = nil,
    contactPoint: ContactPoint? = nil,
    contributor: Contributor? = nil,
    count: Count? = nil,
    dataRequirement: DataRequirement? = nil,
    date: AsclepiusPrimitive<AsclepiusDate>? = nil,
    dateTime: AsclepiusPrimitive<AsclepiusDateTime>? = nil,
    decimal: AsclepiusPrimitive<AsclepiusDecimal>? = nil,
    distance: Distance? = nil,
    dosage: Dosage? = nil,
    duration: Duration? = nil,
    expression: Expression? = nil,
    humanName: HumanName? = nil,
    id: AsclepiusPrimitive<AsclepiusString>? = nil,
    identifier: Identifier? = nil,
    instant: AsclepiusPrimitive<AsclepiusInstant>? = nil,
    integer: AsclepiusPrimitive<AsclepiusInteger>? = nil,
    markdown: AsclepiusPrimitive<AsclepiusString>? = nil,
    meta: Meta? = nil,
    money: Money? = nil,
    oid: AsclepiusPrimitive<AsclepiusURI>? = nil,
    parameterDefinition: ParameterDefinition? = nil,
    period: Period? = nil,
    positiveInteger: AsclepiusPrimitive<AsclepiusPositiveInteger>? = nil,
    quantity: Quantity? = nil,
    range: Range? = nil,
    ratio: Ratio? = nil,
    reference: Reference? = nil,
    relatedArtifact: RelatedArtifact? = nil,
    sampledData: SampledData? = nil,
    signature: Signature? = nil,
    string: AsclepiusPrimitive<AsclepiusString>? = nil,
    time: AsclepiusPrimitive<AsclepiusTime>? = nil,
    timing: Timing? = nil,
    triggerDefinition: TriggerDefinition? = nil,
    unsignedInteger: AsclepiusPrimitive<AsclepiusUnsignedInteger>? = nil,
    uri: AsclepiusPrimitive<AsclepiusURI>? = nil,
    url: AsclepiusPrimitive<AsclepiusURI>? = nil,
    usageContext: UsageContext? = nil,
    uuid: AsclepiusPrimitive<AsclepiusURI>? = nil
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
    self.codeableConcept = codeableConcept
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
    self.id = id
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
    self.signature = signature
    self.string = string
    self.time = time
    self.timing = timing
    self.triggerDefinition = triggerDefinition
    self.unsignedInteger = unsignedInteger
    self.uri = uri
    self.url = url
    self.usageContext = usageContext
    self.uuid = uuid
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case address
    case age
    case annotation
    case attachment
    case base64Binary; case _base64Binary
    case boolean; case _boolean
    case canonical; case _canonical
    case code; case _code
    case codeableConcept
    case coding
    case contactDetail
    case contactPoint
    case contributor
    case count
    case dataRequirement
    case date; case _date
    case dateTime; case _dateTime
    case decimal; case _decimal
    case distance
    case dosage
    case duration
    case expression
    case humanName
    case id; case _id
    case identifier
    case instant; case _instant
    case integer; case _integer
    case markdown; case _markdown
    case meta
    case money
    case oid; case _oid
    case parameterDefinition
    case period
    case positiveInteger; case _positiveInteger
    case quantity
    case range
    case ratio
    case reference
    case relatedArtifact
    case sampledData
    case signature
    case string; case _string
    case time; case _time
    case timing
    case triggerDefinition
    case unsignedInteger; case _unsignedInteger
    case uri; case _uri
    case url; case _url
    case usageContext
    case uuid; case _uuid
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.address = try Address(from: codingKeyContainer, forKeyIfPresent: .address)
    self.age = try Age(from: codingKeyContainer, forKeyIfPresent: .age)
    self.annotation = try Annotation(from: codingKeyContainer, forKeyIfPresent: .annotation)
    self.attachment = try Attachment(from: codingKeyContainer, forKeyIfPresent: .attachment)
    self.base64binary = try AsclepiusPrimitive<AsclepiusBase64Binary>(from: codingKeyContainer, forKeyIfPresent: .base64Binary, auxKey: ._base64Binary)
    self.boolean = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .boolean, auxKey: ._boolean)
    self.canonical = try AsclepiusPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .canonical, auxKey: ._canonical)
    self.code = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .code, auxKey: ._code)
    self.codeableConcept = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .codeableConcept)
    self.coding = try Coding(from: codingKeyContainer, forKeyIfPresent: .coding)
    self.contactDetail = try ContactDetail(from: codingKeyContainer, forKeyIfPresent: .contactDetail)
    self.contactPoint = try ContactPoint(from: codingKeyContainer, forKeyIfPresent: .contactPoint)
    self.contributor = try Contributor(from: codingKeyContainer, forKeyIfPresent: .contributor)
    self.count = try Count(from: codingKeyContainer, forKeyIfPresent: .count)
    self.dataRequirement = try DataRequirement(from: codingKeyContainer, forKeyIfPresent: .dataRequirement)
    self.date = try AsclepiusPrimitive<AsclepiusDate>(from: codingKeyContainer, forKeyIfPresent: .date, auxKey: ._date)
    self.dateTime = try AsclepiusPrimitive<AsclepiusDateTime>(from: codingKeyContainer, forKeyIfPresent: .dateTime, auxKey: ._dateTime)
    self.decimal = try AsclepiusPrimitive<AsclepiusDecimal>(from: codingKeyContainer, forKeyIfPresent: .decimal, auxKey: ._decimal)
    self.distance = try Distance(from: codingKeyContainer, forKeyIfPresent: .distance)
    self.dosage = try Dosage(from: codingKeyContainer, forKeyIfPresent: .dosage)
    self.duration = try Duration(from: codingKeyContainer, forKeyIfPresent: .duration)
    self.expression = try Expression(from: codingKeyContainer, forKeyIfPresent: .expression)
    self.humanName = try HumanName(from: codingKeyContainer, forKeyIfPresent: .humanName)
    self.id = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .id, auxKey: ._id)
    self.identifier = try Identifier(from: codingKeyContainer, forKeyIfPresent: .identifier)
    self.instant = try AsclepiusPrimitive<AsclepiusInstant>(from: codingKeyContainer, forKeyIfPresent: .instant, auxKey: ._instant)
    self.integer = try AsclepiusPrimitive<AsclepiusInteger>(from: codingKeyContainer, forKeyIfPresent: .integer, auxKey: ._integer)
    self.markdown = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .markdown, auxKey: ._markdown)
    self.meta = try Meta(from: codingKeyContainer, forKeyIfPresent: .meta)
    self.money = try Money(from: codingKeyContainer, forKeyIfPresent: .money)
    self.oid = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .oid, auxKey: ._oid)
    self.parameterDefinition = try ParameterDefinition(from: codingKeyContainer, forKeyIfPresent: .parameterDefinition)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    self.positiveInteger = try AsclepiusPrimitive<AsclepiusPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: .positiveInteger, auxKey: ._positiveInteger)
    self.quantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .quantity)
    self.range = try Range(from: codingKeyContainer, forKeyIfPresent: .range)
    self.ratio = try Ratio(from: codingKeyContainer, forKeyIfPresent: .ratio)
    self.reference = try Reference(from: codingKeyContainer, forKeyIfPresent: .reference)
    self.relatedArtifact = try RelatedArtifact(from: codingKeyContainer, forKeyIfPresent: .relatedArtifact)
    self.sampledData = try SampledData(from: codingKeyContainer, forKeyIfPresent: .sampledData)
    self.signature = try Signature(from: codingKeyContainer, forKeyIfPresent: .signature)
    self.time = try AsclepiusPrimitive<AsclepiusTime>(from: codingKeyContainer, forKeyIfPresent: .time, auxKey: ._time)
    self.timing = try Timing(from: codingKeyContainer, forKeyIfPresent: .timing)
    self.triggerDefinition = try TriggerDefinition(from: codingKeyContainer, forKeyIfPresent: .triggerDefinition)
    self.uri = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .uri, auxKey: ._uri)
    self.url = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .url, auxKey: ._url)
    self.usageContext = try UsageContext(from: codingKeyContainer, forKeyIfPresent: .usageContext)
    self.uuid = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .uuid, auxKey: ._uuid)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try address?.encode(on: &codingKeyContainer, forKey: .address)
    try age?.encode(on: &codingKeyContainer, forKey: .age)
    try annotation?.encode(on: &codingKeyContainer, forKey: .annotation)
    try attachment?.encode(on: &codingKeyContainer, forKey: .attachment)
    try base64binary?.encode(on: &codingKeyContainer, forKey: .base64Binary, auxKey: ._base64Binary)
    try boolean?.encode(on: &codingKeyContainer, forKey: .boolean, auxKey: ._boolean)
    try canonical?.encode(on: &codingKeyContainer, forKey: .canonical, auxKey: ._canonical)
    try code?.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    try codeableConcept?.encode(on: &codingKeyContainer, forKey: .codeableConcept)
    try coding?.encode(on: &codingKeyContainer, forKey: .coding)
    try contactDetail?.encode(on: &codingKeyContainer, forKey: .contactDetail)
    try contactPoint?.encode(on: &codingKeyContainer, forKey: .contactPoint)
    try contributor?.encode(on: &codingKeyContainer, forKey: .contributor)
    try count?.encode(on: &codingKeyContainer, forKey: .count)
    try dataRequirement?.encode(on: &codingKeyContainer, forKey: .dataRequirement)
    try date?.encode(on: &codingKeyContainer, forKey: .date, auxKey: ._date)
    try dateTime?.encode(on: &codingKeyContainer, forKey: .dateTime, auxKey: ._dateTime)
    try decimal?.encode(on: &codingKeyContainer, forKey: .decimal, auxKey: ._decimal)
    try distance?.encode(on: &codingKeyContainer, forKey: .distance)
    try dosage?.encode(on: &codingKeyContainer, forKey: .dosage)
    try duration?.encode(on: &codingKeyContainer, forKey: .duration)
    try expression?.encode(on: &codingKeyContainer, forKey: .expression)
    try humanName?.encode(on: &codingKeyContainer, forKey: .humanName)
    try id?.encode(on: &codingKeyContainer, forKey: .id, auxKey: ._id)
    try identifier?.encode(on: &codingKeyContainer, forKey: .identifier)
    try instant?.encode(on: &codingKeyContainer, forKey: .instant, auxKey: ._instant)
    try integer?.encode(on: &codingKeyContainer, forKey: .integer, auxKey: ._integer)
    try markdown?.encode(on: &codingKeyContainer, forKey: .markdown, auxKey: ._markdown)
    try meta?.encode(on: &codingKeyContainer, forKey: .meta)
    try money?.encode(on: &codingKeyContainer, forKey: .money)
    try oid?.encode(on: &codingKeyContainer, forKey: .oid, auxKey: ._oid)
    try parameterDefinition?.encode(on: &codingKeyContainer, forKey: .parameterDefinition)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    try positiveInteger?.encode(on: &codingKeyContainer, forKey: .positiveInteger, auxKey: ._positiveInteger)
    try quantity?.encode(on: &codingKeyContainer, forKey: .quantity)
    try range?.encode(on: &codingKeyContainer, forKey: .range)
    try ratio?.encode(on: &codingKeyContainer, forKey: .ratio)
    try reference?.encode(on: &codingKeyContainer, forKey: .reference)
    try relatedArtifact?.encode(on: &codingKeyContainer, forKey: .relatedArtifact)
    try sampledData?.encode(on: &codingKeyContainer, forKey: .sampledData)
    try signature?.encode(on: &codingKeyContainer, forKey: .signature)
    try string?.encode(on: &codingKeyContainer, forKey: .string, auxKey: ._string)
    try time?.encode(on: &codingKeyContainer, forKey: .time, auxKey: ._time)
    try timing?.encode(on: &codingKeyContainer, forKey: .timing)
    try triggerDefinition?.encode(on: &codingKeyContainer, forKey: .triggerDefinition)
    try unsignedInteger?.encode(on: &codingKeyContainer, forKey: .unsignedInteger, auxKey: ._unsignedInteger)
    try uri?.encode(on: &codingKeyContainer, forKey: .uri, auxKey: ._uri)
    try url?.encode(on: &codingKeyContainer, forKey: .url, auxKey: ._url)
    try usageContext?.encode(on: &codingKeyContainer, forKey: .usageContext)
    try uuid?.encode(on: &codingKeyContainer, forKey: .uuid, auxKey: ._uuid)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ElementDefinitionValueX else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return address == _other.address
    && age == _other.age
    && annotation == _other.annotation
    && attachment == _other.attachment
    && base64binary == _other.base64binary
    && boolean == _other.boolean
    && canonical == _other.canonical
    && code == _other.code
    && codeableConcept == _other.codeableConcept
    && coding == _other.coding
    && contactDetail == _other.contactDetail
    && contactPoint == _other.contactPoint
    && contributor == _other.contributor
    && count == _other.count
    && dataRequirement == _other.dataRequirement
    && date == _other.date
    && dateTime == _other.dateTime
    && decimal == _other.decimal
    && distance == _other.distance
    && dosage == _other.dosage
    && duration == _other.duration
    && expression == _other.expression
    && humanName == _other.humanName
    && id == _other.id
    && identifier == _other.identifier
    && instant == _other.instant
    && integer == _other.integer
    && markdown == _other.markdown
    && meta == _other.meta
    && money == _other.money
    && oid == _other.oid
    && parameterDefinition == _other.parameterDefinition
    && period == _other.period
    && positiveInteger == _other.positiveInteger
    && quantity == _other.quantity
    && range == _other.range
    && ratio == _other.ratio
    && reference == _other.reference
    && relatedArtifact == _other.relatedArtifact
    && sampledData == _other.sampledData
    && signature == _other.signature
    && string == _other.string
    && time == _other.time
    && timing == _other.timing
    && triggerDefinition == _other.triggerDefinition
    && unsignedInteger == _other.unsignedInteger
    && uri == _other.uri
    && url == _other.url
    && usageContext == _other.usageContext
    && uuid == _other.uuid
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(address)
    hasher.combine(age)
    hasher.combine(annotation)
    hasher.combine(attachment)
    hasher.combine(base64binary)
    hasher.combine(boolean)
    hasher.combine(canonical)
    hasher.combine(code)
    hasher.combine(codeableConcept)
    hasher.combine(coding)
    hasher.combine(contactDetail)
    hasher.combine(contactPoint)
    hasher.combine(contributor)
    hasher.combine(count)
    hasher.combine(dataRequirement)
    hasher.combine(date)
    hasher.combine(dateTime)
    hasher.combine(decimal)
    hasher.combine(distance)
    hasher.combine(dosage)
    hasher.combine(duration)
    hasher.combine(expression)
    hasher.combine(humanName)
    hasher.combine(id)
    hasher.combine(identifier)
    hasher.combine(instant)
    hasher.combine(integer)
    hasher.combine(markdown)
    hasher.combine(meta)
    hasher.combine(money)
    hasher.combine(oid)
    hasher.combine(parameterDefinition)
    hasher.combine(period)
    hasher.combine(positiveInteger)
    hasher.combine(quantity)
    hasher.combine(range)
    hasher.combine(ratio)
    hasher.combine(reference)
    hasher.combine(relatedArtifact)
    hasher.combine(sampledData)
    hasher.combine(signature)
    hasher.combine(string)
    hasher.combine(time)
    hasher.combine(timing)
    hasher.combine(triggerDefinition)
    hasher.combine(unsignedInteger)
    hasher.combine(uri)
    hasher.combine(url)
    hasher.combine(usageContext)
    hasher.combine(uuid)
  }
}
