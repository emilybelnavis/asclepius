//
//  ElementDefinitionBinding.swift
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
 ValueSet details if this is coded; Binds to a value set if this element is coded (`code`, `Coding`, `CodableConcept`,
 `Quantity`), or the data types (`string`, `uri`)
 */
open class ElementDefinitionBinding: Element {
  /// Indicates the degree of conformance expectations associated with this binding (the degree to which the
  /// provided value set must be adhered to in the instances.)
  public var strength: FHIRKitPrimitive<BindingStrength>
  
  /// Human explanation of the value set
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  
  /// Source of the value set
  public var valueSet: FHIRKitPrimitive<Canonical>?
  
  public init(strength: FHIRKitPrimitive<BindingStrength>) {
    self.strength = strength
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    strength: FHIRKitPrimitive<BindingStrength>,
    fhirDescription: FHIRKitPrimitive<FHIRKitString>? = nil,
    valueSet: FHIRKitPrimitive<Canonical>? = nil
  ) {
    self.init(strength: strength)
    self.fhirExtension = fhirExtension
    self.id = id
    self.fhirDescription = fhirDescription
    self.valueSet = valueSet
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case strength; case _strength
    case fhirDescription; case _fhirDescription
    case valueSet; case _valueSet
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.strength = try FHIRKitPrimitive<BindingStrength>(from: codingKeyContainer, forKey: .strength, auxKey: ._strength)
    self.fhirDescription = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.valueSet = try FHIRKitPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .valueSet, auxKey: ._valueSet)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try strength.encode(on: &codingKeyContainer, forKey: .strength, auxKey: ._strength)
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try valueSet?.encode(on: &codingKeyContainer, forKey: .valueSet, auxKey: ._valueSet)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ElementDefinitionBinding else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return strength == _other.strength
    && fhirDescription == _other.fhirDescription
    && valueSet == _other.valueSet
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(strength)
    hasher.combine(fhirDescription)
    hasher.combine(valueSet)
  }
}
