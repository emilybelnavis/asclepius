//
//  ElementDefinition.swift
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

/**
 Definition of an element in a resource or extension; Captures constraints on each element within the resource,
 profile, or extension
 */
open class ElementDefinition: BackboneElement {
  /// Path of the element in the hierarchy of elements
  public var path: AsclepiusPrimitive<AsclepiusString>
  
  /// Codes that define how this element is represented in instances when the deviation varies from the normal case
  public var representation: [AsclepiusPrimitive<PropertyRepresentation>]?
  
  /// Name for this particular element (in a set of slices)
  public var sliceName: AsclepiusPrimitive<AsclepiusString>?
  
  /// If this slice definition constrains an inherited slice definition (or not)
  public var sliceIsConstraining: AsclepiusPrimitive<AsclepiusBool>?
  
  /// Name for element prompt or to display with
  public var label: AsclepiusPrimitive<AsclepiusString>?
  
  /// Corresponding codes in terminologies
  public var code: [Coding]?
  
  /// This element is sliced, slices follow
  public var slicing: ElementDefinitionSlicing?
  
  /// Concise definition for space-constrained presentation
  public var short: AsclepiusPrimitive<AsclepiusString>?
  
  /// Full formal definitoin as narrative text
  public var definition: AsclepiusPrimitive<AsclepiusString>?
  
  /// Comments about the use of this element
  public var comment: AsclepiusPrimitive<AsclepiusString>?
  
  /// Why this resource has been created
  public var requirements: AsclepiusPrimitive<AsclepiusString>?
  
  /// Other names
  public var alias: [AsclepiusPrimitive<AsclepiusString>]?
  
  /// Minimum cardinality
  public var min: AsclepiusPrimitive<AsclepiusUnsignedInteger>?
  
  /// Maximum cardinality (a number or *)
  public var max: AsclepiusPrimitive<AsclepiusString>?
  
  /// Base definitoin information for tools
  public var base: ElementDefinitionBase?
  
  /// Reference to definition of content for the element
  public var contentReference: AsclepiusPrimitive<AsclepiusURI>?
  
  /// Data type and Profile for this element
  public var type: [ElementDefinitionType]?
  
  /// Specified value if missing from instance (`defaultValue[x]`)
  public var defaultValue: ElementDefinitionValueX?
  
  /// Implicit meaning when this element is meaning
  public var meaningWhenMissing: AsclepiusPrimitive<AsclepiusString>?
  
  /// What the order of the elements means
  public var orderMeaning: AsclepiusPrimitive<AsclepiusString>?
  
  /// Value must be exactly this (`value[x]`)
  public var fixed: ElementDefinitionValueX?
  
  /// Value must have at least these property values (`pattern[x]`)
  public var pattern: ElementDefinitionValueX?
  
  /// Example value (as defined for type)
  public var example: [ElementDefinitionExample]?
  
  /// Minimum allowed value (for some types) (`minValue[x]`)
  public var minValue: ElementDefinitionMinMaxValueX?
  
  /// Maximum allowed value (for some types) (`maxValue[x]`)
  public var maxValue: ElementDefinitionMinMaxValueX?
  
  /// Maximum length for strings
  public var maxLength: AsclepiusPrimitive<AsclepiusInteger>?
  
  /// Reference to invariant about presence
  public var condition: [AsclepiusPrimitive<AsclepiusString>]?
  
  /// Condition that must evaluate to `true`
  public var constraint: [ElementDefinitionConstraint]?
  
  /// If the element must be supported
  public var mustSupport: AsclepiusPrimitive<AsclepiusBool>?
  
  /// If this modifies the meaning of other elements
  public var isModifier: AsclepiusPrimitive<AsclepiusBool>?
  
  /// Reason that this modifier is marked as a modifier
  public var isModifierReason: AsclepiusPrimitive<AsclepiusString>?
  
  /// Include when `_summary = true`?
  public var isSummary: AsclepiusPrimitive<AsclepiusBool>?
  
  /// ValueSet details if this is coded
  public var binding: ElementDefinitionBinding?
  
  /// Map element to another set of definitions
  public var mapping: [ElementDefinitionMapping]?
  
  public init(path: AsclepiusPrimitive<AsclepiusString>) {
    self.path = path
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    path: AsclepiusPrimitive<AsclepiusString>,
    representation: [AsclepiusPrimitive<PropertyRepresentation>]? = nil,
    sliceName: AsclepiusPrimitive<AsclepiusString>? = nil,
    sliceIsConstraining: AsclepiusPrimitive<AsclepiusBool>? = nil,
    label: AsclepiusPrimitive<AsclepiusString>? = nil,
    code: [Coding]? = nil,
    slicing: ElementDefinitionSlicing? = nil,
    short: AsclepiusPrimitive<AsclepiusString>? = nil,
    definition: AsclepiusPrimitive<AsclepiusString>? = nil,
    comment: AsclepiusPrimitive<AsclepiusString>? = nil,
    requirements: AsclepiusPrimitive<AsclepiusString>? = nil,
    alias: [AsclepiusPrimitive<AsclepiusString>]? = nil,
    min: AsclepiusPrimitive<AsclepiusUnsignedInteger>? = nil,
    max: AsclepiusPrimitive<AsclepiusString>? = nil,
    base: ElementDefinitionBase? = nil,
    contentReference: AsclepiusPrimitive<AsclepiusURI>? = nil,
    type: [ElementDefinitionType]? = nil,
    defaultValue: ElementDefinitionValueX? = nil,
    meaningWhenMissing: AsclepiusPrimitive<AsclepiusString>? = nil,
    orderMeaning: AsclepiusPrimitive<AsclepiusString>? = nil,
    fixed: ElementDefinitionValueX? = nil,
    pattern: ElementDefinitionValueX? = nil,
    example: [ElementDefinitionExample]? = nil,
    minValue: ElementDefinitionMinMaxValueX? = nil,
    maxValue: ElementDefinitionMinMaxValueX? = nil,
    maxLength: AsclepiusPrimitive<AsclepiusInteger>? = nil,
    condition: [AsclepiusPrimitive<AsclepiusString>]? = nil,
    constraint: [ElementDefinitionConstraint]? = nil,
    mustSupport: AsclepiusPrimitive<AsclepiusBool>? = nil,
    isModifier: AsclepiusPrimitive<AsclepiusBool>? = nil,
    isModifierReason: AsclepiusPrimitive<AsclepiusString>? = nil,
    isSummary: AsclepiusPrimitive<AsclepiusBool>? = nil,
    binding: ElementDefinitionBinding? = nil,
    mapping: [ElementDefinitionMapping]? = nil
  ) {
    self.init(path: path)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.representation = representation
    self.sliceName = sliceName
    self.sliceIsConstraining = sliceIsConstraining
    self.label = label
    self.code = code
    self.slicing = slicing
    self.short = short
    self.definition = definition
    self.comment = comment
    self.requirements = requirements
    self.alias = alias
    self.min = min
    self.max = max
    self.base = base
    self.contentReference = contentReference
    self.type = type
    self.defaultValue = defaultValue
    self.meaningWhenMissing = meaningWhenMissing
    self.orderMeaning = orderMeaning
    self.fixed = fixed
    self.pattern = pattern
    self.example = example
    self.minValue = minValue
    self.maxValue = maxValue
    self.maxLength = maxLength
    self.condition = condition
    self.constraint = constraint
    self.mustSupport = mustSupport
    self.isModifier = isModifier
    self.isModifierReason = isModifierReason
    self.isSummary = isSummary
    self.binding = binding
    self.mapping = mapping
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case path; case _path
    case representation; case _representation
    case sliceName; case _sliceName
    case sliceIsConstraining; case _sliceIsConstraining
    case label; case _label
    case code
    case slicing
    case short; case _short
    case definition; case _definition
    case comment; case _comment
    case requirements; case _requirements
    case alias; case _alias
    case min; case _min
    case max; case _max
    case base
    case contentReference; case _contentReference
    case type
    case defaultValue
    case meaningWhenMissing; case _meaningWhenMissing
    case orderMeaning; case _orderMeaning
    case fixed
    case pattern
    case example
    case minValue
    case maxValue
    case maxLength; case _maxLength
    case condition; case _condition
    case constraint
    case mustSupport; case _mustSupport
    case isModifier; case _isModifier
    case isModifierReason; case _isModifierReason
    case isSummary; case _isSummary
    case binding
    case mapping
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.path = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .path, auxKey: ._path)
    self.representation = try [AsclepiusPrimitive<PropertyRepresentation>](from: codingKeyContainer, forKeyIfPresent: .representation, auxKey: ._representation)
    self.sliceName = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .sliceName, auxKey: ._sliceName)
    self.sliceIsConstraining = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .sliceIsConstraining, auxKey: ._sliceIsConstraining)
    self.label = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .label, auxKey: ._label)
    self.code = try [Coding](from: codingKeyContainer, forKeyIfPresent: .code)
    self.slicing = try ElementDefinitionSlicing(from: codingKeyContainer, forKeyIfPresent: .slicing)
    self.short = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .short, auxKey: ._short)
    self.definition = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .definition, auxKey: ._definition)
    self.comment = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .comment, auxKey: ._comment)
    self.requirements = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .requirements, auxKey: ._requirements)
    self.alias = try [AsclepiusPrimitive<AsclepiusString>](from: codingKeyContainer, forKeyIfPresent: .alias, auxKey: ._alias)
    self.min = try AsclepiusPrimitive<AsclepiusUnsignedInteger>(from: codingKeyContainer, forKeyIfPresent: .min, auxKey: ._min)
    self.max = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .max, auxKey: ._max)
    self.base = try ElementDefinitionBase(from: codingKeyContainer, forKeyIfPresent: .base)
    self.contentReference = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .contentReference, auxKey: ._contentReference)
    self.type = try [ElementDefinitionType](from: codingKeyContainer, forKeyIfPresent: .type)
    self.defaultValue = try ElementDefinitionValueX(from: codingKeyContainer, forKeyIfPresent: .defaultValue)
    self.meaningWhenMissing = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .meaningWhenMissing, auxKey: ._meaningWhenMissing)
    self.orderMeaning = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .orderMeaning, auxKey: ._orderMeaning)
    self.fixed = try ElementDefinitionValueX(from: codingKeyContainer, forKeyIfPresent: .fixed)
    self.pattern = try ElementDefinitionValueX(from: codingKeyContainer, forKeyIfPresent: .pattern)
    self.example = try [ElementDefinitionExample](from: codingKeyContainer, forKeyIfPresent: .example)
    self.minValue = try ElementDefinitionMinMaxValueX(from: codingKeyContainer, forKeyIfPresent: .minValue)
    self.maxValue = try ElementDefinitionMinMaxValueX(from: codingKeyContainer, forKeyIfPresent: .maxValue)
    self.maxLength = try AsclepiusPrimitive<AsclepiusInteger>(from: codingKeyContainer, forKeyIfPresent: .maxLength, auxKey: ._maxLength)
    self.condition = try [AsclepiusPrimitive<AsclepiusString>](from: codingKeyContainer, forKeyIfPresent: .condition, auxKey: ._condition)
    self.constraint = try [ElementDefinitionConstraint](from: codingKeyContainer, forKeyIfPresent: .constraint)
    self.mustSupport = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .mustSupport, auxKey: ._mustSupport)
    self.isModifier = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .isModifier, auxKey: ._isModifier)
    self.isModifierReason = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .isModifierReason, auxKey: ._isModifierReason)
    self.isSummary = try AsclepiusPrimitive<AsclepiusBool>(from: codingKeyContainer, forKeyIfPresent: .isSummary, auxKey: ._isSummary)
    self.binding = try ElementDefinitionBinding(from: codingKeyContainer, forKeyIfPresent: .binding)
    self.mapping = try [ElementDefinitionMapping](from: codingKeyContainer, forKeyIfPresent: .mapping)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try path.encode(on: &codingKeyContainer, forKey: .path, auxKey: ._path)
    try representation?.encode(on: &codingKeyContainer, forKey: .representation, auxKey: ._representation)
    try sliceName?.encode(on: &codingKeyContainer, forKey: .sliceName, auxKey: ._sliceName)
    try sliceIsConstraining?.encode(on: &codingKeyContainer, forKey: .sliceIsConstraining, auxKey: ._sliceIsConstraining)
    try label?.encode(on: &codingKeyContainer, forKey: .label, auxKey: ._label)
    try code?.encode(on: &codingKeyContainer, forKey: .code)
    try slicing?.encode(on: &codingKeyContainer, forKey: .slicing)
    try short?.encode(on: &codingKeyContainer, forKey: .short, auxKey: ._short)
    try definition?.encode(on: &codingKeyContainer, forKey: .definition, auxKey: ._definition)
    try comment?.encode(on: &codingKeyContainer, forKey: .comment, auxKey: ._comment)
    try requirements?.encode(on: &codingKeyContainer, forKey: .requirements, auxKey: ._requirements)
    try alias?.encode(on: &codingKeyContainer, forKey: .alias, auxKey: ._alias)
    try min?.encode(on: &codingKeyContainer, forKey: .min, auxKey: ._min)
    try max?.encode(on: &codingKeyContainer, forKey: .max, auxKey: ._max)
    try base?.encode(on: &codingKeyContainer, forKey: .base)
    try contentReference?.encode(on: &codingKeyContainer, forKey: .contentReference, auxKey: ._contentReference)
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try defaultValue?.encode(on: &codingKeyContainer, forKey: .defaultValue)
    try meaningWhenMissing?.encode(on: &codingKeyContainer, forKey: .meaningWhenMissing, auxKey: ._meaningWhenMissing)
    try orderMeaning?.encode(on: &codingKeyContainer, forKey: .orderMeaning, auxKey: ._orderMeaning)
    try fixed?.encode(on: &codingKeyContainer, forKey: .fixed)
    try pattern?.encode(on: &codingKeyContainer, forKey: .pattern)
    try example?.encode(on: &codingKeyContainer, forKey: .example)
    try minValue?.encode(on: &codingKeyContainer, forKey: .minValue)
    try maxValue?.encode(on: &codingKeyContainer, forKey: .maxValue)
    try maxLength?.encode(on: &codingKeyContainer, forKey: .maxLength, auxKey: ._maxLength)
    try condition?.encode(on: &codingKeyContainer, forKey: .condition, auxKey: ._condition)
    try constraint?.encode(on: &codingKeyContainer, forKey: .constraint)
    try mustSupport?.encode(on: &codingKeyContainer, forKey: .mustSupport, auxKey: ._mustSupport)
    try isModifier?.encode(on: &codingKeyContainer, forKey: .isModifier, auxKey: ._isModifier)
    try isModifierReason?.encode(on: &codingKeyContainer, forKey: .isModifierReason, auxKey: ._isModifierReason)
    try isSummary?.encode(on: &codingKeyContainer, forKey: .isSummary, auxKey: ._isSummary)
    try binding?.encode(on: &codingKeyContainer, forKey: .binding)
    try mapping?.encode(on: &codingKeyContainer, forKey: .mapping)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ElementDefinition else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return path == _other.path
    && representation == _other.representation
    && sliceName == _other.sliceName
    && sliceIsConstraining == _other.sliceIsConstraining
    && label == _other.label
    && code == _other.code
    && slicing == _other.slicing
    && short == _other.short
    && definition == _other.definition
    && comment == _other.comment
    && requirements == _other.requirements
    && alias == _other.alias
    && min == _other.min
    && max == _other.max
    && base == _other.base
    && contentReference == _other.contentReference
    && type == _other.type
    && defaultValue == _other.defaultValue
    && meaningWhenMissing == _other.meaningWhenMissing
    && orderMeaning == _other.orderMeaning
    && fixed == _other.fixed
    && pattern == _other.pattern
    && example == _other.example
    && minValue == _other.minValue
    && maxValue == _other.maxValue
    && maxLength == _other.maxLength
    && condition == _other.condition
    && constraint == _other.constraint
    && mustSupport == _other.mustSupport
    && isModifier == _other.isModifier
    && isModifierReason == _other.isModifierReason
    && isSummary == _other.isSummary
    && binding == _other.binding
    && mapping == _other.mapping
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(path)
    hasher.combine(representation)
    hasher.combine(sliceName)
    hasher.combine(sliceIsConstraining)
    hasher.combine(label)
    hasher.combine(code)
    hasher.combine(slicing)
    hasher.combine(short)
    hasher.combine(definition)
    hasher.combine(comment)
    hasher.combine(requirements)
    hasher.combine(alias)
    hasher.combine(min)
    hasher.combine(max)
    hasher.combine(base)
    hasher.combine(contentReference)
    hasher.combine(type)
    hasher.combine(defaultValue)
    hasher.combine(meaningWhenMissing)
    hasher.combine(orderMeaning)
    hasher.combine(fixed)
    hasher.combine(pattern)
    hasher.combine(example)
    hasher.combine(minValue)
    hasher.combine(maxValue)
    hasher.combine(maxLength)
    hasher.combine(condition)
    hasher.combine(constraint)
    hasher.combine(mustSupport)
    hasher.combine(isModifier)
    hasher.combine(isModifierReason)
    hasher.combine(isSummary)
    hasher.combine(binding)
    hasher.combine(mapping)
  }
}
