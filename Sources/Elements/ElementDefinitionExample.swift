//
//  ElementDefinitionExample.swift
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

open class ElementDefinitionExample: Element {
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
    case positiveInteger(FHIRKitPrimitive<FHIRKitPositiveInteger>)
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
    case unsignedInteger(FHIRKitPrimitive<FHIRKitUnsignedInteger>)
    case uri(FHIRKitPrimitive<FHIRKitURI>)
    case url(FHIRKitPrimitive<FHIRKitURI>)
    case usageContext(UsageContext)
    case uuid(FHIRKitPrimitive<FHIRKitURI>)
  }
  
  /// Describes the purpose of this example
  public var label: FHIRKitPrimitive<FHIRKitString>
  
  /// Value of Example (`value[x]`)
  public var value: ValueX
}
