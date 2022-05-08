//
//  ElementDefinition.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

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
  
  /// All possible types for `fixed[x]`
  public enum FixedX: Hashable {
    case address(Address)
    case age(Age)
    case annotation(Annotation)
    case attachment(Attachment)
    case base64Binary(AlexandriaHRMPrimitive<AlexandriaHRMBase64Binary>)
    case boolean(AlexandriaHRMPrimitive<AlexandriaHRMBool>)
    case canonical(AlexandriaHRMPrimitive<Canonical>)
    case code(AlexandriaHRMPrimitive<AlexandriaHRMString>)
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
  
  /// All possible types for `maxValue`
  public enum MaxValueX: Hashable {
    case date(AlexandriaHRMPrimitive<AlexandriaHRMDate>)
    case dateTime(AlexandriaHRMPrimitive<AlexandriaHRMDateTime>)
    case decimal(AlexandriaHRMPrimitive<AlexandriaHRMDecimal>)
    case instant(AlexandriaHRMPrimitive<AlexandriaHRMInstant>)
    case integer(AlexandriaHRMPrimitive<AlexandriaHRMInteger>)
    case positiveInteger(AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>)
    case quantity(Quantity)
    case time(AlexandriaHRMPrimitive<AlexandriaHRMTime>)
    case unsignedInteger(AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>)
  }
  
  /// All possible types for `minValue`
  public enum MinValueX: Hashable {
    case date(AlexandriaHRMPrimitive<AlexandriaHRMDate>)
    case dateTime(AlexandriaHRMPrimitive<AlexandriaHRMDateTime>)
    case decimal(AlexandriaHRMPrimitive<AlexandriaHRMDecimal>)
    case instant(AlexandriaHRMPrimitive<AlexandriaHRMInstant>)
    case integer(AlexandriaHRMPrimitive<AlexandriaHRMInteger>)
    case positiveInteger(AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>)
    case quantity(Quantity)
    case time(AlexandriaHRMPrimitive<AlexandriaHRMTime>)
    case unsignedInteger(AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>)
  }
  
  /// All possible types for `pattern[x]`
  public enum PatternX: Hashable {
    case address(Address)
    case age(Age)
    case annotation(Annotation)
    case attachment(Attachment)
    case base64Binary(AlexandriaHRMPrimitive<AlexandriaHRMBase64Binary>)
    case boolean(AlexandriaHRMPrimitive<AlexandriaHRMBool>)
    case canonical(AlexandriaHRMPrimitive<Canonical>)
    case code(AlexandriaHRMPrimitive<AlexandriaHRMString>)
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
    case uri(AlexandriaHRMPrimitive<AlexandriaHRMURI>)
    case url(AlexandriaHRMPrimitive<AlexandriaHRMURI>)
    case usageContext(UsageContext)
    case uuid(AlexandriaHRMPrimitive<AlexandriaHRMURI>)
  }
  
  /// Path of the element in the hierarchy of elements
  public var path: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
  /// Codes that define how this element is represented in instances when the deviation varies from the normal case
  public var representation: [AlexandriaHRMPrimitive<PropertyRepresentation>]?
  
  /// Name for this particular element (in a set of slices)
  public var sliceName: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// If this slice definition constrains an inherited slice definition (or not)
  public var sliceIsConstraining: AlexandriaHRMPrimitive<AlexandriaHRMBool>?
  
  /// Name for element prompt or to display with
  public var label: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Corresponding codes in terminologies
  public var code: [Coding]?
  
  /// This element is sliced, slices follow
  public var slicing: ElementDefinitionSlicing?
  
  /// Concise definition for space-constrained presentation
  public var short: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Full formal definitoin as narrative text
  public var definition: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Comments about the use of this element
  public var comment: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Why this resource has been created
  public var requirements: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Other names
  public var alias: [AlexandriaHRMPrimitive<AlexandriaHRMString>?]
  
  /// Minimum cardinality
  public var min: AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>?
  
  /// Maximum cardinality (a number or *)
  public var max: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Base definitoin information for tools
  public var base: ElementDefinitionBase?
  
  /// Reference to definition of content for the element
  public var contentReference: AlexandriaHRMPrimitive<AlexandriaHRMURI>?
  
  /// Data type and Profile for this element
  public var type: [ElementDefinitionType]?
  
  /// Specified value if missing from instance (`defaultValue[x]`)
  public var defaultValue: DefaultValueX?
  
  /// Implicit meaning when this element is meaning
  public var meaningWhenMissing: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// What the order of the elements means
  public var orderMeaning: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
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
  public var maxLength: AlexandriaHRMPrimitive<AlexandriaHRMInteger>?
  
  /// Reference to invariant about presence
  public var condition: [AlexandriaHRMPrimitive<AlexandriaHRMString>]?
  
  /// Condition that must evaluate to `true`
  public var constraint: [ElementDefinitionConstraint]?
  
  /// If the element must be supported
  public var mustSupport: AlexandriaHRMPrimitive<AlexandriaHRMBool>?
  
  /// If this modifies the meaning of other elements
  public var isModifier: AlexandriaHRMPrimitive<AlexandriaHRMBool>?
  
  /// Reason that this modifier is marked as a modifier
  public var isModifierReason: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Include when `_summary = true`?
  public var isSummary: AlexandriaHRMPrimitive<AlexandriaHRMBool>?
  
  /// ValueSet details if this is coded
  public var binding: ElementDefinitionBinding?
  
  /// Map element to another set of definitions
  public var mapping: [ElementDefinitionMapping]?
}
