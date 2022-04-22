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
  public enum Value: Hashable {
    case address(Address)
    case age(Age)
    case annotation(Annotation)
    case attachment(Attachment)
    case base64Binary(FHIRKitPrimitive<FHIRKitBase64Binary>)
    case boolean(FHIRKitPrimitive<FHIRKitBool>)
    case canonical(FHIRKitPrimitive<Canonical>)
    case code(FHIRKitPrimitive<FHIRKitString>)
    case codeableConcept(CodableConcept)
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
  
  /// identifies the meaning of the
  public var url: FHIRKitPrimitive<FHIRKitURI>
  
  /// value of extension
  public init(url: FHIRKitPrimitive<FHIRKitURI>) {
    self.url = url
    super.init()
  }
  
  public convenience init(`extension`: [Extension]? = nil, id: FHIRKitPrimitive<FHIRKitString>? = nil, url: FHIRKitPrimitive<FHIRKitURI>, value: Value? = nil) {
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
  
  /// Initializer for Decodable
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    // Decode all the properties
    self.url = try FHIRKitPrimitive<FHIRKitURI>(from: _container, forKey: .url, auxiliaryKey: ._url)
  }
}
