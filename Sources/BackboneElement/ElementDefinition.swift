//
//  ElementDefinition.swift
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
 Definition of an element in a resource or extension; Captures constraints on each element within the resource,
 profile, or extension
 */
open class ElementDefinition: BackboneElement {
  /// All possible types for `defaultValue[x]`
  public enum DefaultValueX: Hashable {
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
  
  /// All possible types for `fixed[x]`
  public enum FixedX: Hashable {
    case address(Address)
    case age(Age)
    case annotation(Annotation)
    case attachment(Attachment)
    case base64Binary(FHIRKitPrimitive<FHIRKitBase64Binary>)
    case boolean(FHIRKitPrimitive<FHIRKitBool>)
    case canonical(FHIRKitPrimitive<Canonical>)
    case code(FHIRKitPrimitive<FHIRKitString>)
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
  
  /// All possible types for `maxValue`
  public enum MaxValueX: Hashable {
    case date(FHIRKitPrimitive<FHIRKitDate>)
    case dateTime(FHIRKitPrimitive<FHIRKitDateTime>)
    case decimal(FHIRKitPrimitive<FHIRKitDecimal>)
    case instant(FHIRKitPrimitive<FHIRKitInstant>)
    case integer(FHIRKitPrimitive<FHIRKitInteger>)
    case positiveInteger(FHIRKitPrimitive<FHIRKitPositiveInteger>)
    case quantity(Quantity)
    case time(FHIRKitPrimitive<FHIRKitTime>)
    case unsignedInteger(FHIRKitPrimitive<FHIRKitUnsignedInteger>)
  }
  
  /// All possible types for `minValue`
  public enum MinValueX: Hashable {
    case date(FHIRKitPrimitive<FHIRKitDate>)
    case dateTime(FHIRKitPrimitive<FHIRKitDateTime>)
    case decimal(FHIRKitPrimitive<FHIRKitDecimal>)
    case instant(FHIRKitPrimitive<FHIRKitInstant>)
    case integer(FHIRKitPrimitive<FHIRKitInteger>)
    case positiveInteger(FHIRKitPrimitive<FHIRKitPositiveInteger>)
    case quantity(Quantity)
    case time(FHIRKitPrimitive<FHIRKitTime>)
    case unsignedInteger(FHIRKitPrimitive<FHIRKitUnsignedInteger>)
  }
  
  /// All possible types for `pattern[x]`
  public enum PatternX: Hashable {
    case address(Address)
    case age(Age)
    case annotation(Annotation)
    case attachment(Attachment)
    case base64Binary(FHIRKitPrimitive<FHIRKitBase64Binary>)
    case boolean(FHIRKitPrimitive<FHIRKitBool>)
    case canonical(FHIRKitPrimitive<Canonical>)
    case code(FHIRKitPrimitive<FHIRKitString>)
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
    case uri(FHIRKitPrimitive<FHIRKitURI>)
    case url(FHIRKitPrimitive<FHIRKitURI>)
    case usageContext(UsageContext)
    case uuid(FHIRKitPrimitive<FHIRKitURI>)
  }
  
  /// Path of the element in the hierarchy of elements
  public var path: FHIRKitPrimitive<FHIRKitString>
  
  /// Codes that define how this element is represented in instances when the deviation varies from the normal case
  public var representation: [FHIRKitPrimitive<PropertyRepresentation>]?
  
  /// Name for this particular element (in a set of slices)
  public var sliceName: FHIRKitPrimitive<FHIRKitString>?
  
  /// If this slice definition constrains an inherited slice definition (or not)
  public var sliceIsConstraining: FHIRKitPrimitive<FHIRKitBool>?
  
  /// Name for element prompt or to display with
  public var label: FHIRKitPrimitive<FHIRKitString>?
  
  /// Corresponding codes in terminologies
  public var code: [Coding]?
  
  /// This element is sliced, slices follow
  public var slicing: ElementDefinitionSlicing?
  
  /// Concise definition for space-constrained presentation
  public var short: FHIRKitPrimitive<FHIRKitString>?
  
  /// Full formal definitoin as narrative text
  public var definition: FHIRKitPrimitive<FHIRKitString>?
  
  /// Comments about the use of this element
  public var comment: FHIRKitPrimitive<FHIRKitString>?
  
  /// Why this resource has been created
  public var requirements: FHIRKitPrimitive<FHIRKitString>?
  
  /// Other names
  public var alias: [FHIRKitPrimitive<FHIRKitString>?]
  
  /// Minimum cardinality
  public var min: FHIRKitPrimitive<FHIRKitUnsignedInteger>?
  
  /// Maximum cardinality (a number or *)
  public var max: FHIRKitPrimitive<FHIRKitString>?
  
  /// Base definitoin information for tools
  public var base: ElementDefinitionBase?
  
  /// Reference to definition of content for the element
  public var contentReference: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Data type and Profile for this element
  public var type: [ElementDefinitionType]?
  
  /// Specified value if missing from instance (`defaultValue[x]`)
  public var defaultValue: DefaultValueX?
  
  /// Implicit meaning when this element is meaning
  public var meaningWhenMissing: FHIRKitPrimitive<FHIRKitString>?
  
  /// What the order of the elements means
  public var orderMeaning: FHIRKitPrimitive<FHIRKitString>
  
  /// Value must be exactly this (`value[x]`)
  public var fixed: FixedX?
  
  /// Value must have at least these property values (`pattern[x]`)
  public var pattern: PatternX?
  
  /// Example value (as defined for type)
  public var example: [ElementDefinitionExample]?
  
  /// Minimum allowed value (for some types) (`minValue[x]`)
  public var minValue: MinValueX?
  
  /// Maximum allowed value (for some types) (`maxValue[x]`)
  public var maxValue: MaxValueX?
  
  /// Maximum length for strings
  public var maxLength: FHIRKitPrimitive<FHIRKitInteger>?
  
  /// Reference to invariant about presence
  public var condition: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// Condition that must evaluate to `true`
  public var constraint: [ElementDefinitionConstraint]?
  
  /// If the element must be supported
  public var mustSupport: FHIRKitPrimitive<FHIRKitBool>?
  
  /// If this modifies the meaning of other elements
  public var isModifier: FHIRKitPrimitive<FHIRKitBool>?
  
  /// Reason that this modifier is marked as a modifier
  public var isModifierReason: FHIRKitPrimitive<FHIRKitString>?
  
  /// Include when `_summary = true`?
  public var isSummary: FHIRKitPrimitive<FHIRKitBool>?
  
  /// ValueSet details if this is coded
  public var binding: ElementDefinitionBinding?
  
  /// Map element to another set of definitions
  public var mapping: [ElementDefinitionMapping]?
}
