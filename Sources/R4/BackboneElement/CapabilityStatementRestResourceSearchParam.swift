//
//  CapabilityStatementRestResourceSearchParam.swift
//  FHIRKit
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

import FHIRKitCore

/**
 Search parameters for implementations to support and/or make use of - either references to ones defined in
 the specification or additional ondes defined for/by the implementation
 */
open class CapabilityStatementRestResourceSearchParam: BackboneElement {
  /// Name of the search parameter
  public var name: FHIRKitPrimitive<FHIRKitString>
  
  /// Source of the definition for parameter
  public var definition: FHIRKitPrimitive<Canonical>?
  
  /// The type of value a search parameter refers to and how the content is interpreted
  public var type: FHIRKitPrimitive<SearchParamType>
  
  /// Server-specific usage
  public var documentation: FHIRKitPrimitive<FHIRKitString>?
  
  public init(name: FHIRKitPrimitive<FHIRKitString>, type: FHIRKitPrimitive<SearchParamType>) {
    self.name = name
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    name: FHIRKitPrimitive<FHIRKitString>,
    definition: FHIRKitPrimitive<Canonical>? = nil,
    type: FHIRKitPrimitive<SearchParamType>,
    documentation: FHIRKitPrimitive<FHIRKitString>?
  ) {
    self.init(name: name, type: type)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.definition = definition
    self.documentation = documentation
  }
  
  // MARK: - Coding
  private enum CodingKeys: String, CodingKey {
    case name; case _name
    case definition; case _definition
    case type; case _type
    case documentation; case _documentation
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .name, auxKey: ._name)
    self.definition = try FHIRKitPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .definition, auxKey: ._definition)
    self.type = try FHIRKitPrimitive<SearchParamType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.documentation = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .documentation, auxKey: ._documentation)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try name.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try definition?.encode(on: &codingKeyContainer, forKey: .definition, auxKey: ._definition)
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try documentation?.encode(on: &codingKeyContainer, forKey: .documentation, auxKey: ._documentation)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementRestResourceSearchParam else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return name == _other.name
    && definition == _other.definition
    && type == _other.type
    && documentation == _other.documentation
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(name)
    hasher.combine(definition)
    hasher.combine(type)
    hasher.combine(documentation)
  }
}
