//
//  DeviceDefinitionProperty.swift
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
 The actual configuration settings of a device as it actually operates (e.g regulation status, time properties)
 */
open class DeviceDefinitionProperty: BackboneElement {
  /// Code that specifies the property `DeviceDefinitionPropertyCode` (extensible
  public var type: CodableConcept
  
  /// Property value as a quantity
  public var valueQuantity: [Quantity]?
  
  /// Property value as a code (e.g. NTP4 (synced to NTP))
  public var valueCode: [CodableConcept]?
  
  public init(type: CodableConcept) {
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: CodableConcept,
    valueQuantity: [Quantity]? = nil,
    valueCode: [CodableConcept]? = nil
  ) {
    self.init(type: type)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.valueQuantity = valueQuantity
    self.valueCode = valueCode
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type
    case valueQuantity
    case valueCode
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try CodableConcept(from: codingKeyContainer, forKey: .type)
    self.valueQuantity = try [Quantity](from: codingKeyContainer, forKeyIfPresent: .valueQuantity)
    self.valueCode = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .valueCode)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &codingKeyContainer, forKey: .type)
    try valueQuantity?.encode(on: &codingKeyContainer, forKey: .valueQuantity)
    try valueCode?.encode(on: &codingKeyContainer, forKey: .valueCode)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DeviceDefinitionProperty else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && valueQuantity == _other.valueQuantity
    && valueCode == _other.valueCode
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(valueQuantity)
    hasher.combine(valueCode)
  }
}

