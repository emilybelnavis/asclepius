//
//  ElementDefinitionExample.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

open class ElementDefinitionExample: Element {
  public enum ValueX: Hashable {
    case address(Address)
    case age(Age)
    case annotation(Annotation)
    case attachment(Attachment)
    case base64Binary(AlexandriaHRMPrimitive<AlexandriaHRMBase64Binary>)
    case boolean(AlexandriaHRMPrimitive<AlexandriaHRMBool>)
    case canonical(AlexandriaHRMPrimitive<Canonical>)
    case code(AlexandriaHRMPrimitive<AlexandriaHRMString>)
    case codeableConcept(CodeableConcept)
    case coding(Coding)
    case contactDetail(ContactDetail)
    case contactPoint(ContactPoint)
    case contributor(Contributor)
    case count(Count)
    case dataRequirement(DataRequirement)
    case date(AlexandriaHRMPrimitive<AlexandriaHRMDate>)
    case dateTime(AlexandriaHRMPrimitive<AlexandriaHRMDateTime>)
    case decimal(AlexandriaHRMPrimitive<AlexandriaHRMDecimal>)
    case distance(Distance)
    case dosage(Dosage)
    case duration(Duration)
    case expression(Expression)
    case humanName(HumanName)
    case id(AlexandriaHRMPrimitive<AlexandriaHRMString>)
    case identifier(Identifier)
    case instant(AlexandriaHRMPrimitive<AlexandriaHRMInstant>)
    case integer(AlexandriaHRMPrimitive<AlexandriaHRMInteger>)
    case markdown(AlexandriaHRMPrimitive<AlexandriaHRMString>)
    case meta(Meta)
    case money(Money)
    case oid(AlexandriaHRMPrimitive<AlexandriaHRMURI>)
    case parameterDefinition(ParameterDefinition)
    case period(Period)
    case positiveInteger(AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>)
    case quantity(Quantity)
    case range(Range)
    case ratio(Ratio)
    case reference(Reference)
    case relatedArtifact(RelatedArtifact)
    case sampledData(SampledData)
    case signature(Signature)
    case string(AlexandriaHRMPrimitive<AlexandriaHRMString>)
    case time(AlexandriaHRMPrimitive<AlexandriaHRMTime>)
    case timing(Timing)
    case triggerDefinition(TriggerDefinition)
    case unsignedInteger(AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>)
    case uri(AlexandriaHRMPrimitive<AlexandriaHRMURI>)
    case url(AlexandriaHRMPrimitive<AlexandriaHRMURI>)
    case usageContext(UsageContext)
    case uuid(AlexandriaHRMPrimitive<AlexandriaHRMURI>)
  }
  
  /// Describes the purpose of this example
  public var label: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
  /// Value of Example (`value[x]`)
  public var value: ValueX
  
  public init(label: AlexandriaHRMPrimitive<AlexandriaHRMString>, value: ValueX) {
    self.label = label
    self.value = value
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    label: AlexandriaHRMPrimitive<AlexandriaHRMString>,
    value: ValueX
  ) {
    self.init(label: label, value: value)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case label; case _label
    case valueLabel; case _valueLabel
    case valueAddress
    case valueAge
    case valueAnnotation
    case valueAttachment
    case valueBase64binary; case _valueBase64binary
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
    case valuePositiveInteger; case _valuePositiveInteger
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
    case valueUnsignedInteger; case _valueUnsignedInteger
    case valueUri; case _valueUri
    case valueUrl; case _valueUrl
    case valueUsageContext
    case valueUuid; case _valueUuid
  }
  
  // swiftlint:disable cyclomatic_complexity
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tValue: ValueX?
    
    // value.address
    if let valueAddress = try Address(from: codingKeyContainer, forKeyIfPresent: .valueAddress) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAddress, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .address(valueAddress)
    }
    
    // value.age
    if let valueAge = try Age(from: codingKeyContainer, forKeyIfPresent: .valueAge) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAge, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .age(valueAge)
    }
    
    // value.annotation
    if let valueAnnotation = try Annotation(from: codingKeyContainer, forKeyIfPresent: .valueAnnotation) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAnnotation, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .annotation(valueAnnotation)
    }
    
    // value.attachment
    if let valueAttachment = try Attachment(from: codingKeyContainer, forKeyIfPresent: .valueAttachment) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueAttachment, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .attachment(valueAttachment)
    }
    
    // value.base64binary
    if let valueBase64Binary = try AlexandriaHRMPrimitive<AlexandriaHRMBase64Binary>(from: codingKeyContainer, forKeyIfPresent: .valueBase64binary, auxKey: ._valueBase64binary) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBase64binary, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .base64Binary(valueBase64Binary)
    }
    
    // value.boolean
    if let valueBoolean = try AlexandriaHRMPrimitive<AlexandriaHRMBool>(from: codingKeyContainer, forKeyIfPresent: .valueBoolean, auxKey: ._valueBoolean) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueBoolean, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .boolean(valueBoolean)
    }
    
    // value.canonical
    if let valueCanonical = try AlexandriaHRMPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .valueCanonical, auxKey: ._valueCanonical) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCanonical, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .canonical(valueCanonical)
    }
    
    // value.code
    if let valueCode = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .valueCode, auxKey: ._valueCode) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCode, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .code(valueCode)
    }
    
    // value.codeableConcept
    if let valueCodeableConcept = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .valueCodeableConcept) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCodeableConcept, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .codeableConcept(valueCodeableConcept)
    }
    
    // value.coding
    if let valueCoding = try Coding(from: codingKeyContainer, forKeyIfPresent: .valueCoding) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCoding, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .coding(valueCoding)
    }
    
    // value.contactDetail
    if let valueContactDetail = try ContactDetail(from: codingKeyContainer, forKeyIfPresent: .valueContactDetail) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueContactDetail, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .contactDetail(valueContactDetail)
    }
    
    // value.contactPoint
    if let valueContactPoint = try ContactPoint(from: codingKeyContainer, forKeyIfPresent: .valueContactPoint) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueContactPoint, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .contactPoint(valueContactPoint)
    }
    
    // value.contributor
    if let valueContributor = try Contributor(from: codingKeyContainer, forKeyIfPresent: .valueContributor) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueContributor, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .contributor(valueContributor)
    }
    
    // value.count
    if let valueCount = try Count(from: codingKeyContainer, forKeyIfPresent: .valueCount) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueCount, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .count(valueCount)
    }
    
    // value.dataRequirement
    if let valueDataRequirement = try DataRequirement(from: codingKeyContainer, forKeyIfPresent: .valueDataRequirement) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDataRequirement, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .dataRequirement(valueDataRequirement)
    }
    
    // value.date
    if let valueDate = try AlexandriaHRMPrimitive<AlexandriaHRMDate>(from: codingKeyContainer, forKeyIfPresent: .valueDate, auxKey: ._valueDate) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDate, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .date(valueDate)
    }
    
    // value.dateTime
    if let valueDateTime = try AlexandriaHRMPrimitive<AlexandriaHRMDateTime>(from: codingKeyContainer, forKeyIfPresent: .valueDateTime, auxKey: ._valueDateTime) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDateTime, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .dateTime(valueDateTime)
    }
    
    // value.decimal
    if let valueDecimal = try AlexandriaHRMPrimitive<AlexandriaHRMDecimal>(from: codingKeyContainer, forKeyIfPresent: .valueDecimal, auxKey: ._valueDecimal) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDecimal, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .decimal(valueDecimal)
    }
    
    // value.distance
    if let valueDistance = try Distance(from: codingKeyContainer, forKeyIfPresent: .valueDistance) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDistance, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .distance(valueDistance)
    }
    
    // value.dosage
    if let valueDosage = try Dosage(from: codingKeyContainer, forKeyIfPresent: .valueDosage) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDosage, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .dosage(valueDosage)
    }
    
    // value.duration
    if let valueDuration = try Duration(from: codingKeyContainer, forKeyIfPresent: .valueDuration) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDuration, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .duration(valueDuration)
    }
    
    // value.expression
    if let valueExpression = try Expression(from: codingKeyContainer, forKeyIfPresent: .valueExpression) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueExpression, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .expression(valueExpression)
    }
    
    // value.humanName
    if let valueHumanName = try HumanName(from: codingKeyContainer, forKeyIfPresent: .valueHumanName) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueHumanName, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .humanName(valueHumanName)
    }
    
    // value.id
    if let valueId = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .valueId, auxKey: ._valueId) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueId, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .id(valueId)
    }
    
    // value.identifier
    if let valueIdentifier = try Identifier(from: codingKeyContainer, forKeyIfPresent: .valueIdentifier) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueIdentifier, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .identifier(valueIdentifier)
    }
    
    // value.instant
    if let valueInstant = try AlexandriaHRMPrimitive<AlexandriaHRMInstant>(from: codingKeyContainer, forKeyIfPresent: .valueInstant, auxKey: ._valueInstant) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueInstant, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .instant(valueInstant)
    }
    
    // value.integer
    if let valueInteger = try AlexandriaHRMPrimitive<AlexandriaHRMInteger>(from: codingKeyContainer, forKeyIfPresent: .valueInteger, auxKey: ._valueInteger) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueInteger, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .integer(valueInteger)
    }
    
    // value.markdown
    if let valueMarkdown = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .valueMarkdown, auxKey: ._valueMarkdown) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueMarkdown, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .markdown(valueMarkdown)
    }
    
    // value.meta
    if let valueMeta = try Meta(from: codingKeyContainer, forKeyIfPresent: .valueMeta) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueMeta, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .meta(valueMeta)
    }
    
    // value.money
    if let valueMoney = try Money(from: codingKeyContainer, forKeyIfPresent: .valueMoney) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueMoney, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .money(valueMoney)
    }
    
    // value.oid
    if let valueOid = try AlexandriaHRMPrimitive<AlexandriaHRMURI>(from: codingKeyContainer, forKeyIfPresent: .valueOid, auxKey: ._valueOid) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueOid, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .oid(valueOid)
    }
    
    // value.parameterDefinition
    if let valueParameterDefinition = try ParameterDefinition(from: codingKeyContainer, forKeyIfPresent: .valueParameterDefinition) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueParameterDefinition, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .parameterDefinition(valueParameterDefinition)
    }
    
    // value.period
    if let valuePeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .valuePeriod) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valuePeriod, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .period(valuePeriod)
    }
    // value.positiveInteger
    
    if let valuePositiveInteger = try AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: .valuePositiveInteger, auxKey: ._valuePositiveInteger) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valuePositiveInteger, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .positiveInteger(valuePositiveInteger)
    }
    
    // value.quantity
    if let valueQuantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .valueQuantity) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueQuantity, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .quantity(valueQuantity)
    }
    
    // value.range
    if let valueRange = try Range(from: codingKeyContainer, forKeyIfPresent: .valueRange) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRange, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .range(valueRange)
    }
    
    // value.ratio
    if let valueRatio = try Ratio(from: codingKeyContainer, forKeyIfPresent: .valueRatio) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRatio, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .ratio(valueRatio)
    }
    
    // value.reference
    if let valueReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .valueReference) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueReference, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      
      tValue = .reference(valueReference)
    }
    
    // value.relatedArtifact
    if let valueRelatedArtifact = try RelatedArtifact(from: codingKeyContainer, forKeyIfPresent: .valueRelatedArtifact) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueRelatedArtifact, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .relatedArtifact(valueRelatedArtifact)
    }
    
    // value.sampledData
    if let valueSampledData = try SampledData(from: codingKeyContainer, forKeyIfPresent: .valueSampledData) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueSampledData, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .sampledData(valueSampledData)
    }
    
    // value.signature
    if let valueSignature = try Signature(from: codingKeyContainer, forKeyIfPresent: .valueSignature) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueSignature, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .signature(valueSignature)
    }
    
    // value.string
    if let valueString = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .valueString, auxKey: ._valueString) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueString, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .string(valueString)
    }
    
    // value.time
    if let valueTime = try AlexandriaHRMPrimitive<AlexandriaHRMTime>(from: codingKeyContainer, forKeyIfPresent: .valueTime, auxKey: ._valueTime) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueTime, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .time(valueTime)
    }
    
    // value.timing
    if let valueTiming = try Timing(from: codingKeyContainer, forKeyIfPresent: .valueTiming) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueTiming, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .timing(valueTiming)
    }
    
    // value.triggerDefinition
    if let valueTriggerDefinition = try TriggerDefinition(from: codingKeyContainer, forKeyIfPresent: .valueTriggerDefinition) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueTriggerDefinition, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .triggerDefinition(valueTriggerDefinition)
    }
    
    // value.unsignedInteger
    if let valueUnsignedInteger = try AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>(from: codingKeyContainer, forKeyIfPresent: .valueUnsignedInteger, auxKey: ._valueUnsignedInteger) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUnsignedInteger, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .unsignedInteger(valueUnsignedInteger)
    }
    
    // value.uri
    if let valueUri = try AlexandriaHRMPrimitive<AlexandriaHRMURI>(from: codingKeyContainer, forKeyIfPresent: .valueUri, auxKey: ._valueUri) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUri, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .uri(valueUri)
    }
    
    // value.url
    if let valueUrl = try AlexandriaHRMPrimitive<AlexandriaHRMURI>(from: codingKeyContainer, forKeyIfPresent: .valueUrl, auxKey: ._valueUrl) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUrl, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .url(valueUrl)
    }
    
    // value.usageContext
    if let valueUsageContext = try UsageContext(from: codingKeyContainer, forKeyIfPresent: .valueUsageContext) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUsageContext, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .usageContext(valueUsageContext)
    }
    
    // value.uuid
    if let valueUuid = try AlexandriaHRMPrimitive<AlexandriaHRMURI>(from: codingKeyContainer, forKeyIfPresent: .valueUuid, auxKey: ._valueUuid) {
      if tValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueUuid, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tValue = .uuid(valueUuid)
    }
    
    self.label = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKey: .label, auxKey: ._label)
    self.value = tValue!
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    switch value {
    case .address(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueAddress)
    case .age(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueAge)
    case .annotation(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueAnnotation)
    case .attachment(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueAttachment)
    case .base64Binary(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueBase64binary, auxKey: ._valueBase64binary)
    case .boolean(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueBoolean, auxKey: .valueBoolean)
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
    case .positiveInteger(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valuePositiveInteger, auxKey: ._valuePositiveInteger)
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
      try _value.encode(on: &codingKeyContainer, forKey: .valueString, auxKey: .valueString)
    case .time(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueTime, auxKey: ._valueTime)
    case .timing(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueTiming)
    case .triggerDefinition(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueTriggerDefinition)
    case .unsignedInteger(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueUnsignedInteger, auxKey: ._valueUnsignedInteger)
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
}
