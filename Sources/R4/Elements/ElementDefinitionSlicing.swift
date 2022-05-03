//
//  ElementDefinitionSlicing.swift
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
 This is element is sliced, slices to follow; Indicates that the element is sliced into a set of alternative definitions
 (i.e. in a `StructureDefinition`, there are multiple different constraints on a single element in the base
 resource). Slicing can be used in any resource that has cardinality `..*` on the base resource, or any resource
 with a choice of types. The set of slices is any elements that come after this in the element sequence that have
 the same path, until a shorter path occurs (the shorter path terminates the set).
 */
open class ElementDefinitionSlicing: Element {
  /// Element values that are used to distinguish the slices
  public var discriminator: [ElementDefinitionSlicingDiscriminator]?
  
  /// Text description of how slicing works (or not)
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  
  /// If elements must be in the same order as slices
  public var ordered: FHIRKitPrimitive<FHIRKitBool>?
  
  /// Whether additional slices are allowed or not. When the slices are ordered, profile authors can also
  /// specifiy that additional slices are only allowed at the end.
  public var rules: FHIRKitPrimitive<SlicingRules>
  
  public init(rules: FHIRKitPrimitive<SlicingRules>) {
    self.rules = rules
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    discriminator: [ElementDefinitionSlicingDiscriminator]? = nil,
    fhirDescription: FHIRKitPrimitive<FHIRKitString>? = nil,
    ordered: FHIRKitPrimitive<FHIRKitBool>? = nil,
    rules: FHIRKitPrimitive<SlicingRules>
  ) {
    self.init(rules: rules)
    self.fhirExtension = fhirExtension
    self.id = id
    self.discriminator = discriminator
    self.fhirDescription = fhirDescription
    self.ordered = ordered
    self.rules = rules
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case discriminator
    case fhirDescription; case _fhirDescription
    case ordered; case _ordered
    case rules; case _rules
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.discriminator = try [ElementDefinitionSlicingDiscriminator](from: codingKeyContainer, forKeyIfPresent: .discriminator)
    self.fhirDescription = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.ordered = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .ordered, auxKey: ._ordered)
    self.rules = try FHIRKitPrimitive<SlicingRules>(from: codingKeyContainer, forKey: .rules, auxKey: ._rules)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try discriminator?.encode(on: &codingKeyContainer, forKey: .discriminator)
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try ordered?.encode(on: &codingKeyContainer, forKey: .ordered, auxKey: ._ordered)
    try rules.encode(on: &codingKeyContainer, forKey: .rules, auxKey: ._rules)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ElementDefinitionSlicing else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return discriminator == _other.discriminator
    && fhirDescription == _other.fhirDescription
    && ordered == _other.ordered
    && rules == _other.rules
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(discriminator)
    hasher.combine(fhirDescription)
    hasher.combine(ordered)
    hasher.combine(rules)
  }
}
