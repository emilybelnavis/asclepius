//
//  CoverageClass.swift
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

/// Additional Coverage Classification;  A suite of underwriter specific classifiers
open class CoverageClass: BackboneElement {
  /// Type of class such as "group" or "plan"
  public var type: CodableConcept
  
  /// Value associated with the type
  public var value: FHIRKitPrimitive<FHIRKitString>
  
  /// Human readable description of the type and value
  public var name: FHIRKitPrimitive<FHIRKitString>?
  
  public init(type: CodableConcept, value: FHIRKitPrimitive<FHIRKitString>) {
    self.type = type
    self.value = value
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: CodableConcept,
    value: FHIRKitPrimitive<FHIRKitString>,
    name: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init(type: type, value: value)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.name = name
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type
    case value; case _value
    case name; case _name
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try CodableConcept(from: codingKeyContainer, forKey: .type)
    self.value = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .value, auxKey: ._value)
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .name, auxKey: ._name)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &codingKeyContainer, forKey: .type)
    try value.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    try name?.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CoverageClass else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && value == _other.value
    && name == _other.name
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(value)
    hasher.combine(name)
  }
}
