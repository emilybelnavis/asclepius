//
//  CapabilityStatementRestResourceOperation.swift
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
 Definition of an operation or a named query together with its parameters and their meaning and type.
 Consult the definition of the operation for details about how to invoke the operaion and the parameters
 */
open class CapabilityStatementRestResourceOperation: BackboneElement {
  /// Name that invokes the operation/query
  public var name: AsclepiusPrimitive<AsclepiusString>
  
  /// The defined operation/query
  public var definition: AsclepiusPrimitive<Canonical>
  
  /// Specific details about operation behaviour
  public var documentation: AsclepiusPrimitive<AsclepiusString>?
  
  public init(name: AsclepiusPrimitive<AsclepiusString>, definition: AsclepiusPrimitive<Canonical>) {
    self.name = name
    self.definition = definition
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    name: AsclepiusPrimitive<AsclepiusString>,
    definition: AsclepiusPrimitive<Canonical>,
    documentation: AsclepiusPrimitive<AsclepiusString>? = nil
  ) {
    self.init(name: name, definition: definition)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.documentation = documentation
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case name; case _name
    case definition; case _definition
    case documentation; case _documentation
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .name, auxKey: ._name)
    self.definition = try AsclepiusPrimitive<Canonical>(from: codingKeyContainer, forKey: .definition, auxKey: .definition)
    self.documentation = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .documentation, auxKey: ._documentation)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try name.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try definition.encode(on: &codingKeyContainer, forKey: .definition, auxKey: ._definition)
    try documentation?.encode(on: &codingKeyContainer, forKey: .documentation, auxKey: ._documentation)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementRestResourceOperation else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return name == _other.name
    && definition == _other.definition
    && documentation == _other.documentation
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(name)
    hasher.combine(definition)
    hasher.combine(documentation)
  }
}
