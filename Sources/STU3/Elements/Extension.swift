//
//  Extension.swift
//  Asclepius
//  Module: STU3
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

/**
 Optional Extensions Element - Found in all FHIR resources.
 
 Every element in a resource or data type includes an optional "extension" child element that may be present any
 number of times.
 
 https://www.hl7.org/fhir/extensibility.html
 */
open class Extension: Element {
  /// Value of extension
  public enum ValueX: Hashable {
    case address(Address)
    case age(Age)
    case annotation(Annotation)
    case attachment(Attachment)
    case base64Binary(AsclepiusPrimitive<AsclepiusBase64Binary>)
    case boolean(AsclepiusPrimitive<AsclepiusBool>)
    case canonical(AsclepiusPrimitive<Canonical>)
    case code(AsclepiusPrimitive<AsclepiusString>)
    case codeableConcept(CodeableConcept)
    case coding(Coding)
    case contactDetail(ContactDetail)
    case contactPoint(ContactPoint)
    case contributor(Contributor)
    case count(Count)
    case dataRequirement(DataRequirement)
    case date(AsclepiusPrimitive<AsclepiusDate>)
    case dateTime(AsclepiusPrimitive<AsclepiusDateTime>)
    case decimal(AsclepiusPrimitive<AsclepiusDecimal>)
    case distance(Distance)
    case dosage(Dosage)
    case duration(Duration)
    case expression(Expression)
    case humanName(HumanName)
    case id(AsclepiusPrimitive<AsclepiusString>)
    case identifier(Identifier)
    case instant(AsclepiusPrimitive<AsclepiusInstant>)
    case integer(AsclepiusPrimitive<AsclepiusInteger>)
    case markdown(AsclepiusPrimitive<AsclepiusString>)
    case meta(Meta)
    case money(Money)
    case oid(AsclepiusPrimitive<AsclepiusURI>)
    case parameterDefinition(ParameterDefinition)
    case period(Period)
    case positiveInt(AsclepiusPrimitive<AsclepiusPositiveInteger>)
    case quantity(Quantity)
    case range(Range)
    case ratio(Ratio)
    case reference(Reference)
    case relatedArtifact(RelatedArtifact)
    case sampledData(SampledData)
    case signature(Signature)
    case string(AsclepiusPrimitive<AsclepiusString>)
    case time(AsclepiusPrimitive<AsclepiusTime>)
    case timing(Timing)
    case triggerDefinition(TriggerDefinition)
    case unsignedInt(AsclepiusPrimitive<AsclepiusUnsignedInteger>)
    case uri(AsclepiusPrimitive<AsclepiusURI>)
    case url(AsclepiusPrimitive<AsclepiusURI>)
    case usageContext(UsageContext)
    case uuid(AsclepiusPrimitive<AsclepiusURI>)
  }
  
  /// identifies the meaning of the extension
  public var url: AsclepiusPrimitive<AsclepiusURI>
  
  /// Value of extension
  public var valueX: ValueX?

  public init(url: AsclepiusPrimitive<AsclepiusURI>) {
    self.url = url
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    url: AsclepiusPrimitive<AsclepiusURI>,
    valueX: ValueX? = nil
  ) {
    self.init(url: url)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.valueX = valueX
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case url; case _url
    case valueAddress
    case valueAge
    case valueAnnotation
    case valueAttachment
    case valueBase64Binary; case _valueBase64Binary
    case valueBoolean; case _valueBoolean
    case valueCanonical; case _valueCanonical
    case valueCode; case _valueCode
    case valueCodeableConcept
    case valueCoding
    case valueContactDetail
    case valueContactPoint
    case valueContributor
    case valueCount
    case valueDataRequirement
    case valueDate; case _valueDate
    case valueDateTime; case _valueDateTime
    case valueDecimal; case _valueDecimal
    case valueDistance
    case valueDosage
    case valueDuration
    case valueExpression
    case valueHumanName
    case valueId; case _valueId
    case valueIdentifier
    case valueInstant; case _valueInstant
    case valueInteger; case _valueInteger
    case valueMarkdown; case _valueMarkdown
    case valueMeta
    case valueMoney
    case valueOid; case _valueOid
    case valueParameterDefinition
    case valuePeriod
    case valuePositiveInt; case _valuePositiveInt
    case valueQuantity
    case valueRange
    case valueRatio
    case valueReference
    case valueRelatedArtifact
    case valueSampledData
    case valueSignature
    case valueString; case _valueString
    case valueTime; case _valueTime
    case valueTiming
    case valueTriggerDefinition
    case valueUnsignedInt; case _valueUnsignedInt
    case valueUri; case _valueUri
    case valueUrl; case _valueUrl
    case valueUsageContext
    case valueUuid; case _valueUuid
  }
  
  // swiftlint:disable cyclomatic_complexity
  /// Initializer for Decodable
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    let debugDescription: String = "More than one value provided for \"value\""
    
    self.url = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKey: .url, auxKey: ._url)
    
    var tempValueX: ValueX?
    
    // Address
    if let valueAddress = try Address(from: codingKeyContainer, forKeyIfPresent: .valueAddress) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAddress, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .address(valueAddress)
    }
    
    // Age
    if let valueAge = try Age(from: codingKeyContainer, forKeyIfPresent: .valueAge) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAge, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .age(valueAge)
    }
    
    // Annotation
    if let valueAnnotation = try Annotation(from: codingKeyContainer, forKeyIfPresent: .valueAnnotation) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAnnotation, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .annotation(valueAnnotation)
    }
    
    // Attachment
    if let valueAttachment = try Attachment(from: codingKeyContainer, forKeyIfPresent: .valueAttachment) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAttachment, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .attachment(valueAttachment)
    }
    
    // Base64Binary
    if let valueBase64Binary = try AsclepiusPrimitive<AsclepiusBase64Binary>(from: codingKeyContainer, forKeyIfPresent: .valueBase64Binary, auxKey: ._valueBase64Binary) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBase64Binary, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .base64Binary(valueBase64Binary)
    }

    // Boolean
    if let valueBoolean = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .valueBoolean, auxKey: ._valueBoolean) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBoolean, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .boolean(valueBoolean)
    }
    
    // Canonical
    if let valueCanonical = try AsclepiusPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .valueCanonical, auxKey: ._valueCanonical) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCanonical, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .canonical(valueCanonical)
    }
    
    // Code
    if let valueCode = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .valueCode, auxKey: ._valueCode) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCode, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .code(valueCode)
    }
    
    // CodeableConcept
    if let valueCodeableConcept = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .valueCodeableConcept) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCodeableConcept, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .codeableConcept(valueCodeableConcept)
    }
    
    // Coding
    if let valueCoding = try Coding(from: codingKeyContainer, forKeyIfPresent: .valueCoding) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCoding, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .coding(valueCoding)
    }
    
    // ContactDetail
    if let valueContactDetail = try ContactDetail(from: codingKeyContainer, forKeyIfPresent: .valueContactDetail) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueContactDetail, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .contactDetail(valueContactDetail)
    }
    
    // ContactPoint
    if let valueContactPoint = try ContactPoint(from: codingKeyContainer, forKeyIfPresent: .valueContactPoint) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueContactPoint, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .contactPoint(valueContactPoint)
    }
    
    // Contributor
    if let valueContributor = try Contributor(from: codingKeyContainer, forKeyIfPresent: .valueContributor) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueContributor, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .contributor(valueContributor)
    }
    
    // Count
    if let valueCount = try Count(from: codingKeyContainer, forKeyIfPresent: .valueCount) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCount, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .count(valueCount)
    }
    
    // DataRequirement
    if let valueDataRequirement = try DataRequirement(from: codingKeyContainer, forKeyIfPresent: .valueDataRequirement) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDataRequirement, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .dataRequirement(valueDataRequirement)
    }
    
    // Date
    if let valueDate = try AsclepiusPrimitive<AsclepiusDate>(from: codingKeyContainer, forKeyIfPresent: .valueDate, auxKey: ._valueDate) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDate, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .date(valueDate)
    }
    
    // DateTime
    if let valueDateTime = try AsclepiusPrimitive<AsclepiusDateTime>(from: codingKeyContainer, forKeyIfPresent: .valueDateTime, auxKey: ._valueDateTime) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDateTime, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .dateTime(valueDateTime)
    }
    
    // Decimal
    if let valueDecimal = try AsclepiusPrimitive<AsclepiusDecimal>(from: codingKeyContainer, forKeyIfPresent: .valueDecimal, auxKey: ._valueDecimal) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDecimal, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .decimal(valueDecimal)
    }
    
    // Distance
    if let valueDistance = try Distance(from: codingKeyContainer, forKeyIfPresent: .valueDistance) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDistance, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .distance(valueDistance)
    }
    
    // Dosage
    if let valueDosage = try Dosage(from: codingKeyContainer, forKeyIfPresent: .valueDosage) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDosage, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .dosage(valueDosage)
    }
    
    // Expression
    if let valueExpression = try Expression(from: codingKeyContainer, forKeyIfPresent: .valueExpression) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueExpression, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .expression(valueExpression)
    }
    
    // Human Name
    if let valueHumanName = try HumanName(from: codingKeyContainer, forKeyIfPresent: .valueHumanName) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueHumanName, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .humanName(valueHumanName)
    }
    
    // ID
    if let valueId = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .valueId, auxKey: ._valueId) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueId, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .id(valueId)
    }
    
    // Identifier
    if let valueIdentifier = try Identifier(from: codingKeyContainer, forKeyIfPresent: .valueIdentifier) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueIdentifier, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .identifier(valueIdentifier)
    }
    
    // Instant
    if let valueInstant = try AsclepiusPrimitive<AsclepiusInstant>(from: codingKeyContainer, forKeyIfPresent: .valueInstant, auxKey: ._valueInstant) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueInstant, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .instant(valueInstant)
    }
    
    // Integer
    if let valueInteger = try AsclepiusPrimitive<AsclepiusInteger>(from: codingKeyContainer, forKeyIfPresent: .valueInteger, auxKey: ._valueInteger) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueInteger, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .integer(valueInteger)
    }
    
    // Markdown
    if let valueMarkdown = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .valueMarkdown, auxKey: ._valueMarkdown) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueMarkdown, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .markdown(valueMarkdown)
    }
    
    // Meta
    if let valueMeta = try Meta(from: codingKeyContainer, forKeyIfPresent: .valueMeta) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueMeta, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .meta(valueMeta)
    }
    
    // Money
    if let valueMoney = try Money(from: codingKeyContainer, forKeyIfPresent: .valueMoney) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueMoney, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .money(valueMoney)
    }
    
    // OID
    if let valueOID = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .valueOid, auxKey: ._valueOid) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueOid, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .oid(valueOID)
    }
    
    // Parameter Definition
    if let valueParameterDefinition = try ParameterDefinition(from: codingKeyContainer, forKeyIfPresent: .valueParameterDefinition) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueParameterDefinition, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .parameterDefinition(valueParameterDefinition)
    }
    
    // Period
    if let valuePeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .valuePeriod) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valuePeriod, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .period(valuePeriod)
    }
    
    // Positive Integer
    if let valuePositiveInteger = try AsclepiusPrimitive<AsclepiusPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: .valuePositiveInt, auxKey: ._valuePositiveInt) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valuePositiveInt, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .positiveInt(valuePositiveInteger)
    }
    
    // Quantity
    if let valueQuantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .valueQuantity) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueQuantity, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .quantity(valueQuantity)
    }
    
    // Range
    if let valueRange = try Range(from: codingKeyContainer, forKeyIfPresent: .valueRange) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRange, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .range(valueRange)
    }
    
    // Ratio
    if let valueRatio = try Ratio(from: codingKeyContainer, forKeyIfPresent: .valueRatio) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRatio, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .ratio(valueRatio)
    }
    
    // Reference
    if let valueReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .valueReference) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueReference, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .reference(valueReference)
    }
    
    // Related Artifact
    if let valueRelatedArtifact = try RelatedArtifact(from: codingKeyContainer, forKeyIfPresent: .valueRelatedArtifact) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRelatedArtifact, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .relatedArtifact(valueRelatedArtifact)
    }
    
    // Sampled Data
    if let valueSampledData = try SampledData(from: codingKeyContainer, forKeyIfPresent: .valueSampledData) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueSampledData, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .sampledData(valueSampledData)
    }
    
    // Signature
    if let valueSignature = try Signature(from: codingKeyContainer, forKeyIfPresent: .valueSignature) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueSignature, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .signature(valueSignature)
    }
    
    // Time
    if let valueTime = try AsclepiusPrimitive<AsclepiusTime>(from: codingKeyContainer, forKeyIfPresent: .valueTime, auxKey: ._valueTime) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueTime, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .time(valueTime)
    }
    
    // Timing
    if let valueTiming = try Timing(from: codingKeyContainer, forKeyIfPresent: .valueTiming) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueTiming, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .timing(valueTiming)
    }
    
    // Trigger Definition
    if let valueTriggerDefinition = try TriggerDefinition(from: codingKeyContainer, forKeyIfPresent: .valueTriggerDefinition) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueTriggerDefinition, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .triggerDefinition(valueTriggerDefinition)
    }
    
    // URI
    if let valueURI = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .valueUri, auxKey: ._valueUri) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUri, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .uri(valueURI)
    }
    
    // URL
    if let valueURL = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .valueUrl, auxKey: ._valueUrl) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUrl, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .url(valueURL)
    }
    
    // Usage Context
    if let valueUsageContext = try UsageContext(from: codingKeyContainer, forKeyIfPresent: .valueUsageContext) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUsageContext, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .usageContext(valueUsageContext)
    }
    
    // UUID
    if let valueUUID = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .valueUuid, auxKey: ._valueUuid) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUuid, in: codingKeyContainer, debugDescription: debugDescription)
      }
      tempValueX = .uuid(valueUUID)
    }
    
    self.valueX = tempValueX
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try url.encode(on: &codingKeyContainer, forKey: .url, auxKey: ._url)
    
    if let valueEnum = valueX {
      switch valueEnum {
      case .address(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueAddress)
      case .age(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueAge)
      case .annotation(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueAnnotation)
      case .attachment(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueAttachment)
      case .base64Binary(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueBase64Binary, auxKey: ._valueBase64Binary)
      case .boolean(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueBoolean, auxKey: ._valueBoolean)
      case .canonical(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueCanonical, auxKey: ._valueCanonical)
      case .code(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueCode, auxKey: ._valueCode)
      case .codeableConcept(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueCodeableConcept)
      case .coding(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueCoding)
      case .contactDetail(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueContactDetail)
      case .contactPoint(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueContactPoint)
      case .contributor(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueContributor)
      case .count(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueCount)
      case .dataRequirement(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueDataRequirement)
      case .date(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueDate, auxKey: ._valueDate)
      case .dateTime(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueDateTime, auxKey: ._valueDateTime)
      case .decimal(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueDecimal, auxKey: ._valueDecimal)
      case .distance(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueDistance)
      case .dosage(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueDosage)
      case .duration(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueDuration)
      case .expression(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueExpression)
      case .humanName(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueHumanName)
      case .id(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueId, auxKey: ._valueId)
      case .identifier(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueIdentifier)
      case .instant(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueInstant, auxKey: ._valueInstant)
      case .integer(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueInteger, auxKey: ._valueInteger)
      case .markdown(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueMarkdown, auxKey: ._valueMarkdown)
      case .meta(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueMeta)
      case .money(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueMoney)
      case .oid(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueOid, auxKey: ._valueOid)
      case .parameterDefinition(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueParameterDefinition)
      case .period(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valuePeriod)
      case .positiveInt(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valuePositiveInt, auxKey: ._valuePositiveInt)
      case .quantity(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueQuantity)
      case .range(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueRange)
      case .ratio(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueRatio)
      case .reference(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueReference)
      case .relatedArtifact(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueRelatedArtifact)
      case .sampledData(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueSampledData)
      case .signature(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueSignature)
      case .string(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueString, auxKey: ._valueString)
      case .time(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueTime, auxKey: ._valueTime)
      case .timing(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueTiming)
      case .triggerDefinition(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueTriggerDefinition)
      case .unsignedInt(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueUnsignedInt, auxKey: ._valueUnsignedInt)
      case .uri(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueUri, auxKey: ._valueUri)
      case .url(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueUrl, auxKey: ._valueUrl)
      case .usageContext(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueUsageContext)
      case .uuid(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueUuid, auxKey: ._valueUuid)
      }
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Extension else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return url == _other.url
    && valueX == _other.valueX
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    
    hasher.combine(url)
    hasher.combine(valueX)
  }
}
