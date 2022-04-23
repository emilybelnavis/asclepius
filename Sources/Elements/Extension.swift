//
//  Extension.swift
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
 Optional Extensions Element - Found in all FHIR resources
 */
open class Extension: Element {
  public enum _Value: Hashable {
    case address(Address)
    case age(Age)
    case annotation(Annotation)
    case attachment(Attachment)
    case base64Binary(FHIRKitPrimitive<FHIRKitBase64Binary>)
    case boolean(FHIRKitPrimitive<FHIRKitBool>)
    case canonical(FHIRKitPrimitive<Canonical>)
    case code(FHIRKitPrimitive<FHIRKitString>)
    case codableConcept(CodableConcept)
    case coding(Coding)
    case contactDetail(ContactDetail)
    case contactPoint(ContactPoint)
    case contributor(Contributor)
    case count(Count)
    case dataRequirement(DataRequirement)
    case date(FHIRKitPrimitive<FHIRKitDate>)
    case dateTime(FHIRKitPrimitive<FHIRKitDateTime>)
    case decimal(FHIRKitPrimitive<FHIRKitDecimal>)
    case distance(Distance)
    case dosage(Dosage)
    case duration(Duration)
    case expression(Expression)
    case humanName(HumanName)
    case id(FHIRKitPrimitive<FHIRKitString>)
    case identifier(Identifier)
    case instant(FHIRKitPrimitive<FHIRKitInstant>)
    case integer(FHIRKitPrimitive<FHIRKitInteger>)
    case markdown(FHIRKitPrimitive<FHIRKitString>)
    case meta(Meta)
    case money(Money)
    case oid(FHIRKitPrimitive<FHIRKitURI>)
    case parameterDefinition(ParameterDefinition)
    case period(Period)
    case positiveInt(FHIRKitPrimitive<FHIRKitPositiveInteger>)
    case quantity(Quantity)
    case range(Range)
    case ratio(Ratio)
    case reference(Reference)
    case relatedArtifact(RelatedArtifact)
    case sampledData(SampledData)
    case signature(Signature)
    case string(FHIRKitPrimitive<FHIRKitString>)
    case time(FHIRKitPrimitive<FHIRKitTime>)
    case timing(Timing)
    case triggerDefinition(TriggerDefinition)
    case unsignedInt(FHIRKitPrimitive<FHIRKitUnsignedInteger>)
    case uri(FHIRKitPrimitive<FHIRKitURI>)
    case url(FHIRKitPrimitive<FHIRKitURI>)
    case usageContext(UsageContext)
    case uuid(FHIRKitPrimitive<FHIRKitURI>)
  }
  
  /// identifies the meaning of the extension
  public var url: FHIRKitPrimitive<FHIRKitURI>
  
  /// value of extension
  public var value: _Value?

  public init(url: FHIRKitPrimitive<FHIRKitURI>) {
    self.url = url
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    url: FHIRKitPrimitive<FHIRKitURI>,
    value: _Value? = nil
  ) {
    self.init(url: url)
    self.`extension` = `extension`
    self.id = id
    self.value = value
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
    case valueCodableConcept
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    let debugDescription: String = "More than one value provided for \"value\""
    
    self.url = try FHIRKitPrimitive<FHIRKitURI>(from: _container, forKey: .url, auxiliaryKey: ._url)
    
    var _value: _Value?
    
    // Address
    if let valueAddress = try Address(from: _container, forKeyIfPresent: .valueAddress) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAddress, in: _container, debugDescription: debugDescription)
      }
      _value = .address(valueAddress)
    }
    
    // Age
    if let valueAge = try Age(from: _container, forKeyIfPresent: .valueAge) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAge, in: _container, debugDescription: debugDescription)
      }
      _value = .age(valueAge)
    }
    
    // Annotation
    if let valueAnnotation = try Annotation(from: _container, forKeyIfPresent: .valueAnnotation) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAnnotation, in: _container, debugDescription: debugDescription)
      }
      _value = .annotation(valueAnnotation)
    }
    
    // Attachment
    if let valueAttachment = try Attachment(from: _container, forKeyIfPresent: .valueAttachment) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAttachment, in: _container, debugDescription: debugDescription)
      }
      _value = .attachment(valueAttachment)
    }
    
    // Base64Binary
    if let valueBase64Binary = try FHIRKitPrimitive<FHIRKitBase64Binary>(from: _container, forKeyIfPresent: .valueBase64Binary, auxiliaryKey: ._valueBase64Binary) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBase64Binary, in: _container, debugDescription: debugDescription)
      }
      _value = .base64Binary(valueBase64Binary)
    }

    // Boolean
    if let valueBoolean = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKeyIfPresent: .valueBoolean, auxiliaryKey: ._valueBoolean) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBoolean, in: _container, debugDescription: debugDescription)
      }
      _value = .boolean(valueBoolean)
    }
    
    // Canonical
    if let valueCanonical = try FHIRKitPrimitive<Canonical>(from: _container, forKeyIfPresent: .valueCanonical, auxiliaryKey: ._valueCanonical) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCanonical, in: _container, debugDescription: debugDescription)
      }
      _value = .canonical(valueCanonical)
    }
    
    // Code
    if let valueCode = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .valueCode, auxiliaryKey: ._valueCode) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCode, in: _container, debugDescription: debugDescription)
      }
      _value = .code(valueCode)
    }
    
    // CodableConcept
    if let valueCodableConcept = try CodableConcept(from: _container, forKeyIfPresent: .valueCodableConcept) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCodableConcept, in: _container, debugDescription: debugDescription)
      }
      _value = .codableConcept(valueCodableConcept)
    }
    
    // Coding
    if let valueCoding = try Coding(from: _container, forKeyIfPresent: .valueCoding) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCoding, in: _container, debugDescription: debugDescription)
      }
      _value = .coding(valueCoding)
    }
    
    // ContactDetail
    if let valueContactDetail = try ContactDetail(from: _container, forKeyIfPresent: .valueContactDetail) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueContactDetail, in: _container, debugDescription: debugDescription)
      }
      _value = .contactDetail(valueContactDetail)
    }
    
    // ContactPoint
    if let valueContactPoint = try ContactPoint(from: _container, forKeyIfPresent: .valueContactPoint) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueContactPoint, in: _container, debugDescription: debugDescription)
      }
      _value = .contactPoint(valueContactPoint)
    }
    
    // Contributor
    if let valueContributor = try Contributor(from: _container, forKeyIfPresent: .valueContributor) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueContributor, in: _container, debugDescription: debugDescription)
      }
      _value = .contributor(valueContributor)
    }
    
    // Count
    if let valueCount = try Count(from: _container, forKeyIfPresent: .valueCount) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCount, in: _container, debugDescription: debugDescription)
      }
      _value = .count(valueCount)
    }
    
    // DataRequirement
    if let valueDataRequirement = try DataRequirement(from: _container, forKeyIfPresent: .valueDataRequirement) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDataRequirement, in: _container, debugDescription: debugDescription)
      }
      _value = .dataRequirement(valueDataRequirement)
    }
    
    // Date
    if let valueDate = try FHIRKitPrimitive<FHIRKitDate>(from: _container, forKeyIfPresent: .valueDate, auxiliaryKey: ._valueDate) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDate, in: _container, debugDescription: debugDescription)
      }
      _value = .date(valueDate)
    }
    
    // DateTime
    if let valueDateTime = try FHIRKitPrimitive<FHIRKitDateTime>(from: _container, forKeyIfPresent: .valueDateTime, auxiliaryKey: ._valueDateTime) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDateTime, in: _container, debugDescription: debugDescription)
      }
      _value = .dateTime(valueDateTime)
    }
    
    // Decimal
    if let valueDecimal = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKeyIfPresent: .valueDecimal, auxiliaryKey: ._valueDecimal) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDecimal, in: _container, debugDescription: debugDescription)
      }
      _value = .decimal(valueDecimal)
    }
    
    // Distance
    if let valueDistance = try Distance(from: _container, forKeyIfPresent: .valueDistance) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDistance, in: _container, debugDescription: debugDescription)
      }
      _value = .distance(valueDistance)
    }
    
    // Dosage
    if let valueDosage = try Dosage(from: _container, forKeyIfPresent: .valueDosage) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDosage, in: _container, debugDescription: debugDescription)
      }
      _value = .dosage(valueDosage)
    }
    
    // Expression
    if let valueExpression = try Expression(from: _container, forKeyIfPresent: .valueExpression) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueExpression, in: _container, debugDescription: debugDescription)
      }
      _value = .expression(valueExpression)
    }
    
    // Human Name
    if let valueHumanName = try HumanName(from: _container, forKeyIfPresent: .valueHumanName) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueHumanName, in: _container, debugDescription: debugDescription)
      }
      _value = .humanName(valueHumanName)
    }
    
    // ID
    if let valueId = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .valueId, auxiliaryKey: ._valueId) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueId, in: _container, debugDescription: debugDescription)
      }
      _value = .id(valueId)
    }
    
    // Identifier
    if let valueIdentifier = try Identifier(from: _container, forKeyIfPresent: .valueIdentifier) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueIdentifier, in: _container, debugDescription: debugDescription)
      }
      _value = .identifier(valueIdentifier)
    }
    
    // Instant
    if let valueInstant = try FHIRKitPrimitive<FHIRKitInstant>(from: _container, forKeyIfPresent: .valueInstant, auxiliaryKey: ._valueInstant) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueInstant, in: _container, debugDescription: debugDescription)
      }
      _value = .instant(valueInstant)
    }
    
    // Integer
    if let valueInteger = try FHIRKitPrimitive<FHIRKitInteger>(from: _container, forKeyIfPresent: .valueInteger, auxiliaryKey: ._valueInteger) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueInteger, in: _container, debugDescription: debugDescription)
      }
      _value = .integer(valueInteger)
    }
    
    // Markdown
    if let valueMarkdown = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .valueMarkdown, auxiliaryKey: ._valueMarkdown) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueMarkdown, in: _container, debugDescription: debugDescription)
      }
      _value = .markdown(valueMarkdown)
    }
    
    // Meta
    if let valueMeta = try Meta(from: _container, forKeyIfPresent: .valueMeta) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueMeta, in: _container, debugDescription: debugDescription)
      }
      _value = .meta(valueMeta)
    }
    
    // Money
    if let valueMoney = try Money(from: _container, forKeyIfPresent: .valueMoney) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueMoney, in: _container, debugDescription: debugDescription)
      }
      _value = .money(valueMoney)
    }
    
    // OID
    if let valueOID = try FHIRKitPrimitive<FHIRKitURI>(from: _container, forKeyIfPresent: .valueOid, auxiliaryKey: ._valueOid) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueOid, in: _container, debugDescription: debugDescription)
      }
      _value = .oid(valueOID)
    }
    
    // Parameter Definition
    if let valueParameterDefinition = try ParameterDefinition(from: _container, forKeyIfPresent: .valueParameterDefinition) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueParameterDefinition, in: _container, debugDescription: debugDescription)
      }
      _value = .parameterDefinition(valueParameterDefinition)
    }
    
    // Period
    if let valuePeriod = try Period(from: _container, forKeyIfPresent: .valuePeriod) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valuePeriod, in: _container, debugDescription: debugDescription)
      }
      _value = .period(valuePeriod)
    }
    
    // Positive Integer
    if let valuePositiveInteger = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKeyIfPresent: .valuePositiveInt, auxiliaryKey: ._valuePositiveInt) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valuePositiveInt, in: _container, debugDescription: debugDescription)
      }
      _value = .positiveInt(valuePositiveInteger)
    }
    
    // Quantity
    if let valueQuantity = try Quantity(from: _container, forKeyIfPresent: .valueQuantity) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueQuantity, in: _container, debugDescription: debugDescription)
      }
      _value = .quantity(valueQuantity)
    }
    
    // Range
    if let valueRange = try Range(from: _container, forKeyIfPresent: .valueRange) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRange, in: _container, debugDescription: debugDescription)
      }
      _value = .range(valueRange)
    }
    
    // Ratio
    if let valueRatio = try Ratio(from: _container, forKeyIfPresent: .valueRatio) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRatio, in: _container, debugDescription: debugDescription)
      }
      _value = .ratio(valueRatio)
    }
    
    // Reference
    if let valueReference = try Reference(from: _container, forKeyIfPresent: .valueReference) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueReference, in: _container, debugDescription: debugDescription)
      }
      _value = .reference(valueReference)
    }
    
    // Related Artifact
    if let valueRelatedArtifact = try RelatedArtifact(from: _container, forKeyIfPresent: .valueRelatedArtifact) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRelatedArtifact, in: _container, debugDescription: debugDescription)
      }
      _value = .relatedArtifact(valueRelatedArtifact)
    }
    
    // Sampled Data
    if let valueSampledData = try SampledData(from: _container, forKeyIfPresent: .valueSampledData) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueSampledData, in: _container, debugDescription: debugDescription)
      }
      _value = .sampledData(valueSampledData)
    }
    
    // Signature
    if let valueSignature = try Signature(from: _container, forKeyIfPresent: .valueSignature) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueSignature, in: _container, debugDescription: debugDescription)
      }
      _value = .signature(valueSignature)
    }
    
    // Time
    if let valueTime = try FHIRKitPrimitive<FHIRKitTime>(from: _container, forKeyIfPresent: .valueTime, auxiliaryKey: ._valueTime) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueTime, in: _container, debugDescription: debugDescription)
      }
      _value = .time(valueTime)
    }
    
    // Timing
    if let valueTiming = try Timing(from: _container, forKeyIfPresent: .valueTiming) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueTiming, in: _container, debugDescription: debugDescription)
      }
      _value = .timing(valueTiming)
    }
    
    // Trigger Definition
    if let valueTriggerDefinition = try TriggerDefinition(from: _container, forKeyIfPresent: .valueTriggerDefinition) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueTriggerDefinition, in: _container, debugDescription: debugDescription)
      }
      _value = .triggerDefinition(valueTriggerDefinition)
    }
    
    // URI
    if let valueURI = try FHIRKitPrimitive<FHIRKitURI>(from: _container, forKeyIfPresent: .valueUri, auxiliaryKey: ._valueUri) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUri, in: _container, debugDescription: debugDescription)
      }
      _value = .uri(valueURI)
    }
    
    // URL
    if let valueURL = try FHIRKitPrimitive<FHIRKitURI>(from: _container, forKeyIfPresent: .valueUrl, auxiliaryKey: ._valueUrl) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUrl, in: _container, debugDescription: debugDescription)
      }
      _value = .url(valueURL)
    }
    
    // Usage Context
    if let valueUsageContext = try UsageContext(from: _container, forKeyIfPresent: .valueUsageContext) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUsageContext, in: _container, debugDescription: debugDescription)
      }
      _value = .usageContext(valueUsageContext)
    }
    
    // UUID
    if let valueUUID = try FHIRKitPrimitive<FHIRKitURI>(from: _container, forKeyIfPresent: .valueUuid, auxiliaryKey: ._valueUuid) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUuid, in: _container, debugDescription: debugDescription)
      }
      _value = .uuid(valueUUID)
    }
    
    self.value = _value
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try url.encode(on: &_container, forKey: .url, auxiliaryKey: ._url)
    if let _enum = value {
      switch _enum {
      case .address(let _value):
        try _value.encode(on: &_container, forKey: .valueAddress)
      case .age(let _value):
        try _value.encode(on: &_container, forKey: .valueAge)
      case .annotation(let _value):
        try _value.encode(on: &_container, forKey: .valueAnnotation)
      case .attachment(let _value):
        try _value.encode(on: &_container, forKey: .valueAttachment)
      case .base64Binary(let _value):
        try _value.encode(on: &_container, forKey: .valueBase64Binary, auxiliaryKey: ._valueBase64Binary)
      case .boolean(let _value):
        try _value.encode(on: &_container, forKey: .valueBoolean, auxiliaryKey: ._valueBoolean)
      case .canonical(let _value):
        try _value.encode(on: &_container, forKey: .valueCanonical, auxiliaryKey: ._valueCanonical)
      case .code(let _value):
        try _value.encode(on: &_container, forKey: .valueCode, auxiliaryKey: ._valueCode)
      case .codableConcept(let _value):
        try _value.encode(on: &_container, forKey: .valueCodableConcept)
      case .coding(let _value):
        try _value.encode(on: &_container, forKey: .valueCoding)
      case .contactDetail(let _value):
        try _value.encode(on: &_container, forKey: .valueContactDetail)
      case .contactPoint(let _value):
        try _value.encode(on: &_container, forKey: .valueContactPoint)
      case .contributor(let _value):
        try _value.encode(on: &_container, forKey: .valueContributor)
      case .count(let _value):
        try _value.encode(on: &_container, forKey: .valueCount)
      case .dataRequirement(let _value):
        try _value.encode(on: &_container, forKey: .valueDataRequirement)
      case .date(let _value):
        try _value.encode(on: &_container, forKey: .valueDate, auxiliaryKey: ._valueDate)
      case .dateTime(let _value):
        try _value.encode(on: &_container, forKey: .valueDateTime, auxiliaryKey: ._valueDateTime)
      case .decimal(let _value):
        try _value.encode(on: &_container, forKey: .valueDecimal, auxiliaryKey: ._valueDecimal)
      case .distance(let _value):
        try _value.encode(on: &_container, forKey: .valueDistance)
      case .dosage(let _value):
        try _value.encode(on: &_container, forKey: .valueDosage)
      case .duration(let _value):
        try _value.encode(on: &_container, forKey: .valueDuration)
      case .expression(let _value):
        try _value.encode(on: &_container, forKey: .valueExpression)
      case .humanName(let _value):
        try _value.encode(on: &_container, forKey: .valueHumanName)
      case .id(let _value):
        try _value.encode(on: &_container, forKey: .valueId, auxiliaryKey: ._valueId)
      case .identifier(let _value):
        try _value.encode(on: &_container, forKey: .valueIdentifier)
      case .instant(let _value):
        try _value.encode(on: &_container, forKey: .valueInstant, auxiliaryKey: ._valueInstant)
      case .integer(let _value):
        try _value.encode(on: &_container, forKey: .valueInteger, auxiliaryKey: ._valueInteger)
      case .markdown(let _value):
        try _value.encode(on: &_container, forKey: .valueMarkdown, auxiliaryKey: ._valueMarkdown)
      case .meta(let _value):
        try _value.encode(on: &_container, forKey: .valueMeta)
      case .money(let _value):
        try _value.encode(on: &_container, forKey: .valueMoney)
      case .oid(let _value):
        try _value.encode(on: &_container, forKey: .valueOid, auxiliaryKey: ._valueOid)
      case .parameterDefinition(let _value):
        try _value.encode(on: &_container, forKey: .valueParameterDefinition)
      case .period(let _value):
        try _value.encode(on: &_container, forKey: .valuePeriod)
      case .positiveInt(let _value):
        try _value.encode(on: &_container, forKey: .valuePositiveInt, auxiliaryKey: ._valuePositiveInt)
      case .quantity(let _value):
        try _value.encode(on: &_container, forKey: .valueQuantity)
      case .range(let _value):
        try _value.encode(on: &_container, forKey: .valueRange)
      case .ratio(let _value):
        try _value.encode(on: &_container, forKey: .valueRatio)
      case .reference(let _value):
        try _value.encode(on: &_container, forKey: .valueReference)
      case .relatedArtifact(let _value):
        try _value.encode(on: &_container, forKey: .valueRelatedArtifact)
      case .sampledData(let _value):
        try _value.encode(on: &_container, forKey: .valueSampledData)
      case .signature(let _value):
        try _value.encode(on: &_container, forKey: .valueSignature)
      case .string(let _value):
        try _value.encode(on: &_container, forKey: .valueString, auxiliaryKey: ._valueString)
      case .time(let _value):
        try _value.encode(on: &_container, forKey: .valueTime, auxiliaryKey: ._valueTime)
      case .timing(let _value):
        try _value.encode(on: &_container, forKey: .valueTiming)
      case .triggerDefinition(let _value):
        try _value.encode(on: &_container, forKey: .valueTriggerDefinition)
      case .unsignedInt(let _value):
        try _value.encode(on: &_container, forKey: .valueUnsignedInt, auxiliaryKey: ._valueUnsignedInt)
      case .uri(let _value):
        try _value.encode(on: &_container, forKey: .valueUri, auxiliaryKey: ._valueUri)
      case .url(let _value):
        try _value.encode(on: &_container, forKey: .valueUrl, auxiliaryKey: ._valueUrl)
      case .usageContext(let _value):
        try _value.encode(on: &_container, forKey: .valueUsageContext)
      case .uuid(let _value):
        try _value.encode(on: &_container, forKey: ._valueUuid, auxiliaryKey: ._valueUuid)
      }
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Extension else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return url == _other.url
    && value == _other.value
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(url)
    hasher.combine(value)
  }
}
