//
//  CoverageClass.swift
//  Asclepius
//  Module: STU3
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

/// Additional Coverage Classification;  A suite of underwriter specific classifiers
open class CoverageClass: BackboneElement {
  /// Type of class such as "group" or "plan"
  public var type: CodeableConcept
  
  /// Value associated with the type
  public var value: AsclepiusPrimitive<AsclepiusString>
  
  /// Human readable description of the type and value
  public var name: AsclepiusPrimitive<AsclepiusString>?
  
  public init(type: CodeableConcept, value: AsclepiusPrimitive<AsclepiusString>) {
    self.type = type
    self.value = value
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    type: CodeableConcept,
    value: AsclepiusPrimitive<AsclepiusString>,
    name: AsclepiusPrimitive<AsclepiusString>? = nil
  ) {
    self.init(type: type, value: value)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
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
    
    self.type = try CodeableConcept(from: codingKeyContainer, forKey: .type)
    self.value = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .value, auxKey: ._value)
    self.name = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .name, auxKey: ._name)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &codingKeyContainer, forKey: .type)
    try value.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    try name?.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
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
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(value)
    hasher.combine(name)
  }
}
