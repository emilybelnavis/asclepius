//
//  CapabilityStatementRestResourceOperation.swift
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
 Definition of an operation or a named query together with its parameters and their meaning and type.
 Consult the definition of the operation for details about how to invoke the operaion and the parameters
 */
open class CapabilityStatementRestResourceOperation: BackboneElement {
  /// Name that invokes the operation/query
  public var name: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
  /// The defined operation/query
  public var definition: AlexandriaHRMPrimitive<Canonical>
  
  /// Specific details about operation behaviour
  public var documentation: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  public init(name: AlexandriaHRMPrimitive<AlexandriaHRMString>, definition: AlexandriaHRMPrimitive<Canonical>) {
    self.name = name
    self.definition = definition
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    name: AlexandriaHRMPrimitive<AlexandriaHRMString>,
    definition: AlexandriaHRMPrimitive<Canonical>,
    documentation: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil
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
    
    self.name = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKey: .name, auxKey: ._name)
    self.definition = try AlexandriaHRMPrimitive<Canonical>(from: codingKeyContainer, forKey: .definition, auxKey: .definition)
    self.documentation = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .documentation, auxKey: ._documentation)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try name.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try definition.encode(on: &codingKeyContainer, forKey: .definition, auxKey: ._definition)
    try documentation?.encode(on: &codingKeyContainer, forKey: .documentation, auxKey: ._documentation)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(name)
    hasher.combine(definition)
    hasher.combine(documentation)
  }
}
