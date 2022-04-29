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
  
  /// Value of extension
  public var valueX: ValueX?

  public init(url: FHIRKitPrimitive<FHIRKitURI>) {
    self.url = url
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    url: FHIRKitPrimitive<FHIRKitURI>,
    valueX: ValueX? = nil
  ) {
    self.init(url: url)
    self.fhirExtension = fhirExtension
    self.id = id
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
    let codingContainer = try decoder.container(keyedBy: CodingKeys.self)
    let debugDescription: String = "More than one value provided for \"value\""
    
    self.url = try FHIRKitPrimitive<FHIRKitURI>(from: codingContainer, forKey: .url, auxiliaryKey: ._url)
    
    var _value: _ValueX? = nil
    
    // Address
    if let valueAddress = try Address(from: codingContainer, forKeyIfPresent: .valueAddress) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAddress, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .address(valueAddress)
    }
    
    // Age
    if let valueAge = try Age(from: codingContainer, forKeyIfPresent: .valueAge) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAge, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .age(valueAge)
    }
    
    // Annotation
    if let valueAnnotation = try Annotation(from: codingContainer, forKeyIfPresent: .valueAnnotation) {
      if _value != nil {e
        throw DecodingError.dataCorruptedError(forKey: .valueAnnotation, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .annotation(valueAnnotation)
    }
    
    // Attachment
    if let valueAttachment = try Attachment(from: codingContainer, forKeyIfPresent: .valueAttachment) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAttachment, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .attachment(valueAttachment)
    }
    
    // Base64Binary
    if let valueBase64Binary = try FHIRKitPrimitive<FHIRKitBase64Binary>(from: codingContainer, forKeyIfPresent: .valueBase64Binary, auxiliaryKey: ._valueBase64Binary) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBase64Binary, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .base64Binary(valueBase64Binary)
    }

    // Boolean
    if let valueBoolean = try FHIRKitPrimitive<FHIRKitBool>(from: codingContainer, forKeyIfPresent: .valueBoolean, auxiliaryKey: ._valueBoolean) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBoolean, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .boolean(valueBoolean)
    }
    
    // Canonical
    if let valueCanonical = try FHIRKitPrimitive<Canonical>(from: codingContainer, forKeyIfPresent: .valueCanonical, auxiliaryKey: ._valueCanonical) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCanonical, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .canonical(valueCanonical)
    }
    
    // Code
    if let valueCode = try FHIRKitPrimitive<FHIRKitString>(from: codingContainer, forKeyIfPresent: .valueCode, auxiliaryKey: ._valueCode) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCode, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .code(valueCode)
    }
    
    // CodableConcept
    if let valueCodableConcept = try CodableConcept(from: codingContainer, forKeyIfPresent: .valueCodableConcept) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCodableConcept, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .codableConcept(valueCodableConcept)
    }
    
    // Coding
    if let valueCoding = try Coding(from: codingContainer, forKeyIfPresent: .valueCoding) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCoding, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .coding(valueCoding)
    }
    
    // ContactDetail
    if let valueContactDetail = try ContactDetail(from: codingContainer, forKeyIfPresent: .valueContactDetail) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueContactDetail, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .contactDetail(valueContactDetail)
    }
    
    // ContactPoint
    if let valueContactPoint = try ContactPoint(from: codingContainer, forKeyIfPresent: .valueContactPoint) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueContactPoint, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .contactPoint(valueContactPoint)
    }
    
    // Contributor
    if let valueContributor = try Contributor(from: codingContainer, forKeyIfPresent: .valueContributor) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueContributor, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .contributor(valueContributor)
    }
    
    // Count
    if let valueCount = try Count(from: codingContainer, forKeyIfPresent: .valueCount) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCount, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .count(valueCount)
    }
    
    // DataRequirement
    if let valueDataRequirement = try DataRequirement(from: codingContainer, forKeyIfPresent: .valueDataRequirement) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDataRequirement, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .dataRequirement(valueDataRequirement)
    }
    
    // Date
    if let valueDate = try FHIRKitPrimitive<FHIRKitDate>(from: codingContainer, forKeyIfPresent: .valueDate, auxiliaryKey: ._valueDate) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDate, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .date(valueDate)
    }
    
    // DateTime
    if let valueDateTime = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingContainer, forKeyIfPresent: .valueDateTime, auxiliaryKey: ._valueDateTime) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDateTime, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .dateTime(valueDateTime)
    }
    
    // Decimal
    if let valueDecimal = try FHIRKitPrimitive<FHIRKitDecimal>(from: codingContainer, forKeyIfPresent: .valueDecimal, auxiliaryKey: ._valueDecimal) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDecimal, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .decimal(valueDecimal)
    }
    
    // Distance
    if let valueDistance = try Distance(from: codingContainer, forKeyIfPresent: .valueDistance) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDistance, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .distance(valueDistance)
    }
    
    // Dosage
    if let valueDosage = try Dosage(from: codingContainer, forKeyIfPresent: .valueDosage) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDosage, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .dosage(valueDosage)
    }
    
    // Expression
    if let valueExpression = try Expression(from: codingContainer, forKeyIfPresent: .valueExpression) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueExpression, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .expression(valueExpression)
    }
    
    // Human Name
    if let valueHumanName = try HumanName(from: codingContainer, forKeyIfPresent: .valueHumanName) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueHumanName, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .humanName(valueHumanName)
    }
    
    // ID
    if let valueId = try FHIRKitPrimitive<FHIRKitString>(from: codingContainer, forKeyIfPresent: .valueId, auxiliaryKey: ._valueId) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueId, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .id(valueId)
    }
    
    // Identifier
    if let valueIdentifier = try Identifier(from: codingContainer, forKeyIfPresent: .valueIdentifier) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueIdentifier, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .identifier(valueIdentifier)
    }
    
    // Instant
    if let valueInstant = try FHIRKitPrimitive<FHIRKitInstant>(from: codingContainer, forKeyIfPresent: .valueInstant, auxiliaryKey: ._valueInstant) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueInstant, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .instant(valueInstant)
    }
    
    // Integer
    if let valueInteger = try FHIRKitPrimitive<FHIRKitInteger>(from: codingContainer, forKeyIfPresent: .valueInteger, auxiliaryKey: ._valueInteger) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueInteger, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .integer(valueInteger)
    }
    
    // Markdown
    if let valueMarkdown = try FHIRKitPrimitive<FHIRKitString>(from: codingContainer, forKeyIfPresent: .valueMarkdown, auxiliaryKey: ._valueMarkdown) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueMarkdown, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .markdown(valueMarkdown)
    }
    
    // Meta
    if let valueMeta = try Meta(from: codingContainer, forKeyIfPresent: .valueMeta) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueMeta, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .meta(valueMeta)
    }
    
    // Money
    if let valueMoney = try Money(from: codingContainer, forKeyIfPresent: .valueMoney) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueMoney, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .money(valueMoney)
    }
    
    // OID
    if let valueOID = try FHIRKitPrimitive<FHIRKitURI>(from: codingContainer, forKeyIfPresent: .valueOid, auxiliaryKey: ._valueOid) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueOid, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .oid(valueOID)
    }
    
    // Parameter Definition
    if let valueParameterDefinition = try ParameterDefinition(from: codingContainer, forKeyIfPresent: .valueParameterDefinition) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueParameterDefinition, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .parameterDefinition(valueParameterDefinition)
    }
    
    // Period
    if let valuePeriod = try Period(from: codingContainer, forKeyIfPresent: .valuePeriod) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valuePeriod, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .period(valuePeriod)
    }
    
    // Positive Integer
    if let valuePositiveInteger = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: codingContainer, forKeyIfPresent: .valuePositiveInt, auxiliaryKey: ._valuePositiveInt) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valuePositiveInt, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .positiveInt(valuePositiveInteger)
    }
    
    // Quantity
    if let valueQuantity = try Quantity(from: codingContainer, forKeyIfPresent: .valueQuantity) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueQuantity, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .quantity(valueQuantity)
    }
    
    // Range
    if let valueRange = try Range(from: codingContainer, forKeyIfPresent: .valueRange) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRange, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .range(valueRange)
    }
    
    // Ratio
    if let valueRatio = try Ratio(from: codingContainer, forKeyIfPresent: .valueRatio) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRatio, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .ratio(valueRatio)
    }
    
    // Reference
    if let valueReference = try Reference(from: codingContainer, forKeyIfPresent: .valueReference) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueReference, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .reference(valueReference)
    }
    
    // Related Artifact
    if let valueRelatedArtifact = try RelatedArtifact(from: codingContainer, forKeyIfPresent: .valueRelatedArtifact) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRelatedArtifact, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .relatedArtifact(valueRelatedArtifact)
    }
    
    // Sampled Data
    if let valueSampledData = try SampledData(from: codingContainer, forKeyIfPresent: .valueSampledData) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueSampledData, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .sampledData(valueSampledData)
    }
    
    // Signature
    if let valueSignature = try Signature(from: codingContainer, forKeyIfPresent: .valueSignature) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueSignature, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .signature(valueSignature)
    }
    
    // Time
    if let valueTime = try FHIRKitPrimitive<FHIRKitTime>(from: codingContainer, forKeyIfPresent: .valueTime, auxiliaryKey: ._valueTime) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueTime, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .time(valueTime)
    }
    
    // Timing
    if let valueTiming = try Timing(from: codingContainer, forKeyIfPresent: .valueTiming) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueTiming, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .timing(valueTiming)
    }
    
    // Trigger Definition
    if let valueTriggerDefinition = try TriggerDefinition(from: codingContainer, forKeyIfPresent: .valueTriggerDefinition) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueTriggerDefinition, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .triggerDefinition(valueTriggerDefinition)
    }
    
    // URI
    if let valueURI = try FHIRKitPrimitive<FHIRKitURI>(from: codingContainer, forKeyIfPresent: .valueUri, auxiliaryKey: ._valueUri) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUri, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .uri(valueURI)
    }
    
    // URL
    if let valueURL = try FHIRKitPrimitive<FHIRKitURI>(from: codingContainer, forKeyIfPresent: .valueUrl, auxiliaryKey: ._valueUrl) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUrl, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .url(valueURL)
    }
    
    // Usage Context
    if let valueUsageContext = try UsageContext(from: codingContainer, forKeyIfPresent: .valueUsageContext) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUsageContext, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .usageContext(valueUsageContext)
    }
    
    // UUID
    if let valueUUID = try FHIRKitPrimitive<FHIRKitURI>(from: codingContainer, forKeyIfPresent: .valueUuid, auxiliaryKey: ._valueUuid) {
      if _value != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUuid, in: codingContainer, debugDescription: debugDescription)
      }
      _value = .uuid(valueUUID)
    }
    
    self.valueX = _value
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try url.encode(on: &codingContainer, forKey: .url, auxiliaryKey: ._url)
    if let _enum = valueX {
      switch _enum {
      case .address(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueAddress)
      case .age(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueAge)
      case .annotation(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueAnnotation)
      case .attachment(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueAttachment)
      case .base64Binary(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueBase64Binary, auxiliaryKey: ._valueBase64Binary)
      case .boolean(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueBoolean, auxiliaryKey: ._valueBoolean)
      case .canonical(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueCanonical, auxiliaryKey: ._valueCanonical)
      case .code(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueCode, auxiliaryKey: ._valueCode)
      case .codableConcept(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueCodableConcept)
      case .coding(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueCoding)
      case .contactDetail(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueContactDetail)
      case .contactPoint(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueContactPoint)
      case .contributor(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueContributor)
      case .count(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueCount)
      case .dataRequirement(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueDataRequirement)
      case .date(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueDate, auxiliaryKey: ._valueDate)
      case .dateTime(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueDateTime, auxiliaryKey: ._valueDateTime)
      case .decimal(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueDecimal, auxiliaryKey: ._valueDecimal)
      case .distance(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueDistance)
      case .dosage(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueDosage)
      case .duration(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueDuration)
      case .expression(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueExpression)
      case .humanName(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueHumanName)
      case .id(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueId, auxiliaryKey: ._valueId)
      case .identifier(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueIdentifier)
      case .instant(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueInstant, auxiliaryKey: ._valueInstant)
      case .integer(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueInteger, auxiliaryKey: ._valueInteger)
      case .markdown(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueMarkdown, auxiliaryKey: ._valueMarkdown)
      case .meta(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueMeta)
      case .money(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueMoney)
      case .oid(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueOid, auxiliaryKey: ._valueOid)
      case .parameterDefinition(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueParameterDefinition)
      case .period(let _value):
        try _value.encode(on: &codingContainer, forKey: .valuePeriod)
      case .positiveInt(let _value):
        try _value.encode(on: &codingContainer, forKey: .valuePositiveInt, auxiliaryKey: ._valuePositiveInt)
      case .quantity(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueQuantity)
      case .range(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueRange)
      case .ratio(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueRatio)
      case .reference(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueReference)
      case .relatedArtifact(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueRelatedArtifact)
      case .sampledData(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueSampledData)
      case .signature(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueSignature)
      case .string(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueString, auxiliaryKey: ._valueString)
      case .time(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueTime, auxiliaryKey: ._valueTime)
      case .timing(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueTiming)
      case .triggerDefinition(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueTriggerDefinition)
      case .unsignedInt(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueUnsignedInt, auxiliaryKey: ._valueUnsignedInt)
      case .uri(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueUri, auxiliaryKey: ._valueUri)
      case .url(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueUrl, auxiliaryKey: ._valueUrl)
      case .usageContext(let _value):
        try _value.encode(on: &codingContainer, forKey: .valueUsageContext)
      case .uuid(let _value):
        try _value.encode(on: &codingContainer, forKey: ._valueUuid, auxiliaryKey: ._valueUuid)
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
    && valueX == _other.valueX
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    
    hasher.combine(url)
    hasher.combine(valueX)
  }
}
