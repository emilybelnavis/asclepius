//
//  DeviceDefinitionMaterial.swift
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
 A substance used to create the material(s) of which the device is made
 */
open class DeviceDefinitionMaterial: BackboneElement {
  /// The substance
  public var substance: CodableConcept
  
  /// Indicates an alternative material of the device
  public var alternate: FHIRKitPrimitive<FHIRKitBool>?
  
  /// Whether the substance is a known or suspected allergen
  public var allergenicIndicator: FHIRKitPrimitive<FHIRKitBool>?
  
  public init(substance: CodableConcept) {
    self.substance = substance
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    substance: CodableConcept,
    alternate: FHIRKitPrimitive<FHIRKitBool>? = nil,
    allergenicIndicator: FHIRKitPrimitive<FHIRKitBool>? = nil
  ) {
    self.init(substance: substance)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.alternate = alternate
    self.allergenicIndicator = allergenicIndicator
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case substance
    case alternate; case _alternate
    case allergenicIndicator; case _allergenicIndicator
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.substance = try CodableConcept(from: codingKeyContainer, forKey: .substance)
    self.alternate = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .alternate, auxKey: ._alternate)
    self.allergenicIndicator = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .allergenicIndicator, auxKey: ._allergenicIndicator)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try substance.encode(on: &codingKeyContainer, forKey: .substance)
    try alternate?.encode(on: &codingKeyContainer, forKey: .alternate, auxKey: ._alternate)
    try allergenicIndicator?.encode(on: &codingKeyContainer, forKey: .allergenicIndicator, auxKey: ._allergenicIndicator)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DeviceDefinitionMaterial else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return substance == _other.substance
    && alternate == _other.alternate
    && allergenicIndicator == _other.allergenicIndicator
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(substance)
    hasher.combine(alternate)
    hasher.combine(allergenicIndicator)
  }
}
